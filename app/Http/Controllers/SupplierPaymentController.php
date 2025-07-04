<?php

namespace App\Http\Controllers;

use App\Models\Transaction;
use App\Models\Supplier;
use App\Models\SupplierPayment;
use App\Models\Settings;
use Carbon\Carbon;
use Illuminate\Http\Request;

class SupplierPaymentController extends Controller
{
    public function index(Request $request)
    {
         
        $query = SupplierPayment::query();
        // Search filter (assuming you have a search scope)
        if ($request->filled('search_query')) {
            $query->search(trim($request->search_query));
        }
        // Date range filters
        if ($request->filled('start_date')) {
            $query->where('date', '>=', $request->start_date);
        }
        if ($request->filled('end_date')) {
            $query->where('date', '<=', $request->end_date);
        }
        // Supplier filter
        if ($request->filled('supplier_id')) {
            $query->where('supplier_id', $request->supplier_id);
        }
        // Order and paginate
        $payments = $query->orderBy('date', 'DESC')->paginate(20);
        $suppliers = Supplier::get();
        return view('supplier_payments.index', [
            'payments' => $payments,
            'suppliers' => $suppliers,
        ]);
    }


    public function create()
    {
        $suppliers = Supplier::oldest()->take(200)->get();
        return view('supplier_payments.create', [
            'suppliers' => $suppliers,
            'modes' => SupplierPayment::$modes,
            'paid_modes' => SupplierPayment::$paid_modes,
            'currency' => Settings::getValue(Settings::CURRENCY_SYMBOL),
        ]);
    }

    public function edit(SupplierPayment $payment)
    {
        $suppliers = Supplier::oldest()->take(200)->get();
        return view('supplier_payments.edit', [
            'payment' => $payment,
            'suppliers' => $suppliers,
            'modes' => SupplierPayment::$modes,
            'paid_modes' => SupplierPayment::$paid_modes,
            'currency' => Settings::getValue(Settings::CURRENCY_SYMBOL),
        ]);
    }

    public function store(Request $request)
    {

        $request->validate([
            'supplier' => ['required', 'string'],
            'amount' => ['nullable', 'numeric', 'min:0'],
            'comments' => ['nullable', 'string'],
            'date' => ['required', 'date'],
        ]);
        $supplierId = $request->supplier;

        $payment = new SupplierPayment();
        $payment->supplier_id = $supplierId;
        $payment->amount = $request->amount ?? 0;
        $payment->mode = $request->mode;
        $payment->comments = $request->comments;
        $payment->date = $request->date ?? now();
        $payment->qty_milk = $request->qty_milk ?? 0;
        $payment->unit_price = $request->unit_price ?? 0;
        $payment->amount_in = $request->amount_in ?? 0;
        $payment->amount_out = $request->amount_out ?? 0;
        $payment->total = $request->total ?? 0;
        $payment->paid = $request->paid ?? 'Paid';
        $payment->save();

        // $latestStatement = Transaction::where('customer_id',  $customerId)->latest()->first();
        // $customerAccount = new Transaction();
        // $customerAccount->credit = $payment->amount;
        // $customerAccount->debit = 0;

        // $customerAccount->customer_id = $customerId;
        // $customerAccount->description = $payment->comments;
        // $customerAccount->reference_number = $payment->number;
        // $customerAccount->save();

        return back()->with('success', __('Created'));
    }

    public function update(Request $request, SupplierPayment $payment)
    {
        $request->validate([
            'supplier' => ['required', 'string'],
            'amount' => ['nullable', 'numeric', 'min:0'],
            'comments' => ['nullable', 'string'],
            'date' => ['required', 'date'],
        ]);
        $supplierId = $request->supplier;

        $payment->supplier_id = $supplierId;
        $payment->amount = $request->amount ?? 0;
        $payment->mode = $request->mode;
        $payment->comments = $request->comments;
        $payment->date = $request->date ?? now();
        $payment->qty_milk = $request->qty_milk ?? 0;
        $payment->unit_price = $request->unit_price ?? 0;
        $payment->amount_in = $request->amount_in ?? 0;
        $payment->amount_out = $request->amount_out ?? 0;
        $payment->total = $request->total ?? 0;
        $payment->paid = $request->paid ?? 'Paid';
        $payment->save();

        // $latestStatement = Transaction::where('customer_id',  $customerId)->latest()->first();
        // $customerAccount = new Transaction();
        // $customerAccount->credit = $payment->amount;
        // $customerAccount->debit = 0;

        // $customerAccount->customer_id = $customerId;
        // $customerAccount->description = $payment->comments;
        // $customerAccount->reference_number = $payment->number;
        // $customerAccount->save();

        return back()->with('success', __('Updated'));
    }

    public function filter(Request $request)
    {
        $now = Carbon::now()->toDateString();
        $fromDate =  is_null($request->start_date) ? $now : $request->start_date;
        $toDate =  is_null($request->end_date) ? $now : $request->end_date;
        $startDate = "{$fromDate} 00:00:00";
        $endDate = "{$toDate} 23:59:59";
        $payments = SupplierPayment::orderBy('date', 'DESC')->whereBetween('date', [$startDate, $endDate])->paginate(20);

        $dateFormat = Settings::getValue(Settings::DATE_FORMATE);

        return view('supplier_payments.filter', [
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

        $payments = SupplierPayment::orderBy('date', 'DESC')->whereBetween('date', [$startDate, $endDate])->get();
        $settings = Settings::getValues();

        $dateFormat = $settings->dateFormat;
        $timeFormat = $settings->timeFormat;
        $date = now()->timezone($settings->timezone)->format($dateFormat);
        $time = now()->timezone($settings->timezone)->format($timeFormat);

        return view('supplier_payments.filter-print', [
            'payments' => $payments,
            'payments_sum' => currency_format($payments->sum('amount')),
            'fromDate' =>  Carbon::parse($startDate)->format($dateFormat),
            'toDate' =>  Carbon::parse($endDate)->format($dateFormat),
            'settings' => $settings,
            'date' => $date,
            'time' => $time,
        ]);
    }

    public function print(Supplier $supplier, SupplierPayment $payment)
    {
        return view('suppliers.payments.print', [
            'supplier' => $supplier,
            'payment' => $payment,
            'settings' => Settings::getValues(),
        ]);
    }

    public function destroy(Supplier $supplier, SupplierPayment $payment)
    {
        $payment->delete();
        return back()->with('success', __('Deleted'));
    }
}
