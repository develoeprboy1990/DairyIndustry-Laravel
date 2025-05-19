<?php

namespace App\Http\Controllers;

use App\Models\Expense;
use App\Models\ExpenseCategory;
use App\Models\Order;
use App\Models\OrderDetail;
use App\Models\Payment;
use App\Models\Settings;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class SalesController extends Controller
{
    public function index()
    {
        // Sales data joined from users, orders, and order_details tables
        $sales = DB::table('users')
            ->join('orders', 'users.id', '=', 'orders.user_id')
            ->join('order_details', 'orders.id', '=', 'order_details.order_id')
            ->select(
                'users.id as user_id',
                'users.name as user_name',
                DB::raw('DATE_FORMAT(order_details.created_at, "%Y-%m-%d") as date'),
                DB::raw('SUM(order_details.total) as total'),
                DB::raw('SUM(order_details.total_cost) as total_cost'),
                DB::raw('SUM(order_details.quantity) as total_sold'),
                DB::raw('MAX(order_details.created_at) as createdAt'),
                DB::raw('MIN(order_details.created_at) as createdAtt')
            )
            ->groupBy('users.id', 'users.name', DB::raw('DATE_FORMAT(order_details.created_at, "%Y-%m-%d")'))
            ->orderBy(DB::raw("createdAt"), 'DESC')
            ->paginate(20);

        // Order data joined from users and orders tables
        $salesOrder = DB::table('users')
            ->join('orders', 'users.id', '=', 'orders.user_id')
            ->select(
                'users.id as user_id',
                'users.name',
                DB::raw('DATE_FORMAT(orders.created_at, "%Y-%m-%d") as date'),
                DB::raw('SUM(orders.discount) as sum_discount'),
                DB::raw('MAX(orders.created_at) as createdAt'),
                DB::raw('MIN(orders.created_at) as createdAtt')
            )
            ->groupBy('users.id', 'users.name', DB::raw('DATE_FORMAT(orders.created_at, "%Y-%m-%d")'))
            ->orderBy(DB::raw("createdAt"), 'DESC')
            ->paginate(20);

            // Fetch all users for the filter select box.
            $usersList = DB::table('users')
            ->select('id', 'name')
            ->orderBy('name', 'ASC')
            ->get();

        return view("sales.index", [
            'sales'      => $sales,
            'salesOrder' => $salesOrder,
            'usersList' => $usersList
        ]);
    }

    // public function index()
    // {
    //    $sales = OrderDetail::select(
    //     DB::raw('DATE_FORMAT(created_at, "%Y-%m-%d") as date'),
    //     DB::raw('sum(total) as total'),
    //     DB::raw('sum(total_cost) as total_cost'),
    //     DB::raw('sum(quantity) as total_sold'),
    //     DB::raw('max(created_at) as createdAt'),
    //     DB::raw('min(created_at) as createdAtt')
    //     )
    //     ->groupBy(DB::raw('DATE_FORMAT(created_at, "%Y-%m-%d")')) // Group by formatted date
    //     ->orderBy(DB::raw("createdAt"), 'DESC')
    //     ->paginate(20);

    //     $salesOrder = Order::select(
    //         DB::raw('DATE_FORMAT(created_at, "%Y-%m-%d") as date'),
    //         DB::raw('sum(discount) as sum_discount'),
    //         DB::raw('max(created_at) as createdAt'),
    //         DB::raw('min(created_at) as createdAtt')
    //     )
    //     ->groupBy(DB::raw('DATE_FORMAT(created_at, "%Y-%m-%d")')) // Group by formatted date
    //     ->orderBy(DB::raw("createdAt"), 'DESC')
    //     ->paginate(20);

    //     return view("sales.index", [
    //         'sales' => $sales,
    //         'salesOrder' => $salesOrder,
    //     ]);
    // }

    public function users() {
        $users = DB::table('users')
            ->join('orders', 'users.id', '=', 'orders.user_id')
            ->join('order_details', 'orders.id', '=', 'order_details.order_id')
            ->select(
                'users.id',
                'users.name',
                DB::raw('SUM(order_details.quantity) as total_items_sold'),
                DB::raw('SUM(order_details.quantity * order_details.price) as total_sale')
            )
            ->groupBy('users.id', 'users.name')
            ->get();

            // dd($users);
        return view('sales.users', [
            'users' => $users
        ]);
    }

    public function user_filter(Request $request) {

        $users = DB::table('users')
            ->join('orders', 'users.id', '=', 'orders.user_id')
            ->join('order_details', 'orders.id', '=', 'order_details.order_id')
            ->select(
                'users.id',
                'users.name',
                DB::raw('SUM(order_details.quantity) as total_items_sold'),
                DB::raw('SUM(order_details.quantity * order_details.price) as total_sale')
            )
            ->groupBy('users.id', 'users.name')
            ->where('users.name', $request->user_name)
            ->get();

            // dd($users);
        return view('sales.users', [
            'users' => $users
        ]);
    }


    public function user_report(string $id) {
        $user = DB::table('users')
            ->join('orders', 'users.id', '=', 'orders.user_id')
            ->join('order_details', 'orders.id', '=', 'order_details.order_id')
            ->select(
                'users.id',
                'users.name',
                DB::raw('SUM(order_details.quantity) as total_items_sold'),
                DB::raw('SUM(order_details.quantity * order_details.price) as total_sale')
            )
            ->where('users.id', $id)
            ->groupBy('users.id', 'users.name')
            ->first();



        // $id = 'YOUR_USER_ID'; // Replace with the actual user id

        $sales = OrderDetail::select(
                'products.category_id',
                'categories.name as category_name', // Select the category name
                'order_details.product_id',
                DB::raw('SUM(order_details.quantity) as qty'),
                DB::raw('SUM(order_details.total) as total'),
                DB::raw('SUM(order_details.total_cost) as total_cost')
            )
            ->join('products', 'order_details.product_id', '=', 'products.id')
            ->join('categories', 'products.category_id', '=', 'categories.id')
            ->whereHas('order', function ($q) use ($id) {
                $q->where('user_id', $id);
            })
            ->groupBy('products.category_id', 'categories.name', 'order_details.product_id')
            ->orderBy('qty', 'DESC')
            ->with(['product', 'order'])
            ->get();

        
        $sales_category = OrderDetail::select(
                'products.category_id',
                'categories.name as category_name',
                DB::raw('SUM(order_details.quantity) as total_qty'), // Total quantity per category
                DB::raw('SUM(order_details.total) as total_sales'),    // Total sales per category
                DB::raw('SUM(order_details.total_cost) as total_cost')   // Total cost per category
            )
            ->join('products', 'order_details.product_id', '=', 'products.id')
            ->join('categories', 'products.category_id', '=', 'categories.id')
            ->whereHas('order', function ($q) use ($id) {
                $q->where('user_id', $id);
            })
            ->groupBy('products.category_id', 'categories.name')
            ->orderBy('total_qty', 'DESC')
            ->with(['product', 'order'])
            ->get();
        
        // dd($user, $sales, $sales_category);
            

        return view('sales.user_report', [
            'user' => $user,
            'sales' => $sales,
            'sales_category' => $sales_category
        ]);
    }


    // public function filter(Request $request)
    // {
    //     $now = Carbon::now();
    //     $startDate = Carbon::parse($request->get('start_date', $now->toDateString()))->startOfDay();
    //     $endDate = Carbon::parse($request->get('end_date', $now->toDateString()))->endOfDay();

    //     // Consolidating queries to avoid repetition

    //     // Sales data (from OrderDetails)
    //     $sales = OrderDetail::select(
    //         DB::raw('DATE_FORMAT(created_at, "%Y-%m-%d") as date'),
    //         DB::raw('sum(total) as total'),
    //         DB::raw('sum(total_cost) as total_cost'),
    //         DB::raw('sum(quantity) as total_sold')
    //     )
    //     ->whereBetween('created_at', [$startDate, $endDate])
    //     ->groupBy(DB::raw('DATE_FORMAT(created_at, "%Y-%m-%d")'))
    //     ->orderBy(DB::raw('DATE_FORMAT(created_at, "%Y-%m-%d")'), 'DESC')
    //     ->paginate(20);

    //     // SalesServices data (same date range, no need to run twice)
    //     $salesServices = OrderDetail::select(
    //         DB::raw('DATE_FORMAT(created_at, "%Y-%m-%d") as date'),
    //         DB::raw('sum(total) as total'),
    //         DB::raw('sum(total_cost) as total_cost'),
    //         DB::raw('sum(quantity) as total_sold')
    //     )
    //     ->whereBetween('created_at', [$startDate, $endDate])
    //     ->groupBy(DB::raw('DATE_FORMAT(created_at, "%Y-%m-%d")'))
    //     ->orderBy(DB::raw('DATE_FORMAT(created_at, "%Y-%m-%d")'), 'DESC')
    //     ->paginate(20);

    //     // SalesOrder data (same logic as above)
    //     $salesOrder = Order::select(
    //         DB::raw('DATE_FORMAT(created_at, "%Y-%m-%d") as date'),
    //         DB::raw('sum(discount) as sum_discount')
    //     )
    //     ->whereBetween('created_at', [$startDate, $endDate])
    //     ->groupBy(DB::raw('DATE_FORMAT(created_at, "%Y-%m-%d")'))
    //     ->orderBy(DB::raw('DATE_FORMAT(created_at, "%Y-%m-%d")'), 'DESC')
    //     ->paginate(20);

    //     return view("sales.filter", [
    //         'sales' => $sales,
    //         'salesOrder' => $salesOrder,
    //         'salesServices' => $salesServices,
    //         'startDate' => $startDate,
    //         'endDate' => $endDate,
    //     ]);
    // }


    public function filter(Request $request)
    {
        // Retrieve filter parameters from the request
        $startDate = $request->input('start_date');
        $endDate   = $request->input('end_date');
        $userName  = $request->input('user_name');

        // Build the query for sales data
        $salesQuery = DB::table('users')
            ->join('orders', 'users.id', '=', 'orders.user_id')
            ->join('order_details', 'orders.id', '=', 'order_details.order_id')
            ->select(
                'users.id as user_id',
                'users.name as user_name',
                DB::raw('DATE_FORMAT(order_details.created_at, "%Y-%m-%d") as date'),
                DB::raw('SUM(order_details.total) as total'),
                DB::raw('SUM(order_details.total_cost) as total_cost'),
                DB::raw('SUM(order_details.quantity) as total_sold'),
                DB::raw('MAX(order_details.created_at) as createdAt'),
                DB::raw('MIN(order_details.created_at) as createdAtt')
            );

        // Apply date range filter if provided
        if ($startDate && $endDate) {
            $salesQuery->whereBetween(DB::raw('DATE(order_details.created_at)'), [$startDate, $endDate]);
        }

        // Apply user name filter if provided
        if ($userName) {
            $salesQuery->where('users.name', 'like', "%{$userName}%");
        }

        // Finalize sales query with grouping, ordering, and pagination
        $sales = $salesQuery->groupBy('users.id', 'users.name', DB::raw('DATE_FORMAT(order_details.created_at, "%Y-%m-%d")'))
            ->orderBy(DB::raw("createdAt"), 'DESC')
            ->paginate(20);

        // Build the query for order data (salesOrder)
        $salesOrderQuery = DB::table('users')
            ->join('orders', 'users.id', '=', 'orders.user_id')
            ->select(
                'users.id as user_id',
                'users.name as user_name',
                DB::raw('DATE_FORMAT(orders.created_at, "%Y-%m-%d") as date'),
                DB::raw('SUM(orders.discount) as sum_discount'),
                DB::raw('MAX(orders.created_at) as createdAt'),
                DB::raw('MIN(orders.created_at) as createdAtt')
            );

        // Apply date range filter for orders if provided
        if ($startDate && $endDate) {
            $salesOrderQuery->whereBetween(DB::raw('DATE(orders.created_at)'), [$startDate, $endDate]);
        }

        // Apply user name filter for orders if provided
        if ($userName) {
            $salesOrderQuery->where('users.name', 'like', "%{$userName}%");
        }

        // Finalize salesOrder query with grouping, ordering, and pagination
        $salesOrder = $salesOrderQuery->groupBy('users.id', 'users.name', DB::raw('DATE_FORMAT(orders.created_at, "%Y-%m-%d")'))
            ->orderBy(DB::raw("createdAt"), 'DESC')
            ->paginate(20);
        
        // Fetch all users for the filter select box.
        $usersList = DB::table('users')
        ->select('id', 'name')
        ->orderBy('name', 'ASC')
        ->get();

        // Return the view with filtered results and current filters
        return view('sales.index', [
            'sales'      => $sales,
            'salesOrder' => $salesOrder,
            'usersList' => $usersList
            // 'filters'    => $request->all(),
        ]);
    }


    public function show(Request $request, string $date)
    {
        // Retrieve the user name filter (e.g., "Mahbub")
        $userName = $request->input('user_name');

        // Sales data by product and category for the given date (and user name, if provided)
        $sales = OrderDetail::select(
                'products.category_id',
                'categories.name as category_name',
                'order_details.product_id',
                DB::raw('COALESCE(SUM(order_details.quantity), 0) as qty'),
                DB::raw('COALESCE(SUM(order_details.total), 0) as total'),
                DB::raw('COALESCE(SUM(order_details.total_cost), 0) as total_cost')
            )
            ->join('products', 'order_details.product_id', '=', 'products.id')
            ->join('categories', 'products.category_id', '=', 'categories.id')
            ->join('orders', 'order_details.order_id', '=', 'orders.id')
            ->join('users', 'orders.user_id', '=', 'users.id')
            // Filter by date on the orders table (or order_details.created_at if preferred)
            ->whereDate('orders.created_at', $date)
            // Filter by user name if provided
            ->when($userName, function ($query, $userName) {
                return $query->where('users.name', $userName);
            })
            ->groupBy('products.category_id', 'categories.name', 'order_details.product_id')
            ->orderBy('qty', 'DESC')
            ->with(['product', 'order'])
            ->get();

        // Sales aggregated by category for the given date (and user name, if provided)
        $sales_category = OrderDetail::select(
            'products.category_id',
            'categories.name as category_name',
            DB::raw('COALESCE(SUM(order_details.quantity), 0) as total_qty'),
            DB::raw('CAST(COALESCE(SUM(order_details.total), 0) AS DECIMAL(10,2)) as total_sales'),
            DB::raw('COALESCE(SUM(order_details.total_cost), 0) as total_cost')
        )
        ->join('products', 'order_details.product_id', '=', 'products.id')
        ->join('categories', 'products.category_id', '=', 'categories.id')
        ->join('orders', 'order_details.order_id', '=', 'orders.id')
        ->join('users', 'orders.user_id', '=', 'users.id')
        ->whereDate('orders.created_at', $date)
        ->when($userName, function ($query, $userName) {
            return $query->where('users.name', $userName);
        })
        ->groupBy('products.category_id', 'categories.name')
        ->orderBy('total_qty', 'DESC')
        ->with(['product', 'order'])
        ->get();


        // Fetch expenses for the given date (assuming expenses are not user-specific)
        $expenses = DB::table('expenses')
            ->whereDate('date', $date)
            ->join('expense_categories', 'expenses.expense_category_id', '=', 'expense_categories.id')
            ->select('expenses.*', 'expense_categories.name as category_name')
            ->get();

        // Group expenses by category and calculate totals
        $groupedExpenses = $expenses->groupBy('expense_category_id');
        $categoryTotals = $groupedExpenses->map(function ($group) {
            return [
                'category_name' => $group->first()->category_name,
                'total_amount'  => $group->sum('amount'),
                'expenses'      => $group,
            ];
        });

        // Calculate total expenses and payments for the day
        $totalExpenses = $expenses->sum('amount');
        $payments = Payment::whereDate('date', $date)->sum('amount');

        return view("sales.show", [
            'sales'          => $sales,
            'sales_category' => $sales_category,
            'settings'       => Settings::getValues(),
            'date'           => \Carbon\Carbon::parse($date)->format('d F Y'),
            'total_sales'    => $request->ts,
            'expenses'       => $expenses,
            'categoryTotals' => $categoryTotals,
            'totalExpenses'  => $totalExpenses,
            'payments'       => $payments,
            'serial_number'  => \Carbon\Carbon::parse($date)->format('ymd'),
            'selected_user'  => $userName, // Pass the selected user name to the view for reference
        ]);
    }

    // public function show(Request $request, string $date)
    // {
    //     $sales = OrderDetail::select(
    //         'products.category_id',
    //         'categories.name as category_name', // Select the category name
    //         'order_details.product_id',
    //         DB::raw('SUM(order_details.quantity) as qty'),
    //         DB::raw('SUM(order_details.total) as total'),
    //         DB::raw('SUM(order_details.total_cost) as total_cost')
    //     )
    //     ->join('products', 'order_details.product_id', '=', 'products.id')
    //     ->join('categories', 'products.category_id', '=', 'categories.id') // Join with categories table
    //     ->whereHas('order', function ($q) use ($date) {
    //         $q->whereDate('created_at', $date);
    //     })
    //     ->groupBy('products.category_id', 'categories.name', 'order_details.product_id') // Group by category name
    //     ->orderBy('qty', 'DESC')
    //     ->with(['product', 'order'])
    //     ->get();

    //     $sales_category = OrderDetail::select(
    //         'products.category_id',
    //         'categories.name as category_name',
    //         DB::raw('SUM(order_details.quantity) as total_qty'), // Total quantity per category
    //         DB::raw('SUM(order_details.total) as total_sales'), // Total sales per category
    //         DB::raw('SUM(order_details.total_cost) as total_cost') // Total cost per category
    //     )
    //     ->join('products', 'order_details.product_id', '=', 'products.id')
    //     ->join('categories', 'products.category_id', '=', 'categories.id')
    //     ->whereHas('order', function ($q) use ($date) {
    //         $q->whereDate('created_at', $date);
    //     })
    //     ->groupBy('products.category_id', 'categories.name') // Group by category
    //     ->orderBy('total_qty', 'DESC') // Order by total quantity
    //     ->with(['product', 'order'])
    //     ->get();

    //     // $expenses = Expense::whereDate('date', $date)->sum('amount');
        
        
    //      // Fetch all expenses for the current date
    //     $expenses = DB::table('expenses')
    //         ->whereDate('date', $date)
    //         ->join('expense_categories', 'expenses.expense_category_id', '=', 'expense_categories.id')
    //         ->select('expenses.*', 'expense_categories.name as category_name')
    //         ->get();
    
    //     // Group expenses by category
    //     $groupedExpenses = $expenses->groupBy('expense_category_id');
    
    //     // Calculate total expenses for each category
    //     $categoryTotals = $groupedExpenses->map(function ($group) {
    //         return [
    //             'category_name' => $group->first()->category_name,
    //             'total_amount' => $group->sum('amount'),
    //             'expenses' => $group, // Individual expenses under this category
    //         ];
    //     });
    
    //     // Calculate total expenses for the current date
    //     $totalExpenses = $expenses->sum('amount');
    //     $payments = Payment::whereDate('date', $date)->sum('amount');

    //     return view("sales.show", [
    //         'sales' => $sales,
    //         'sales_category' => $sales_category,
    //         'settings' => Settings::getValues(),
    //         'date' => Carbon::parse($date)->format('d F Y'),
    //         'total_sales' => $request->ts,
    //         'expenses' => $expenses,
    //         'categoryTotals'=> $categoryTotals,
    //         'totalExpenses' => $totalExpenses,
    //         'payments' => $payments,
    //         'serial_number' => Carbon::parse($date)->format('ymd')
    //     ]);
    // }
    
}