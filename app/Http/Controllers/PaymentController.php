<?php

namespace App\Http\Controllers;

use App\Models\Transaction;
use App\Models\Employee;
use App\Models\ExpenseCategory;
use App\Models\Customer;
use App\Models\Payment;
use App\Models\Settings;
use Carbon\Carbon;
use Illuminate\Http\Request;

class PaymentController extends Controller
{
    public function index(Request $request)
    {
        $payments = Payment::search(trim($request->search_query))->orderBy('date', 'DESC')->paginate(20);

        return view('payments.index', [
            'payments' => $payments,
        ]);
    }


    public function create()
    {
        $employees = Employee::oldest()->take(200)->get();
        $customers = Customer::oldest()->take(200)->get();
        $expenseCategories = ExpenseCategory::where('is_active', 1)
        ->get(['id', 'name']);
        return view('payments.create', [
            'customers' => $customers,
            'employees' => $employees,
            'expenseCategories' => $expenseCategories,
            'modes' => Payment::$modes,
            'currency' => Settings::getValue(Settings::CURRENCY_SYMBOL),
        ]);
    }

    public function edit(Payment $payment)
    {
        $customers = Customer::oldest()->take(200)->get();
        $employees = Employee::oldest()->take(200)->get();
        $expenseCategories = ExpenseCategory::where('is_active', 1)
        ->get(['id', 'name']);
        return view('payments.edit', [
            'payment' => $payment,
            'customers' => $customers,
            'employees' => $employees,
            'expenseCategories' => $expenseCategories,
            'modes' => Payment::$modes,
            'currency' => Settings::getValue(Settings::CURRENCY_SYMBOL),
        ]);
    }

    public function store(Request $request)
    {

        $request->validate([
            'customer' => ['nullable', 'string'], // Nullable since only one can be selected
            'employee' => ['nullable', 'string'], // Nullable since only one can be selected
            'expense_category_id' => ['required'],
            'amount' => ['nullable', 'numeric', 'min:0'],
            'comments' => ['nullable', 'string'],
            'date' => ['required', 'date'],
        ]);
        
        // Check if both customer and employee are empty
        if (empty($request->customer) && empty($request->employee)) {
            return back()->withErrors(['error' => 'Either customer or employee must be selected.']);
        }
    
        // Check if both customer and employee are selected (they cannot both be selected)
        if (!empty($request->customer) && !empty($request->employee)) {
            return back()->withErrors(['error' => 'You cannot select both customer and employee at the same time.']);
        }
    
       
        $customerId = $request->customer;
        $employeeId = $request->employee;
        
        $payment = new Payment();
        $payment->expense_category_id = $request->expense_category_id;
        $payment->customer_id = $customerId;
        $payment->employee_id = $employeeId;
        $payment->amount = $request->amount ?? 0;
        $payment->mode = $request->mode;
        $payment->comments = $request->comments;
        $payment->date = $request->date ?? now();
        $payment->save();
    
        // Handle customer transaction only if customer is selected
        if ($customerId) {
            $latestStatement = Transaction::where('customer_id', $customerId)->latest()->first();
            $customerAccount = new Transaction();
            $customerAccount->credit = $payment->amount;
            $customerAccount->debit = 0;
            $customerAccount->customer_id = $customerId;
            $customerAccount->description = $payment->comments;
            $customerAccount->reference_number = $payment->number;
            $customerAccount->save();
        }
    
        return back()->with('success', __('Created'));

    }

    public function update(Request $request, Payment $payment)
    {
        $request->validate([
            'customer' => ['nullable', 'string'],
            'employee' => ['nullable', 'string'],
            'expense_category_id' => ['required'],
            'amount' => ['nullable', 'numeric', 'min:0'],
            'comments' => ['nullable', 'string'],
            'date' => ['required', 'date'],
        ]);
    
        // Validate that either customer or employee is selected, but not both
        if (($request->customer && $request->employee) || (!$request->customer && !$request->employee)) {
            return back()->withErrors(['error' => 'Either customer or employee must be selected, but not both.']);
        }
    
        // Check current entity type
        $wasCustomer = $payment->customer_id !== null;
        $wasEmployee = $payment->employee_id !== null;
    
        // New entity type
        $isCustomer = $request->customer !== null;
        $isEmployee = $request->employee !== null;
    
        // Handle transitions
        if ($wasCustomer && $isEmployee) {
            // Change from Customer to Employee
            Transaction::where('customer_id', $payment->customer_id)
                ->where('reference_number', $payment->number)
                ->delete();
    
            $payment->customer_id = null;
            $payment->employee_id = $request->employee;
        } elseif ($wasEmployee && $isCustomer) {
            // Change from Employee to Customer
            $payment->employee_id = null;
            $payment->customer_id = $request->customer;
    
            Transaction::create([
                'customer_id' => $request->customer,
                'credit' => $request->amount,
                'debit' => 0,
                'description' => $request->comments,
                'reference_number' => $payment->number,
            ]);
        } elseif ($wasEmployee && $isEmployee) {
            // Change Employee to another Employee
            $payment->employee_id = $request->employee;
        } elseif ($wasCustomer && $isCustomer) {
            // Change Customer to another Customer
            $latestStatement = Transaction::where('customer_id', $payment->customer_id)
                ->where('reference_number', $payment->number)
                ->latest()
                ->first();
    
            if ($latestStatement) {
                $latestStatement->update([
                    'customer_id' => $request->customer,
                    'credit' => $request->amount,
                    'description' => $request->comments,
                ]);
            } else {
                Transaction::create([
                    'customer_id' => $request->customer,
                    'credit' => $request->amount,
                    'debit' => 0,
                    'description' => $request->comments,
                    'reference_number' => $payment->number,
                ]);
            }
    
            $payment->customer_id = $request->customer;
        }
    
        // Update payment details
        $payment->expense_category_id = $request->expense_category_id ?: null;
        $payment->amount = $request->amount ?? 0;
        $payment->mode = $request->mode;
        $payment->comments = $request->comments;
        $payment->date = $request->date ?? now();
        $payment->save();
    
        return back()->with('success', __('Updated successfully'));
    }





    public function filter(Request $request)
    {
        $now = Carbon::now()->toDateString();
        $fromDate =  is_null($request->start_date) ? $now : $request->start_date;
        $toDate =  is_null($request->end_date) ? $now : $request->end_date;
        $startDate = "{$fromDate} 00:00:00";
        $endDate = "{$toDate} 23:59:59";
        $payments = Payment::orderBy('date', 'DESC')->whereBetween('date', [$startDate, $endDate])->paginate(20);

        $dateFormat = Settings::getValue(Settings::DATE_FORMATE);

        return view('payments.filter', [
            'payments' => $payments,
            'payments_sum' => currency_format($payments->sum('amount')),
            'toDate' =>  Carbon::parse($toDate)->format($dateFormat),
            'fromDate' =>  Carbon::parse($fromDate)->format($dateFormat),
            'startDate' =>  $startDate,
            'endDate' =>  $endDate,
        ]);
    }



    public function filterPrint(Request $request)
    {
        $now = Carbon::now()->toDateString();

        $startDate =  $request->get('start_date', $now);
        $endDate =  $request->get('end_date', $now);

        $payments = Payment::orderBy('date', 'DESC')->whereBetween('date', [$startDate, $endDate])->get();
        $settings = Settings::getValues();

        $dateFormat = $settings->dateFormat;
        $timeFormat = $settings->timeFormat;
        $date = now()->timezone($settings->timezone)->format($dateFormat);
        $time = now()->timezone($settings->timezone)->format($timeFormat);

        return view('payments.filter-print', [
            'payments' => $payments,
            'payments_sum' => currency_format($payments->sum('amount')),
            'fromDate' =>  Carbon::parse($startDate)->format($dateFormat),
            'toDate' =>  Carbon::parse($endDate)->format($dateFormat),
            'settings' => $settings,
            'date' => $date,
            'time' => $time,
        ]);
    }
}
