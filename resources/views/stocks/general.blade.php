@extends('layouts.app')
@section('title', __('General Restrictions'))

@section('content')
    <div class="d-flex align-items-center justify-content-center mb-3">
        <div class="flex-grow-1">
            <x-page-title>@lang('General Restrictions')</x-page-title>
        </div>
        <x-back-btn href="{{ route('stocks.index') }}" />
    </div>

    <div class="row">
        <div class="col-md-6 mb-3">
            <h4 class="text-center">@lang('Warehouse')</h4>
            <x-card>
                <div class=" table-responsive">
                    <table id="example1" class="table table-hover table-striped table-hover-x">
                        <thead>
                            <tr>
                                <th>@lang('Product Name')</th>
                                <th>@lang('Stock')</th>
                            </tr>
                        </thead>
                        <tbody class="border-top-0">
                            @foreach ($warehouse as $general)
                                <tr>
                                    <td>{{ $general->product_name }}</td>
                                    <td>{{ $general->gr_stock }}</td>
                                </tr>
                            @endforeach

                        </tbody>
                    </table>
                </div>
            </x-card>
        </div>
        <div class="col-md-6 mb-3">
            <h4 class="text-center">@lang('Cooling Rooms')</h4>
            <x-card>
                <div class=" table-responsive">
                    <table id="example2" class="table table-hover table-striped table-hover-x">
                        <thead>
                            <tr>
                                <th>@lang('Product Name')</th>
                                <th>@lang('Stock')</th>
                            </tr>
                        </thead>
                        <tbody class="border-top-0">
                            @foreach ($coolingRooms as $general)
                                <tr>
                                    <td>{{ $general->product_name }}</td>
                                    <td>{{ $general->gr_stock }}</td>
                                </tr>
                            @endforeach

                        </tbody>
                    </table>
                </div>
            </x-card>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <h4 class="text-center">@lang('Cars')</h4>
            <x-card>
                <div class=" table-responsive">
                    <table id="example" class="table table-hover table-striped table-hover-x">
                        <thead>
                            <tr>
                                <th>@lang('Date')</th>
                                <th>@lang('Car Type')</th>
                                <th>@lang('Car Name')</th>
                                <th>@lang('Driver Name')</th>
                                <th>@lang('Driver Phone')</th>
                                <th>@lang('Stock Type')</th>
                                <th>@lang('Stock')</th>
                            </tr>
                        </thead>
                        <tbody class="border-top-0">
                            @foreach ($cars as $car)
                                <tr>
                                    <td>{{ $car->stock_date }}</td>
                                    <td>{{ $car->car_type }}</td>
                                    <td>{{ $car->car_name }}</td>
                                    <td>{{ $car->car_driver_name }}</td>
                                    <td>{{ $car->car_driver_phone }}</td>
                                    <td>{{ $car->product_name }}</td>
                                    <td>{{ $car->product_stock }}</td>
                                </tr>
                            @endforeach

                        </tbody>
                    </table>
                </div>
            </x-card>
        </div>
    </div>
@endsection
@push('script')
    <script>
        new DataTable('#example');
        new DataTable('#example1');
        new DataTable('#example2');
    </script>
@endpush
