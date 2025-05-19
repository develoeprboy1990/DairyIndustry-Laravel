@extends('layouts.app')
@section('title', 'Sales')

@section('content')

    @php
        $groupedSales = $sales->groupBy('category_id');
    @endphp

    <div class="d-flex align-items-center justify-content-center mb-3">
        <div class="mb-0 flex-grow-1">
            <div class="mb-0 h4"> <span class="fw-bold" dir="ltr">№{{ $serial_number }}</span></div>
        </div>
        <x-back-btn href="{{ route('sales.index') }}" />
    </div>
    <x-card>
        <button class="btn btn-primary mb-3 px-4" onclick="printDiv('printableArea')">
            <x-heroicon-o-printer class="hero-icon-sm me-1" /> @lang('Print')
        </button>

        <table class="table table-bordered">
            <tbody>
                <tr>
                    <td>@lang('Report') №</td>
                    <td>{{ $serial_number }}</td>
                </tr>
                <tr>
                    <td>@lang('Date')</td>
                    <td>{{ $date }}</td>
                </tr>
                <tr>
                    <td>@lang('Expenses')</td>
                    <td>{{ currency_format($totalExpenses) }}</td>
                </tr>
                <tr>
                    <td>@lang('Payments')</td>
                    <td>{{ currency_format($payments) }}</td>
                </tr>
                <tr>
                    <td>@lang('Total Sales')</td>
                    <td>{{ currency_format($total_sales) }}</td>
                </tr>
            </tbody>
        </table>

        <!-- Expenses Card -->
        <div class="card" style="border-radius: 10px; border: 1px solid #dcdcdc; margin-bottom: 30px;">
            <div class="card-header" style="background-color: #f7f7f7; border-bottom: 2px solid #bdc3c7;">
                <h5 style="font-size: 1.25rem; font-weight: bold; color: #34495e; text-align: center;">Categorywise Expense
                    Details</h5>
            </div>
            <div class="card-body">
                @if ($categoryTotals->isEmpty())
                    <p class="text-center">No expense data found for the selected date range.</p>
                @else
                    <table class="table table-bordered" style="border-radius: 8px; margin-bottom: 20px;">
                        <thead style="background-color: #3498db; color: #fff; font-weight: bold; text-align: center;">
                            <tr>
                                <th>@lang('Category')</th>
                                <th>@lang('Total Count')</th>
                                <th>@lang('Total Expenses')</th>
                            </tr>
                        </thead>
                        <tbody style="border-top: 0;">
                            @foreach ($categoryTotals as $category)
                                <tr style="background-color: {{ $loop->odd ? '#f9fafb' : '#ffffff' }};">
                                    <td>{{ $category['category_name'] }}</td>
                                    <td class="text-center">{{ $category['expenses']->count() }}</td>
                                    <td class="text-center">{{ currency_format($category['total_amount']) }}</td>
                                </tr>
                            @endforeach
                        </tbody>
                    </table>

                    @foreach ($categoryTotals as $categoryId => $categoryData)
                        <h5
                            style="font-size: 1.25rem; font-weight: bold; color: #34495e; margin-top: 20px; border-bottom: 2px solid #bdc3c7; text-align: center;">
                            Category: {{ $categoryData['category_name'] }}</h5>
                        <table class="table table-bordered" style="border-radius: 8px; margin-bottom: 20px;">
                            <thead style="background-color: #3498db; color: #fff; font-weight: bold; text-align: center;">
                                <tr>
                                    <th>@lang('Reason')</th>
                                    <th>@lang('Expense Category Name')</th>
                                    <th>@lang('Mode')</th>
                                    <th>@lang('Amount')</th>
                                </tr>
                            </thead>
                            <tbody style="border-top: 0;">
                                @foreach ($categoryData['expenses'] as $expense)
                                    <tr style="background-color: {{ $loop->odd ? '#f9fafb' : '#ffffff' }};">
                                        <td>{{ $expense->reason }}</td>
                                        <td>{{ $categoryData['category_name'] }}</td>
                                        <td class="text-center">{{ $expense->mode }}</td>
                                        <td class="text-center">{{ currency_format($expense->amount) }}</td>
                                    </tr>
                                @endforeach
                            </tbody>
                            <tfoot style="background-color: #f7f7f7; font-weight: bold;">
                                <tr>
                                    <td colspan="3" class="text-end">@lang('Total')</td>
                                    <td class="text-center">{{ currency_format($categoryData['total_amount']) }}</td>
                                </tr>
                            </tfoot>
                        </table>
                    @endforeach
                @endif
            </div>
        </div>

        <!-- Separator: Horizontal Line between Sales and Expenses -->
        <hr style="border-top: 2px solid #3498db; margin: 40px 0;">

        <!-- Sales Card -->
        <div class="card" style="border-radius: 10px; border: 1px solid #dcdcdc; margin-bottom: 30px;">
            <div class="card-header" style="background-color: #f7f7f7; border-bottom: 2px solid #bdc3c7;">
                <h5 style="font-size: 1.25rem; font-weight: bold; color: #34495e; text-align: center;">Categorywise Sales
                    Details</h5>
            </div>
            <div class="card-body">
                @if ($sales_category->isEmpty())
                    <p class="text-center">No sales data found for the selected date range.</p>
                @else
                    <table class="table table-bordered" style="border-radius: 8px; margin-bottom: 20px;">
                        <thead style="background-color: #3498db; color: #fff; font-weight: bold; text-align: center;">
                            <tr>
                                <th>@lang('Category')</th>
                                <th>@lang('Total Count')</th>
                                <th>@lang('Total Sales')</th>
                            </tr>
                        </thead>
                        <tbody style="border-top: 0;">
                            @foreach ($sales_category as $sale)
                                <tr style="background-color: {{ $loop->odd ? '#f9fafb' : '#ffffff' }};">
                                    <td>{{ $sale->category_name }}</td>
                                    <td class="text-center">{{ $sale->total_qty }}</td>
                                    <td class="text-center">{{ currency_format($sale->total_sales) }}</td>
                                </tr>
                            @endforeach
                        </tbody>
                    </table>

                    @foreach ($groupedSales as $categoryId => $categorySales)
                        <h5
                            style="font-size: 1.25rem; font-weight: bold; color: #34495e; margin-top: 20px; border-bottom: 2px solid #bdc3c7; text-align: center;">
                            Category: {{ $categorySales->first()->category_name }}</h5>
                        <table class="table table-bordered" style="border-radius: 8px; margin-bottom: 20px;">
                            <thead style="background-color: #3498db; color: #fff; font-weight: bold; text-align: center;">
                                <tr>
                                    <th>@lang('Item')</th>
                                    <th>@lang('Quantity Sold')</th>
                                    <th>@lang('Total')</th>
                                </tr>
                            </thead>
                            <tbody style="border-top: 0;">
                                @foreach ($categorySales as $sale)
                                    <tr style="background-color: {{ $loop->odd ? '#f9fafb' : '#ffffff' }};">
                                        <td>{{ $sale->product->name }}</td>
                                        <td class="text-center">{{ $sale->qty }}</td>
                                        <td class="text-center">{{ currency_format($sale->total) }}</td>
                                    </tr>
                                @endforeach
                            </tbody>
                            <tfoot style="background-color: #f7f7f7; font-weight: bold;">
                                <tr>
                                    <td colspan="2" class="text-end">@lang('Total')</td>
                                    <td class="text-center">{{ currency_format($categorySales->sum('total')) }}</td>
                                </tr>
                            </tfoot>
                        </table>
                    @endforeach
                @endif
            </div>
        </div>

    </x-card>

    <div id="printableArea" class="d-none">
        <div style="padding: 0.5rem !important;" dir="ltr" lang="{{ $settings->lang }}">
            <div class="d-flex align-items-center mb-5">
                <div class="flex-grow-1">
                    <div class="flex-grow-1 h1 fw-bold mb-0">
                        {{ $settings->storeName }}
                    </div>
                </div>
                <div>
                    @if ($settings->storeAddress)
                        <div> {{ $settings->storeAddress }}</div>
                    @endif
                    @if ($settings->storePhone)
                        <div> {{ $settings->storePhone }}</div>
                    @endif
                    @if ($settings->storeWebsite)
                        <div> {{ $settings->storeWebsite }}</div>
                    @endif
                    @if ($settings->storeEmail)
                        <div> {{ $settings->storeEmail }}</div>
                    @endif
                </div>
            </div>
            <div class="mb-3 text-uppercase text-center fw-bold h4">Sale Report</div>

            <table class="table table-bordered">
                <tbody>
                    <tr>
                        <td>@lang('Report') №</td>
                        <td>{{ $serial_number }}</td>
                    </tr>
                    <tr>
                        <td>@lang('Date')</td>
                        <td>{{ $date }}</td>
                    </tr>
                    <tr>
                        <td>@lang('Expenses')</td>
                        <td>{{ currency_format($totalExpenses) }}</td>
                    </tr>
                    <tr>
                        <td>@lang('Payments')</td>
                        <td>{{ currency_format($payments) }}</td>
                    </tr>
                    <tr>
                        <td>@lang('Total Sales')</td>
                        <td>{{ currency_format($total_sales) }}</td>
                    </tr>
                </tbody>
            </table>


            <!-- Expenses Card -->
            <div class="card" style="border-radius: 10px; border: 1px solid #dcdcdc; margin-bottom: 30px;">
                <div class="card-header" style="background-color: #f7f7f7; border-bottom: 2px solid #bdc3c7;">
                    <h5 style="font-size: 1.25rem; font-weight: bold; color: #34495e; text-align: center;">Categorywise
                        Expense Details</h5>
                </div>
                <div class="card-body">
                    @if ($categoryTotals->isEmpty())
                        <p class="text-center">No expense data found for the selected date range.</p>
                    @else
                        <table class="table table-bordered" style="border-radius: 8px; margin-bottom: 20px;">
                            <thead style="background-color: #3498db; color: #fff; font-weight: bold; text-align: center;">
                                <tr>
                                    <th>@lang('Category')</th>
                                    <th>@lang('Total Count')</th>
                                    <th>@lang('Total Expenses')</th>
                                </tr>
                            </thead>
                            <tbody style="border-top: 0;">
                                @foreach ($categoryTotals as $category)
                                    <tr style="background-color: {{ $loop->odd ? '#f9fafb' : '#ffffff' }};">
                                        <td>{{ $category['category_name'] }}</td>
                                        <td class="text-center">{{ $category['expenses']->count() }}</td>
                                        <td class="text-center">{{ currency_format($category['total_amount']) }}</td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>

                        @foreach ($categoryTotals as $categoryId => $categoryData)
                            <h5
                                style="font-size: 1.25rem; font-weight: bold; color: #34495e; margin-top: 20px; border-bottom: 2px solid #bdc3c7; text-align: center;">
                                Category: {{ $categoryData['category_name'] }}</h5>
                            <table class="table table-bordered" style="border-radius: 8px; margin-bottom: 20px;">
                                <thead
                                    style="background-color: #3498db; color: #fff; font-weight: bold; text-align: center;">
                                    <tr>
                                        <th>@lang('Reason')</th>
                                        <th>@lang('Expense Category Name')</th>
                                        <th>@lang('Mode')</th>
                                        <th>@lang('Amount')</th>
                                    </tr>
                                </thead>
                                <tbody style="border-top: 0;">
                                    @foreach ($categoryData['expenses'] as $expense)
                                        <tr style="background-color: {{ $loop->odd ? '#f9fafb' : '#ffffff' }};">
                                            <td>{{ $expense->reason }}</td>
                                            <td>{{ $categoryData['category_name'] }}</td>
                                            <td class="text-center">{{ $expense->mode }}</td>
                                            <td class="text-center">{{ currency_format($expense->amount) }}</td>
                                        </tr>
                                    @endforeach
                                </tbody>
                                <tfoot style="background-color: #f7f7f7; font-weight: bold;">
                                    <tr>
                                        <td colspan="3" class="text-end">@lang('Total')</td>
                                        <td class="text-center">{{ currency_format($categoryData['total_amount']) }}</td>
                                    </tr>
                                </tfoot>
                            </table>
                        @endforeach
                    @endif
                </div>
            </div>

            <!-- Separator: Horizontal Line between Sales and Expenses -->
            <hr style="border-top: 2px solid #3498db; margin: 40px 0;">

            <!-- Sales Card -->
            <div class="card" style="border-radius: 10px; border: 1px solid #dcdcdc; margin-bottom: 30px;">
                <div class="card-header" style="background-color: #f7f7f7; border-bottom: 2px solid #bdc3c7;">
                    <h5 style="font-size: 1.25rem; font-weight: bold; color: #34495e; text-align: center;">Categorywise
                        Sales Details</h5>
                </div>
                <div class="card-body">
                    @if ($sales_category->isEmpty())
                        <p class="text-center">No sales data found for the selected date range.</p>
                    @else
                        <table class="table table-bordered" style="border-radius: 8px; margin-bottom: 20px;">
                            <thead style="background-color: #3498db; color: #fff; font-weight: bold; text-align: center;">
                                <tr>
                                    <th>@lang('Category')</th>
                                    <th>@lang('Total Count')</th>
                                    <th>@lang('Total Sales')</th>
                                </tr>
                            </thead>
                            <tbody style="border-top: 0;">
                                @foreach ($sales_category as $sale)
                                    <tr style="background-color: {{ $loop->odd ? '#f9fafb' : '#ffffff' }};">
                                        <td>{{ $sale->category_name }}</td>
                                        <td class="text-center">{{ $sale->total_qty }}</td>
                                        <td class="text-center">{{ currency_format($sale->total_sales) }}</td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>

                        @foreach ($groupedSales as $categoryId => $categorySales)
                            <h5
                                style="font-size: 1.25rem; font-weight: bold; color: #34495e; margin-top: 20px; border-bottom: 2px solid #bdc3c7; text-align: center;">
                                Category: {{ $categorySales->first()->category_name }}</h5>
                            <table class="table table-bordered" style="border-radius: 8px; margin-bottom: 20px;">
                                <thead
                                    style="background-color: #3498db; color: #fff; font-weight: bold; text-align: center;">
                                    <tr>
                                        <th>@lang('Item')</th>
                                        <th>@lang('Quantity Sold')</th>
                                        <th>@lang('Total')</th>
                                    </tr>
                                </thead>
                                <tbody style="border-top: 0;">
                                    @foreach ($categorySales as $sale)
                                        <tr style="background-color: {{ $loop->odd ? '#f9fafb' : '#ffffff' }};">
                                            <td>{{ $sale->product->name }}</td>
                                            <td class="text-center">{{ $sale->qty }}</td>
                                            <td class="text-center">{{ currency_format($sale->total) }}</td>
                                        </tr>
                                    @endforeach
                                </tbody>
                                <tfoot style="background-color: #f7f7f7; font-weight: bold;">
                                    <tr>
                                        <td colspan="2" class="text-end">@lang('Total')</td>
                                        <td class="text-center">{{ currency_format($categorySales->sum('total')) }}</td>
                                    </tr>
                                </tfoot>
                            </table>
                        @endforeach
                    @endif
                </div>
            </div>


        </div>
    </div>
@endsection
@push('script')
    <script>
        function printDiv(divName) {
            var printContents = document.getElementById(divName).innerHTML;
            var originalContents = document.body.innerHTML;
            document.body.innerHTML = printContents;
            window.print();
            document.body.innerHTML = originalContents;
        }
    </script>
@endpush
