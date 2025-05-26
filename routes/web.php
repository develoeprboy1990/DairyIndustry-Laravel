<?php

use Illuminate\Support\Facades\Artisan;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::group(['middleware' => ['guest']], function () {
    Route::get('/login', [\App\Http\Controllers\Auth\LoginController::class, 'show'])->name('login');
    Route::post('/login', [\App\Http\Controllers\Auth\LoginController::class, 'authenticate'])->name('login.attempt');
});

Route::group(['middleware' => ['auth']], function () {
    Route::get('/', [\App\Http\Controllers\HomeController::class, 'show'])->name('home');
    Route::view('/about', 'about.show')->name('about');
    Route::view('/industry', 'home.industry')->name('industry');
    Route::get('/point-of-sale', [\App\Http\Controllers\PointOfSaleController::class, 'show'])->name('pos.show');
    Route::post('logout', [\App\Http\Controllers\Auth\LogOutController::class, 'logout'])->name('logout');


    Route::get('password/confirm', [\App\Http\Controllers\Auth\ConfirmPasswordController::class, 'showConfirmForm'])->name('password.confirm');
    Route::post('password/confirm', [\App\Http\Controllers\Auth\ConfirmPasswordController::class, 'confirm']);

    Route::get('/categories', [\App\Http\Controllers\CategoryController::class, 'index'])->name('categories.index');
    Route::get('/categories/create', [\App\Http\Controllers\CategoryController::class, 'create'])->name('categories.create');
    Route::post('/categories', [\App\Http\Controllers\CategoryController::class, 'store'])->name('categories.store');
    Route::get('/categories/{id}', [\App\Http\Controllers\CategoryController::class, 'getMinimumStock'])->name('categories.getMinimumStock');
    
    
    Route::get('/categories/{category}/edit', [\App\Http\Controllers\CategoryController::class, 'edit'])->name('categories.edit');
    Route::get('/categories/{category}/products', [\App\Http\Controllers\CategoryController::class, 'products'])->name('categories.products.index');
    Route::put('/categories/{category}', [\App\Http\Controllers\CategoryController::class, 'update'])->name('categories.update');
    Route::delete('/categories/{category}', [\App\Http\Controllers\CategoryController::class, 'destroy'])->name('categories.destroy');
    Route::delete('/categories/{category}/image', [\App\Http\Controllers\CategoryController::class, 'imageDestroy'])->name('categories.image.destroy');
    
    


    Route::get('/expense-categories', [\App\Http\Controllers\ExpenseCategoryController::class, 'index'])->name('expense-categories.index');
    Route::post('/expense-categories', [\App\Http\Controllers\ExpenseCategoryController::class, 'store'])->name('expense-categories.store');
    Route::get('/expense-categories/create', [\App\Http\Controllers\ExpenseCategoryController::class, 'create'])->name('expense-categories.create');
    Route::get('/expense-categories/{expense_category}/edit', [\App\Http\Controllers\ExpenseCategoryController::class, 'edit'])->name('expense-categories.edit');
    Route::get('/expense-categories/{expense_category}/products', [\App\Http\Controllers\ExpenseCategoryController::class, 'products'])->name('expense-categories.products.index');
    Route::put('/expense-categories/{expense_category}', [\App\Http\Controllers\ExpenseCategoryController::class, 'update'])->name('expense-categories.update');
    Route::delete('/expense-categories/{expense_category}', [\App\Http\Controllers\ExpenseCategoryController::class, 'destroy'])->name('expense-categories.destroy');
    Route::delete('/expense-categories/{expense_category}/image', [\App\Http\Controllers\ExpenseCategoryController::class, 'imageDestroy'])->name('expense-categories.image.destroy');

    Route::get('/products', [\App\Http\Controllers\ProductController::class, 'index'])->name('products.index');
    Route::post('/products', [\App\Http\Controllers\ProductController::class, 'store'])->name('products.store');
    Route::get('/products/create', [\App\Http\Controllers\ProductController::class, 'create'])->name('products.create');
    Route::get('/products/{product}/edit', [\App\Http\Controllers\ProductController::class, 'edit'])->name('products.edit');
    Route::put('/products/{product}', [\App\Http\Controllers\ProductController::class, 'update'])->name('products.update');
    Route::delete('/products/{product}', [\App\Http\Controllers\ProductController::class, 'destroy'])->name('products.destroy');
    Route::delete('/products/{product}/image', [\App\Http\Controllers\ProductController::class, 'imageDestroy'])->name('products.image.destroy');


    // routes/web.php
    Route::get('/expired-products', [\App\Http\Controllers\ExpiredProductController::class, 'index'])->name('expired-products.index');
    Route::post('/expired-product/{id}/trash', [\App\Http\Controllers\ExpiredProductController::class, 'trash'])->name('expired-products.trash');
    
    Route::get('/expired-product/{id}/reproduce', [\App\Http\Controllers\ExpiredProductController::class, 'reproduceForm'])->name('expired-products.reproduce.form');
    Route::post('/expired-product/reproduce', [\App\Http\Controllers\ExpiredProductController::class, 'reproduce'])->name('expired-products.reproduce');

Route::get('/expired-product/{id}/edit', [\App\Http\Controllers\ExpiredProductController::class, 'edit'])->name('expired-products.edit');
    Route::post('/expired-product/update', [\App\Http\Controllers\ExpiredProductController::class, 'update'])->name('expired-products.update');

    Route::get('/customers', [\App\Http\Controllers\CustomerController::class, 'index'])->name('customers.index');
    Route::post('/customers', [\App\Http\Controllers\CustomerController::class, 'store'])->name('customers.store');
    Route::get('/customers/create', [\App\Http\Controllers\CustomerController::class, 'create'])->name('customers.create');
    Route::get('/customers/print', [\App\Http\Controllers\CustomerController::class, 'printInfo'])->name('customers.print.info');
    Route::get('/customers/barcode/{customer}', [\App\Http\Controllers\CustomerController::class, 'barcode'])->name('customers.print.barcode');
    
    Route::get('/customers/{customer}/edit', [\App\Http\Controllers\CustomerController::class, 'edit'])->name('customers.edit');
    Route::put('/customers/{customer}', [\App\Http\Controllers\CustomerController::class, 'update'])->name('customers.update');
    Route::get('/customers/{customer}', [\App\Http\Controllers\CustomerController::class, 'show'])->name('customers.show');
    Route::delete('/customers/{customer}', [\App\Http\Controllers\CustomerController::class, 'destroy'])->name('customers.destroy');
    Route::get('/customers/{customer}/orders', [\App\Http\Controllers\CustomerOrderController::class, 'index'])->name('customers.orders.index');
    Route::get('/customers/{customer}/quotations', [\App\Http\Controllers\CustomerOrderController::class, 'index1'])->name('customers.quotations.index');
    Route::get('/customers/{customer}/payments', [\App\Http\Controllers\CustomerPaymentController::class, 'index'])->name('customers.payments.index');
    Route::post('/customers/{customer}/payments', [\App\Http\Controllers\CustomerPaymentController::class, 'store'])->name('customers.payments.store');
    Route::get('/customers/{customer}/payments/create', [\App\Http\Controllers\CustomerPaymentController::class, 'create'])->name('customers.payments.create');
    Route::get('/customers/{customer}/payments/filter', [\App\Http\Controllers\CustomerPaymentController::class, 'filter'])->name('customers.payments.filter');
    Route::get('/customers/{customer}/payments/filter-print', [\App\Http\Controllers\CustomerPaymentController::class, 'filterPrint'])->name('customers.payments.filter.print');
    Route::get('/customers/{customer}/payments/{payment}/edit', [\App\Http\Controllers\CustomerPaymentController::class, 'edit'])->name('customers.payments.edit');
    Route::get('/customers/{customer}/payments/{payment}/print', [\App\Http\Controllers\CustomerPaymentController::class, 'print'])->name('customers.payments.print');
    Route::put('/customers/{customer}/payments/{payment}', [\App\Http\Controllers\CustomerPaymentController::class, 'update'])->name('customers.payments.update');
    Route::delete('/customers/{customer}/payments/{payment}', [\App\Http\Controllers\CustomerPaymentController::class, 'destroy'])->name('customers.payments.destroy');

    Route::get('/suppliers/{supplier}/payments/{payment}/print', [\App\Http\Controllers\SupplierPaymentController::class, 'print'])->name('suppliers.payments.print');
    Route::delete('/suppliers/{supplier}/payments/{payment}', [\App\Http\Controllers\SupplierPaymentController::class, 'destroy'])->name('suppliers.payments.destroy');

    Route::get('/customers/{customer}/statements', [\App\Http\Controllers\CustomerAccountStatementController::class, 'index'])->name('customers.statements.index');
    Route::get('/customers/{customer}/statements/{statement}/print', [\App\Http\Controllers\CustomerAccountStatementController::class, 'print'])->name('customers.statements.print');
    Route::get('/customers/{customer}/statements/filter', [\App\Http\Controllers\CustomerAccountStatementController::class, 'filter'])->name('customers.statements.filter');
    Route::get('/customers/{customer}/statements/filter-print', [\App\Http\Controllers\CustomerAccountStatementController::class, 'filterPrint'])->name('customers.statements.filter.print');

    Route::get('/cowfarms', [\App\Http\Controllers\CowFarmController::class, 'index'])->name('cowfarms.index');

    Route::get('/manupack', [\App\Http\Controllers\ManupackController::class, 'index'])->name('manupack.index');
    Route::get('/manupack/create', [\App\Http\Controllers\ManupackController::class, 'create'])->name('manupack.create');
    Route::post('/manupack', [\App\Http\Controllers\ManupackController::class, 'store'])->name('manupack.store');
    Route::get('/manupack/{coffee_bag}/edit', [\App\Http\Controllers\ManupackController::class, 'edit'])->name('manupack.edit');
    Route::put('/manupack/{coffee_bag}', [\App\Http\Controllers\ManupackController::class, 'update'])->name('manupack.update');
    Route::delete('/manupack/{coffee_bag}', [\App\Http\Controllers\ManupackController::class, 'destroy'])->name('manupack.destroy');

    Route::get('/roots', [\App\Http\Controllers\RootController::class, 'index'])->name('roots.index');
    Route::get('/roots/create', [\App\Http\Controllers\RootController::class, 'create'])->name('roots.create');
    Route::post('/roots', [\App\Http\Controllers\RootController::class, 'store'])->name('roots.store');
    Route::get('/roots/{root}/edit', [\App\Http\Controllers\RootController::class, 'edit'])->name('roots.edit');
    Route::delete('/roots/{root}', [\App\Http\Controllers\RootController::class, 'destroy'])->name('roots.destroy');
    Route::put('/roots/{root}', [\App\Http\Controllers\RootController::class, 'update'])->name('roots.update');

    Route::get('/lines', [\App\Http\Controllers\LineController::class, 'index'])->name('lines.index');
    Route::get('/lines/create', [\App\Http\Controllers\LineController::class, 'create'])->name('lines.create');
    Route::post('/lines', [\App\Http\Controllers\LineController::class, 'store'])->name('lines.store');
    Route::delete('/lines/{line}', [\App\Http\Controllers\LineController::class, 'destroy'])->name('lines.destroy');
    Route::get('/lines/{line}/edit', [\App\Http\Controllers\LineController::class, 'edit'])->name('lines.edit');
    Route::put('/lines/{line}', [\App\Http\Controllers\LineController::class, 'update'])->name('lines.update');

    Route::get('/salesmen', [\App\Http\Controllers\SalesmanController::class, 'index'])->name('salesmen.index');
    // Route::group(['middleware' => ['password.confirm']], function () {
        Route::get('/salesmen/create', [\App\Http\Controllers\SalesmanController::class, 'create'])->name('salesmen.create');
        // Route::put('/salesman/{root}', [\App\Http\Controllers\SalesmanController::class, 'update'])->name('salesman.update');
        Route::post('/salesmen', [\App\Http\Controllers\SalesmanController::class, 'store'])->name('salesmen.store');
        Route::delete('/salesmen/{salesman}', [\App\Http\Controllers\SalesmanController::class, 'destroy'])->name('salesmen.destroy');
        Route::get('/salesmen/{salesman}/edit', [\App\Http\Controllers\SalesmanController::class, 'edit'])->name('salesmen.edit');
        Route::put('/salesmen/{salesman}', [\App\Http\Controllers\SalesmanController::class, 'update'])->name('salesmen.update');
    // });

    Route::get('/orders', [\App\Http\Controllers\OrderController::class, 'index'])->name('orders.index');
    Route::get('/quotations', [\App\Http\Controllers\OrderController::class, 'index1'])->name('quotations.index');
    Route::get('/orders/analytics', [\App\Http\Controllers\OrderController::class, 'showAnalytics'])->name('orders.analytics');

    Route::get('/orders/filter', [\App\Http\Controllers\OrderController::class, 'filter'])->name('orders.filter');
    Route::get('/orders/print/stats', [\App\Http\Controllers\OrderController::class, 'printStats'])->name('orders.print.stats');
    Route::get('/orders/print/{order}', [\App\Http\Controllers\OrderController::class, 'print'])->name('orders.print');
    Route::get('/quotations/print/{order}', [\App\Http\Controllers\OrderController::class, 'print1'])->name('quotations.print');
    Route::get('/quotations/convert/{order}', [\App\Http\Controllers\OrderController::class, 'convert'])->name('quotations.convert');

    Route::get('/orders/edit/{order}', [\App\Http\Controllers\OrderController::class, 'edit'])->name('orders.edit');
    Route::put('/orders/update/{order}', [\App\Http\Controllers\OrderController::class, 'update'])->name('orders.update');
    Route::get('/orders/{order}', [\App\Http\Controllers\OrderController::class, 'show'])->name('orders.show');
    Route::get('/quotations/{order}', [\App\Http\Controllers\OrderController::class, 'show1'])->name('quotations.show');
    Route::delete('/orders/{order}', [\App\Http\Controllers\OrderController::class, 'destroy'])->name('orders.destroy');


    Route::get('/settings', [\App\Http\Controllers\SettingsController::class, 'show'])->name('settings.show');
    Route::put('/settings/pos', [\App\Http\Controllers\SettingsController::class, 'updatePos'])->name('settings.pos.update');
    Route::put('/settings/currency', [\App\Http\Controllers\SettingsController::class, 'updateCurrency'])->name('settings.currency.update');
    Route::put('/settings/identification', [\App\Http\Controllers\SettingsController::class, 'updateIdentification'])->name('settings.identification.update');
    Route::put('/settings/date', [\App\Http\Controllers\SettingsController::class, 'updateDate'])->name('settings.date.update');
    Route::put('/settings/exchange-rate', [\App\Http\Controllers\SettingsController::class, 'updateExchangeRate'])->name('settings.exchange-rate.update');


    Route::get('/change-password', [\App\Http\Controllers\PasswordController::class, 'show'])->name('password.show');
    Route::put('/change-password', [\App\Http\Controllers\PasswordController::class, 'update'])->name('password.update');
    Route::group(['middleware' => ['password.confirm']], function () {
        Route::get('/drawer', [\App\Http\Controllers\DrawerController::class, 'show'])->name('drawer.show');
        Route::post('/drawer/close', [\App\Http\Controllers\DrawerController::class, 'close'])->name('drawer.close');
        Route::get('/drawer/{drawerHistory}/print', [\App\Http\Controllers\DrawerController::class, 'print'])->name('drawer.print');
    });
    Route::get('/expenses', [\App\Http\Controllers\ExpenseController::class, 'index'])->name('expenses.index');
    Route::post('/expenses', [\App\Http\Controllers\ExpenseController::class, 'store'])->name('expenses.store');
    Route::get('/expenses/create', [\App\Http\Controllers\ExpenseController::class, 'create'])->name('expenses.create');
    // Route::get('/expenses/archive', [\App\Http\Controllers\ExpenseController::class, 'archive'])->name('expenses.archive');
    Route::get('/expenses/{expense}/print', [\App\Http\Controllers\ExpenseController::class, 'print'])->name('expenses.print');
    // Route::get('/expenses/{expense}/archive', [\App\Http\Controllers\ExpenseController::class, 'updateArchive'])->name('expenses.update.archive');
    Route::get('/expenses/filter', [\App\Http\Controllers\ExpenseController::class, 'filter'])->name('expenses.filter');
    Route::get('/expenses/filter-print', [\App\Http\Controllers\ExpenseController::class, 'filterPrint'])->name('expenses.filter.print');
    Route::delete('/expenses/{expense}', [\App\Http\Controllers\ExpenseController::class, 'destroy'])->name('expenses.destroy');


    Route::get('/payments', [\App\Http\Controllers\PaymentController::class, 'index'])->name('payments.index');
    Route::post('/payments', [\App\Http\Controllers\PaymentController::class, 'store'])->name('payments.store');
    Route::get('/payments/create', [\App\Http\Controllers\PaymentController::class, 'create'])->name('payments.create');
    Route::get('/payments/{payment}/edit', [\App\Http\Controllers\PaymentController::class, 'edit'])->name('payments.edit');
    Route::post('/payments/{payment}', [\App\Http\Controllers\PaymentController::class, 'update'])->name('payments.update');
    Route::get('/payments/filter', [\App\Http\Controllers\PaymentController::class, 'filter'])->name('payments.filter');
    Route::get('/payments/filter-print', [\App\Http\Controllers\PaymentController::class, 'filterPrint'])->name('payments.filter.print');

    Route::get('/supplier-payments', [\App\Http\Controllers\SupplierPaymentController::class, 'index'])->name('supplier-payments.index');
    Route::post('/supplier-payments', [\App\Http\Controllers\SupplierPaymentController::class, 'store'])->name('supplier-payments.store');
    Route::get('/supplier-payments/create', [\App\Http\Controllers\SupplierPaymentController::class, 'create'])->name('supplier-payments.create');
    Route::get('/supplier-payments/{payment}/edit', [\App\Http\Controllers\SupplierPaymentController::class, 'edit'])->name('supplier-payments.edit');
    Route::post('/supplier-payments/{payment}', [\App\Http\Controllers\SupplierPaymentController::class, 'update'])->name('supplier-payments.update');
    Route::get('/supplier-payments/filter', [\App\Http\Controllers\SupplierPaymentController::class, 'filter'])->name('supplier-payments.filter');
    Route::get('/supplier-payments/filter-print', [\App\Http\Controllers\SupplierPaymentController::class, 'filterPrint'])->name('supplier-payments.filter.print');

    Route::get('/suppliers', [\App\Http\Controllers\SupplierController::class, 'index'])->name('suppliers.index');
    Route::get('/suppliers/create', [\App\Http\Controllers\SupplierController::class, 'create'])->name('suppliers.create');
    Route::post('/suppliers', [\App\Http\Controllers\SupplierController::class, 'store'])->name('suppliers.store');
    Route::get('/suppliers/{supplier}', [\App\Http\Controllers\SupplierController::class, 'show'])->name('suppliers.show');
    Route::get('/suppliers/barcode/{supplier}', [\App\Http\Controllers\SupplierController::class, 'barcode'])->name('suppliers.print.barcode');
    Route::get('/suppliers/{supplier}/edit', [\App\Http\Controllers\SupplierController::class, 'edit'])->name('suppliers.edit');
    Route::put('/suppliers/{supplier}', [\App\Http\Controllers\SupplierController::class, 'update'])->name('suppliers.update');
    Route::delete('/suppliers/{supplier}', [\App\Http\Controllers\SupplierController::class, 'destroy'])->name('suppliers.destroy');


    Route::get('/purchases', [\App\Http\Controllers\PurchaseController::class, 'index'])->name('purchases.index');
    Route::get('/purchases/create', [\App\Http\Controllers\PurchaseController::class, 'create'])->name('purchases.create');
    Route::post('/purchases', [\App\Http\Controllers\PurchaseController::class, 'store'])->name('purchases.store');
    Route::get('/purchases/{purchase}', [\App\Http\Controllers\PurchaseController::class, 'show'])->name('purchases.show');
    Route::get('/purchases/{purchase}/edit', [\App\Http\Controllers\PurchaseController::class, 'edit'])->name('purchases.edit');
    Route::get('/purchases/{purchase}/print', [\App\Http\Controllers\PurchaseController::class, 'print'])->name('purchases.print');
    Route::put('/purchases/{purchase}', [\App\Http\Controllers\PurchaseController::class, 'update'])->name('purchases.update');
    Route::delete('/purchases/{purchase}', [\App\Http\Controllers\PurchaseController::class, 'destroy'])->name('purchases.destroy');


    Route::get('/profile', [\App\Http\Controllers\ProfileController::class, 'show'])->name('profile.show');
    Route::put('/profile', [\App\Http\Controllers\ProfileController::class, 'update'])->name('profile.update');

    Route::get('sales-report', [\App\Http\Controllers\SalesController::class, 'index'])->name('sales.index');
    Route::get('sales-report/users', [\App\Http\Controllers\SalesController::class, 'users'])->name('sales.users');
    Route::get('sales-report/user_report/{id}', [\App\Http\Controllers\SalesController::class, 'user_report'])->name('sales.user_report');
    Route::get('sales-report/filter', [\App\Http\Controllers\SalesController::class, 'filter'])->name('sales.filter');
    Route::get('sales-report/user_filter', [\App\Http\Controllers\SalesController::class, 'user_filter'])->name('sales.user_filter');
    Route::get('sales-report/{date}', [\App\Http\Controllers\SalesController::class, 'show'])->name('sales.show');

    Route::get('/users', [\App\Http\Controllers\UserController::class, 'index'])->name('users.index');
    Route::post('/users', [\App\Http\Controllers\UserController::class, 'store'])->name('users.store');
    Route::get('/users/create', [\App\Http\Controllers\UserController::class, 'create'])->name('users.create');
    Route::delete('/users/{user}', [\App\Http\Controllers\UserController::class, 'destroy'])->name('users.destroy');

    Route::get('/employees', [\App\Http\Controllers\EmployeeController::class, 'index'])->name('employees.index');
    Route::post('/employees', [\App\Http\Controllers\EmployeeController::class, 'store'])->name('employees.store');
    Route::get('/employees/create', [\App\Http\Controllers\EmployeeController::class, 'create'])->name('employees.create');
    Route::delete('/employees/{employee}', [\App\Http\Controllers\EmployeeController::class, 'destroy'])->name('employees.destroy');
    Route::get('/employees/{employee}/edit', [\App\Http\Controllers\EmployeeController::class, 'edit'])->name('employees.edit');
    Route::put('/employees/{employee}', [\App\Http\Controllers\EmployeeController::class, 'update'])->name('employees.update');

    Route::get('/staffs', [\App\Http\Controllers\StaffController::class, 'index'])->name('staffs.index');
    Route::post('/staffs', [\App\Http\Controllers\StaffController::class, 'store'])->name('staffs.store');
    Route::get('/staffs/create', [\App\Http\Controllers\StaffController::class, 'create'])->name('staffs.create');
    Route::delete('/staffs/{staff}', [\App\Http\Controllers\StaffController::class, 'destroy'])->name('staffs.destroy');
    Route::get('/staffs/{staff}/edit', [\App\Http\Controllers\StaffController::class, 'edit'])->name('staffs.edit');
    Route::get('/staffs/{staff}/attendance/{year?}/{month?}/print', [\App\Http\Controllers\StaffController::class, 'print'])->name('staffs.attendance.print');
    Route::get('/staffs/{staff}/attendance/{year?}/{month?}', [\App\Http\Controllers\StaffController::class, 'attendance'])->name('staffs.attendance');
    Route::get('/staffs/{staff}/milk_detail/{year?}/{week?}', [\App\Http\Controllers\StaffController::class, 'milkDetail'])->name('staffs.milk.details');
    Route::get('/staffs/{attendance}/{day?}', [\App\Http\Controllers\StaffController::class, 'doAttendance'])->name('staffs.do.attendance');
    Route::get('/staffs/milk_detail/{milk_detail}/{day?}', [\App\Http\Controllers\StaffController::class, 'doMilkDetail'])->name('staffs.do.detail');
    Route::put('/staffs/{staff}', [\App\Http\Controllers\StaffController::class, 'update'])->name('staffs.update');
    
    Route::get('/cheeses', [\App\Http\Controllers\CheeseController::class, 'index'])->name('cheeses.index');
    Route::get('/cheeses/print', [\App\Http\Controllers\CheeseController::class, 'print'])->name('cheeses.print');
    Route::post('/cheeses', [\App\Http\Controllers\CheeseController::class, 'store'])->name('cheeses.store');
    Route::get('/cheeses/create', [\App\Http\Controllers\CheeseController::class, 'create'])->name('cheeses.create');
    Route::get('/cheeses/{cheese}/edit', [\App\Http\Controllers\CheeseController::class, 'edit'])->name('cheeses.edit');
    Route::delete('/cheeses/{cheese}', [\App\Http\Controllers\CheeseController::class, 'destroy'])->name('cheeses.destroy');
    Route::put('/cheeses/{cheese}', [\App\Http\Controllers\CheeseController::class, 'update'])->name('cheeses.update');
    
    Route::get('/attendances/{attendance}/{day?}/show', [\App\Http\Controllers\StaffAttendanceController::class, 'show'])->name('attendances.show');
    Route::get('/attendances/{year?}/{month?}/{day?}', [\App\Http\Controllers\StaffAttendanceController::class, 'index'])->name('attendances.index');
    Route::put('/attendances/{attendance}', [\App\Http\Controllers\StaffAttendanceController::class, 'update'])->name('attendances.update');
    Route::put('/attendances/{attendance}/in', [\App\Http\Controllers\StaffAttendanceController::class, 'in'])->name('attendances.in');
    Route::put('/attendances/{attendance}/out', [\App\Http\Controllers\StaffAttendanceController::class, 'out'])->name('attendances.out');
    
    Route::get('/milk_details/{year?}/{week?}', [\App\Http\Controllers\MilkDetailController::class, 'index'])->name('milk_details.index');
    Route::get('/milk_details/{year?}/{week?}/print', [\App\Http\Controllers\MilkDetailController::class, 'print'])->name('milk_details.print');
    Route::put('/milk_details/{detail}', [\App\Http\Controllers\MilkDetailController::class, 'update'])->name('milk_detail.update');

    Route::get('/dairy_industry/{year?}/{week?}', [\App\Http\Controllers\DairyIndustryController::class, 'index'])->name('dairy_industry.index');
    Route::get('/dairy_industry/{year?}/{week?}/print', [\App\Http\Controllers\DairyIndustryController::class, 'print'])->name('dairy_industry.print');
    Route::get('/dairy_industry/{dairy}/edit/{day}', [\App\Http\Controllers\DairyIndustryController::class, 'edit'])->name('dairy_industry.edit');
    Route::put('/dairy_industry/{dairy}', [\App\Http\Controllers\DairyIndustryController::class, 'update'])->name('dairy_industry.update');

    Route::get('/cheese_process/{year?}/{week?}', [\App\Http\Controllers\CheeseProcessController::class, 'index'])->name('cheese_process.index');
    Route::get('/cheese_process/{year?}/{week?}/print', [\App\Http\Controllers\CheeseProcessController::class, 'print'])->name('cheese_process.print');
    Route::get('/cheese_process/{cheese}/edit/{day}', [\App\Http\Controllers\CheeseProcessController::class, 'edit'])->name('cheese_process.edit');
    Route::put('/cheese_process/{cheese}', [\App\Http\Controllers\CheeseProcessController::class, 'update'])->name('cheese_process.update');

    Route::get('/gouda_regular/{year?}/{week?}', [\App\Http\Controllers\GoudaRegularController::class, 'index'])->name('gouda_regular.index');
    Route::get('/gouda_regular/{year?}/{week?}/print', [\App\Http\Controllers\GoudaRegularController::class, 'print'])->name('gouda_regular.print');
    Route::get('/gouda_regular/{regular}/edit/{day}', [\App\Http\Controllers\GoudaRegularController::class, 'edit'])->name('gouda_regular.edit');
    Route::put('/gouda_regular/{regular}', [\App\Http\Controllers\GoudaRegularController::class, 'update'])->name('gouda_regular.update');

    Route::get('/kishek/{year?}/{week?}', [\App\Http\Controllers\KishekController::class, 'index'])->name('kishek.index');
    Route::get('/kishek/{year?}/{week?}/print', [\App\Http\Controllers\KishekController::class, 'print'])->name('kishek.print');
    Route::get('/kishek/{kishek}/edit/{day}', [\App\Http\Controllers\KishekController::class, 'edit'])->name('kishek.edit');
    Route::put('/kishek/{kishek}', [\App\Http\Controllers\KishekController::class, 'update'])->name('kishek.update');

    Route::get('/laban_process/{year?}/{week?}', [\App\Http\Controllers\LabanProcessController::class, 'index'])->name('laban_process.index');
    Route::get('/laban_process/{year?}/{week?}/print', [\App\Http\Controllers\LabanProcessController::class, 'print'])->name('laban_process.print');
    Route::get('/laban_process/{laban}/edit/{day}', [\App\Http\Controllers\LabanProcessController::class, 'edit'])->name('laban_process.edit');
    Route::put('/laban_process/{laban}', [\App\Http\Controllers\LabanProcessController::class, 'update'])->name('laban_process.update');

    Route::get('/labneh_process/{year?}/{week?}', [\App\Http\Controllers\LabnehProcessController::class, 'index'])->name('labneh_process.index');
    Route::get('/labneh_process/{year?}/{week?}/print', [\App\Http\Controllers\LabnehProcessController::class, 'print'])->name('labneh_process.print');
    Route::get('/labneh_process/{labneh}/edit/{day}', [\App\Http\Controllers\LabnehProcessController::class, 'edit'])->name('labneh_process.edit');
    Route::put('/labneh_process/{labneh}', [\App\Http\Controllers\LabnehProcessController::class, 'update'])->name('labneh_process.update');

    Route::get('/margarine/{year?}/{week?}', [\App\Http\Controllers\MargarineController::class, 'index'])->name('margarine.index');
    Route::get('/margarine/{year?}/{week?}/print', [\App\Http\Controllers\MargarineController::class, 'print'])->name('margarine.print');
    Route::get('/margarine/{margarine}/edit/{day}', [\App\Http\Controllers\MargarineController::class, 'edit'])->name('margarine.edit');
    Route::put('/margarine/{margarine}', [\App\Http\Controllers\MargarineController::class, 'update'])->name('margarine.update');

    Route::get('/comte/{year?}/{week?}', [\App\Http\Controllers\LeComteController::class, 'index'])->name('comte.index');
    Route::get('/comte/{year?}/{week?}/print', [\App\Http\Controllers\LeComteController::class, 'print'])->name('comte.print');
    Route::get('/comte/{comte}/edit/{day}', [\App\Http\Controllers\LeComteController::class, 'edit'])->name('comte.edit');
    Route::put('/comte/{comte}', [\App\Http\Controllers\LeComteController::class, 'update'])->name('comte.update');

    Route::get('/raclette/{year?}/{week?}', [\App\Http\Controllers\RacletteController::class, 'index'])->name('raclette.index');
    Route::get('/raclette/{year?}/{week?}/print', [\App\Http\Controllers\RacletteController::class, 'print'])->name('raclette.print');
    Route::get('/raclette/{raclette}/edit/{day}', [\App\Http\Controllers\RacletteController::class, 'edit'])->name('raclette.edit');
    Route::put('/raclette/{raclette}', [\App\Http\Controllers\RacletteController::class, 'update'])->name('raclette.update');

    Route::get('/serum/{year?}/{week?}', [\App\Http\Controllers\SerumController::class, 'index'])->name('serum.index');
    Route::get('/serum/{year?}/{week?}/print', [\App\Http\Controllers\SerumController::class, 'print'])->name('serum.print');
    Route::get('/serum/{serum}/edit/{day}', [\App\Http\Controllers\SerumController::class, 'edit'])->name('serum.edit');
    Route::put('/serum/{serum}', [\App\Http\Controllers\SerumController::class, 'update'])->name('serum.update');

    Route::get('/shankleesh/{year?}/{week?}', [\App\Http\Controllers\ShankleeshController::class, 'index'])->name('shankleesh.index');
    Route::get('/shankleesh/{year?}/{week?}/print', [\App\Http\Controllers\ShankleeshController::class, 'print'])->name('shankleesh.print');
    Route::get('/shankleesh/{shankleesh}/edit/{day}', [\App\Http\Controllers\ShankleeshController::class, 'edit'])->name('shankleesh.edit');
    Route::put('/shankleesh/{shankleesh}', [\App\Http\Controllers\ShankleeshController::class, 'update'])->name('shankleesh.update');

    Route::get('/tomme/{year?}/{week?}', [\App\Http\Controllers\TommeController::class, 'index'])->name('tomme.index');
    Route::get('/tomme/{year?}/{week?}/print', [\App\Http\Controllers\TommeController::class, 'print'])->name('tomme.print');
    Route::get('/tomme/{tomme}/edit/{day}', [\App\Http\Controllers\TommeController::class, 'edit'])->name('tomme.edit');
    Route::put('/tomme/{tomme}', [\App\Http\Controllers\TommeController::class, 'update'])->name('tomme.update');

    
    // mouneh_industry
    Route::get('/mouneh-industries', [\App\Http\Controllers\MounehIndustryController::class, 'index'])->name('mouneh-industries.index');
    Route::get('/mouneh-industries/print', [\App\Http\Controllers\MounehIndustryController::class, 'print'])->name('mouneh-industries.print');
    Route::post('/mouneh-industries', [\App\Http\Controllers\MounehIndustryController::class, 'store'])->name('mouneh-industries.store');
    Route::get('/mouneh-industries/create', [\App\Http\Controllers\MounehIndustryController::class, 'create'])->name('mouneh-industries.create');
    Route::get('/mouneh-industries/{mounehIndustry}/edit', [\App\Http\Controllers\MounehIndustryController::class, 'edit'])->name('mouneh-industries.edit');
    Route::delete('/mouneh-industries/{mounehIndustry}', [\App\Http\Controllers\MounehIndustryController::class, 'destroy'])->name('mouneh-industries.destroy');
    Route::put('/mouneh-industries/{mounehIndustry}', [\App\Http\Controllers\MounehIndustryController::class, 'update'])->name('mouneh-industries.update');


    Route::get('/inventory', [\App\Http\Controllers\InventoryController::class, 'show'])->name('inventory.index');
    Route::post('/inventory/close', [\App\Http\Controllers\InventoryController::class, 'close'])->name('inventory.close');
    Route::get('/inventory/{inventoryHistory}/print', [\App\Http\Controllers\InventoryController::class, 'print'])->name('inventory.print');
    // Route::get('/inventory', [\App\Http\Controllers\InventoryController:class, 'index']))->name('inventory.index');

    //API
    Route::get('/inventory/categories', [\App\Http\Controllers\InventoryController::class, 'getCategories']);
    Route::get('/inventory/products', [\App\Http\Controllers\InventoryController::class, 'getProducts']);
    Route::get('/customers/search/all', [\App\Http\Controllers\CustomerController::class, 'search']);
    Route::post('/customers/create-new', [\App\Http\Controllers\CustomerController::class, 'createNew']);
    // Route::get('/plasticBuckets/categories', [\App\Http\Controllers\PlasticBucketController::class, 'getBuckets']);

    // === mbb 1 Feb 2025 ====
    // czech_cheeses
    Route::get('/czech_cheeses', [\App\Http\Controllers\CzechCheeseController::class, 'index'])->name('czech_cheeses.index');
    Route::get('/czech_cheeses/print', [\App\Http\Controllers\CzechCheeseController::class, 'print'])->name('czech_cheeses.print');
    Route::post('/czech_cheeses', [\App\Http\Controllers\CzechCheeseController::class, 'store'])->name('czech_cheeses.store');
    Route::get('/czech_cheeses/create', [\App\Http\Controllers\CzechCheeseController::class, 'create'])->name('czech_cheeses.create');
    Route::get('/czech_cheeses/{czechCheese}/edit', [\App\Http\Controllers\CzechCheeseController::class, 'edit'])->name('czech_cheeses.edit');
    Route::delete('/czech_cheeses/{czechCheese}', [\App\Http\Controllers\CzechCheeseController::class, 'destroy'])->name('czech_cheeses.destroy');
    Route::put('/czech_cheeses/{czechCheese}', [\App\Http\Controllers\CzechCheeseController::class, 'update'])->name('czech_cheeses.update');


    // === mbb 1 Feb 2025 ====
    // country_milks
    Route::get('/country_milks', [\App\Http\Controllers\CountryMilkController::class, 'index'])->name('country_milks.index');
    Route::get('/country_milks/print', [\App\Http\Controllers\CountryMilkController::class, 'print'])->name('country_milks.print');
    Route::post('/country_milks', [\App\Http\Controllers\CountryMilkController::class, 'store'])->name('country_milks.store');
    Route::get('/country_milks/create', [\App\Http\Controllers\CountryMilkController::class, 'create'])->name('country_milks.create');
    Route::get('/country_milks/{countryMilk}/edit', [\App\Http\Controllers\CountryMilkController::class, 'edit'])->name('country_milks.edit');
    Route::delete('/country_milks/{countryMilk}', [\App\Http\Controllers\CountryMilkController::class, 'destroy'])->name('country_milks.destroy');
    Route::put('/country_milks/{countryMilk}', [\App\Http\Controllers\CountryMilkController::class, 'update'])->name('country_milks.update');

    // === mbb 2 Feb 2025 ====
    // feta_cheeses
    Route::get('/feta_cheeses', [\App\Http\Controllers\FetaCheeseController::class, 'index'])->name('feta_cheeses.index');
    Route::get('/feta_cheeses/print', [\App\Http\Controllers\FetaCheeseController::class, 'print'])->name('feta_cheeses.print');
    Route::post('/feta_cheeses', [\App\Http\Controllers\FetaCheeseController::class, 'store'])->name('feta_cheeses.store');
    Route::get('/feta_cheeses/create', [\App\Http\Controllers\FetaCheeseController::class, 'create'])->name('feta_cheeses.create');
    Route::get('/feta_cheeses/{fetaCheese}/edit', [\App\Http\Controllers\FetaCheeseController::class, 'edit'])->name('feta_cheeses.edit');
    Route::delete('/feta_cheeses/{fetaCheese}', [\App\Http\Controllers\FetaCheeseController::class, 'destroy'])->name('feta_cheeses.destroy');
    Route::put('/feta_cheeses/{fetaCheese}', [\App\Http\Controllers\FetaCheeseController::class, 'update'])->name('feta_cheeses.update');

    // === mbb 2 Feb 2025 ====
    // My country labneh my_country_labnehs
    Route::get('/my_country_labnehs', [\App\Http\Controllers\MyCountryLabnehController::class, 'index'])->name('my_country_labnehs.index');
    Route::get('/my_country_labnehs/print', [\App\Http\Controllers\MyCountryLabnehController::class, 'print'])->name('my_country_labnehs.print');
    Route::post('/my_country_labnehs', [\App\Http\Controllers\MyCountryLabnehController::class, 'store'])->name('my_country_labnehs.store');
    Route::get('/my_country_labnehs/create', [\App\Http\Controllers\MyCountryLabnehController::class, 'create'])->name('my_country_labnehs.create');
    Route::get('/my_country_labnehs/{myCountryLabneh}/edit', [\App\Http\Controllers\MyCountryLabnehController::class, 'edit'])->name('my_country_labnehs.edit');
    Route::delete('/my_country_labnehs/{myCountryLabneh}', [\App\Http\Controllers\MyCountryLabnehController::class, 'destroy'])->name('my_country_labnehs.destroy');
    Route::put('/my_country_labnehs/{myCountryLabneh}', [\App\Http\Controllers\MyCountryLabnehController::class, 'update'])->name('my_country_labnehs.update');

    // === mbb 2 Feb 2025 ====
    // White Cheese white_cheeses
    Route::get('/white_cheeses', [\App\Http\Controllers\WhiteCheeseController::class, 'index'])->name('white_cheeses.index');
    Route::get('/white_cheeses/print', [\App\Http\Controllers\WhiteCheeseController::class, 'print'])->name('white_cheeses.print');
    Route::post('/white_cheeses', [\App\Http\Controllers\WhiteCheeseController::class, 'store'])->name('white_cheeses.store');
    Route::get('/white_cheeses/create', [\App\Http\Controllers\WhiteCheeseController::class, 'create'])->name('white_cheeses.create');
    Route::get('/white_cheeses/{whiteCheese}/edit', [\App\Http\Controllers\WhiteCheeseController::class, 'edit'])->name('white_cheeses.edit');
    Route::delete('/white_cheeses/{whiteCheese}', [\App\Http\Controllers\WhiteCheeseController::class, 'destroy'])->name('white_cheeses.destroy');
    Route::put('/white_cheeses/{whiteCheese}', [\App\Http\Controllers\WhiteCheeseController::class, 'update'])->name('white_cheeses.update');

    // === mbb 2 Feb 2025 ====
    // White Cheese white_cheeses
    Route::get('/double_creams', [\App\Http\Controllers\DoubleCreamController::class, 'index'])->name('double_creams.index');
    Route::get('/double_creams/print', [\App\Http\Controllers\DoubleCreamController::class, 'print'])->name('double_creams.print');
    Route::post('/double_creams', [\App\Http\Controllers\DoubleCreamController::class, 'store'])->name('double_creams.store');
    Route::get('/double_creams/create', [\App\Http\Controllers\DoubleCreamController::class, 'create'])->name('double_creams.create');
    Route::get('/double_creams/{doubleCream}/edit', [\App\Http\Controllers\DoubleCreamController::class, 'edit'])->name('double_creams.edit');
    Route::delete('/double_creams/{doubleCream}', [\App\Http\Controllers\DoubleCreamController::class, 'destroy'])->name('double_creams.destroy');
    Route::put('/double_creams/{doubleCream}', [\App\Http\Controllers\DoubleCreamController::class, 'update'])->name('double_creams.update');

    // White Commercial Milk - 20 Feb
    Route::get('/commercial_milks', [\App\Http\Controllers\CommercialMilkController::class, 'index'])->name('commercial_milks.index');
    Route::get('/commercial_milks/print', [\App\Http\Controllers\CommercialMilkController::class, 'print'])->name('commercial_milks.print');
    Route::post('/commercial_milks', [\App\Http\Controllers\CommercialMilkController::class, 'store'])->name('commercial_milks.store');
    Route::get('/commercial_milks/create', [\App\Http\Controllers\CommercialMilkController::class, 'create'])->name('commercial_milks.create');
    Route::get('/commercial_milks/{commercialMilk}/edit', [\App\Http\Controllers\CommercialMilkController::class, 'edit'])->name('commercial_milks.edit');
    Route::delete('/commercial_milks/{commercialMilk}', [\App\Http\Controllers\CommercialMilkController::class, 'destroy'])->name('commercial_milks.destroy');
    Route::put('/commercial_milks/{commercialMilk}', [\App\Http\Controllers\CommercialMilkController::class, 'update'])->name('commercial_milks.update');

    // === mbb 6 Feb 2025 ====
    // White GPS Tracker page
    Route::get('/gps_trackers', [\App\Http\Controllers\GpsTrackerController::class, 'index'])->name('gps_trackers.index');
    Route::get('/gps_trackers/vehicles', [\App\Http\Controllers\GpsTrackerController::class, 'vehicles'])->name('gps_trackers.vehicles');
    Route::get('/gps_trackers/status', [\App\Http\Controllers\GpsTrackerController::class, 'status'])->name('gps_trackers.status');
    Route::put('/gps_trackers/updateDetails', [\App\Http\Controllers\GpsTrackerController::class, 'updateDetails'])->name('gps_trackers.updateDetails');
    Route::put('/gps_trackers/updateUserHash', [\App\Http\Controllers\GpsTrackerController::class, 'updateUserHash'])->name('gps_trackers.updateUserHash');
    

    // == PLstic Buckets routes
    // === mbb 9 Feb 2025 ====
    Route::get('/plastic_buckets', [\App\Http\Controllers\PlasticBucketController::class, 'index'])->name('plasticBuckets.index');
    Route::post('/plastic_buckets', [\App\Http\Controllers\PlasticBucketController::class, 'store'])->name('plasticBuckets.store');
    Route::get('/plastic_buckets/create', [\App\Http\Controllers\PlasticBucketController::class, 'create'])->name('plasticBuckets.create');
    Route::get('/plastic_buckets/{plasticBucket}/edit', [\App\Http\Controllers\PlasticBucketController::class, 'edit'])->name('plasticBuckets.edit');
    Route::delete('/plastic_buckets/{plasticBucket}', [\App\Http\Controllers\PlasticBucketController::class, 'destroy'])->name('plasticBuckets.destroy');
    Route::put('/plastic_buckets/{plasticBucket}', [\App\Http\Controllers\PlasticBucketController::class, 'update'])->name('plasticBuckets.update');

    // == General Restrictions routes
    // === mbb 10 Feb 2025 ====
    Route::get('/general_restrictions', [\App\Http\Controllers\GeneralRestrictionController::class, 'index'])->name('generalRestrictions.index');
    
    Route::get('/general_restrictions/warehouse', [\App\Http\Controllers\GeneralRestrictionController::class, 'warehouse'])->name('generalRestrictions.warehouse');
    Route::get('/general_restrictions/coolingRooms', [\App\Http\Controllers\GeneralRestrictionController::class, 'coolingRooms'])->name('generalRestrictions.coolingRooms');
    Route::get('/general_restrictions/coolingRoomsBeiruit', [\App\Http\Controllers\GeneralRestrictionController::class, 'coolingRoomsBeiruit'])->name('generalRestrictions.coolingRoomsBeiruit');
    
    Route::get('/general_restrictions/whereHouseCheese/{id}', [\App\Http\Controllers\GeneralRestrictionController::class, 'whereHouseCheese'])->name('generalRestrictions.whereHouseCheese');
    Route::get('/general_restrictions/coolingRoomsCheese/{id}', [\App\Http\Controllers\GeneralRestrictionController::class, 'coolingRoomsCheese'])->name('generalRestrictions.coolingRoomsCheese');
    Route::get('/general_restrictions/coolingRoomsBeiruitCheese/{id}', [\App\Http\Controllers\GeneralRestrictionController::class, 'coolingRoomsBeiruitCheese'])->name('generalRestrictions.coolingRoomsBeiruitCheese');

    
    
    Route::get('/general_restrictions/warehouse/create/{id}', [\App\Http\Controllers\GeneralRestrictionController::class, 'wcreate'])->name('generalRestrictions.wcreate');
    Route::get('/general_restrictions/coolingRooms/create/{id}', [\App\Http\Controllers\GeneralRestrictionController::class, 'ccreate'])->name('generalRestrictions.ccreate');
    Route::post('/general_restrictions', [\App\Http\Controllers\GeneralRestrictionController::class, 'w_store'])->name('generalRestrictions.wstore');
    Route::get('/general_restrictions/{generalRestriction}/wedit', [\App\Http\Controllers\GeneralRestrictionController::class, 'wedit'])->name('generalRestrictions.wedit');
    Route::delete('/general_restrictions/{generalRestriction}', [\App\Http\Controllers\GeneralRestrictionController::class, 'wdestroy'])->name('generalRestrictions.wdestroy');
    Route::put('/general_restrictions/{generalRestriction}', [\App\Http\Controllers\GeneralRestrictionController::class, 'update'])->name('generalRestrictions.update');
    Route::delete('/general_restrictions/{generalRestriction}', [\App\Http\Controllers\GeneralRestrictionController::class, 'destroy'])->name('generalRestrictions.destroy');

    Route::post('/general_restrictions/stocktransfer', [\App\Http\Controllers\GeneralRestrictionController::class, 'stockTransfer'])->name('generalRestrictions.stocktransfer');

    Route::get('/general_restrictions/transfer-history', [\App\Http\Controllers\GeneralRestrictionController::class, 'transferHistory'])->name('generalRestrictions.transferHistory');

    // White Cheese white_cheeses
    Route::get('/ingredients', [\App\Http\Controllers\IngredientController::class, 'index'])->name('ingredients.index');
    // Route::post('/ingredients', [\App\Http\Controllers\IngredientController::class, 'store'])->name('ingredients.store');
    // Route::get('/ingredients/create', [\App\Http\Controllers\IngredientController::class, 'create'])->name('ingredients.create');
    // Route::get('/ingredients/{doubleCream}/edit', [\App\Http\Controllers\IngredientController::class, 'edit'])->name('ingredients.edit');
    // Route::delete('/ingredients/{doubleCream}', [\App\Http\Controllers\IngredientController::class, 'destroy'])->name('ingredients.destroy');
    // Route::put('/ingredients/{doubleCream}', [\App\Http\Controllers\IngredientController::class, 'update'])->name('ingredients.update');



    // === 20 Feb 2025 ====
    Route::get('/cars', [\App\Http\Controllers\CarController::class, 'index'])->name('cars.index');
    Route::post('/cars', [\App\Http\Controllers\CarController::class, 'store'])->name('cars.store');
    Route::get('/cars/create', [\App\Http\Controllers\CarController::class, 'create'])->name('cars.create');
    Route::get('/cars/{car}/edit', [\App\Http\Controllers\CarController::class, 'edit'])->name('cars.edit');
    Route::get('/cars/{car}', [\App\Http\Controllers\CarController::class, 'show'])->name('cars.show');
    Route::delete('/cars/{car}', [\App\Http\Controllers\CarController::class, 'destroy'])->name('cars.destroy');
    Route::put('/cars/{car}', [\App\Http\Controllers\CarController::class, 'update'])->name('cars.update');
    
    // === 20 Feb 2025 ====
    Route::get('/stocks', [\App\Http\Controllers\StockController::class, 'index'])->name('stocks.index');
    Route::get('/stocks/plastics', [\App\Http\Controllers\StockController::class, 'plastic'])->name('stocks.plastic');
    Route::get('/stocks/generals', [\App\Http\Controllers\StockController::class, 'general'])->name('stocks.general');
    Route::get('/stocks/ingredients', [\App\Http\Controllers\StockController::class, 'ingredients'])->name('stocks.ingredients');
    Route::get('/stocks/items', [\App\Http\Controllers\StockController::class, 'items'])->name('stocks.items');
    Route::get('/stocks/salesman', [\App\Http\Controllers\StockController::class, 'salesman'])->name('stocks.salesman');
    Route::get('/stocks/purchase', [\App\Http\Controllers\StockController::class, 'purchase'])->name('stocks.purchase');

    // Drivers Routes
    Route::get('/drivers', [\App\Http\Controllers\DriverController::class, 'index'])->name('drivers.index');
    Route::get('/drivers/create', [\App\Http\Controllers\DriverController::class, 'create'])->name('drivers.create');
    Route::post('/drivers', [\App\Http\Controllers\DriverController::class, 'store'])->name('drivers.store');
    Route::get('/drivers/{driver}', [\App\Http\Controllers\DriverController::class, 'show'])->name('drivers.show');
    Route::get('/drivers/{driver}/edit', [\App\Http\Controllers\DriverController::class, 'edit'])->name('drivers.edit');
    Route::put('/drivers/{driver}', [\App\Http\Controllers\DriverController::class, 'update'])->name('drivers.update');
    Route::delete('/drivers/{driver}', [\App\Http\Controllers\DriverController::class, 'destroy'])->name('drivers.destroy');

    // Car Types Routes
    Route::get('/car-types', [\App\Http\Controllers\CarTypeController::class, 'index'])->name('car-types.index');
    Route::get('/car-types/create', [\App\Http\Controllers\CarTypeController::class, 'create'])->name('car-types.create');
    Route::post('/car-types', [\App\Http\Controllers\CarTypeController::class, 'store'])->name('car-types.store');
    Route::get('/car-types/{carType}', [\App\Http\Controllers\CarTypeController::class, 'show'])->name('car-types.show');
    Route::get('/car-types/{carType}/edit', [\App\Http\Controllers\CarTypeController::class, 'edit'])->name('car-types.edit');
    Route::put('/car-types/{carType}', [\App\Http\Controllers\CarTypeController::class, 'update'])->name('car-types.update');
    Route::delete('/car-types/{carType}', [\App\Http\Controllers\CarTypeController::class, 'destroy'])->name('car-types.destroy');




    Route::get('/database/download', function () {
        return response()->download(database_path('database.sqlite'), 'database.sqlite');
    })->name('database.download');
    Route::get('/storage/link', function () {
        try {
            Artisan::call('storage:link');
        } catch (\Exception $e) {
            return back()->with('error', $e->getMessage());
        }
        return back()->with('success', 'Storage has been linked');
    })->name('storage.link');

    Route::get('/products/search/all', [\App\Http\Controllers\ProductController::class, 'search']);

    Route::post('/order', [\App\Http\Controllers\OrderController::class, 'store']);
    Route::post('/settings/starting-cash', [\App\Http\Controllers\SettingsController::class, 'updateStartingCashValue']);

    Route::get('/uploads/{path}', [App\Http\Controllers\ImageController::class, 'show'])->where('path', '.*')->name('image.show');
});