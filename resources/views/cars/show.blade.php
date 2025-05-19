@extends('layouts.app')
@section('title', $car->car_name)

@section('content')
    <div class="d-flex align-items-center justify-content-center mb-3">
        <div class="h4 mb-0 flex-grow-1">@lang('Car Name'): {{ $car->car_name }}</div>
        <x-back-btn href="{{ route('cars.index') }}" />
    </div>


    <div class="card mb-3">
        <div class="card-body">
            <div class="mb-3">
                @can_edit
                <a href="{{ route('cars.edit', $car) }}" class="btn btn-outline-primary px-4">
                    @lang('Edit')
                </a>
                @endcan_edit
            </div>
            <div class=" table-responsive mb-0">
                <table class="table table-bordered mb-1">
                    <tbody>
                        <tr>
                            <td>@lang('Car Type')</td>
                            <td class="fw-bold">{{ $car->car_type }}</td>
                        </tr>
                        <tr>
                            <td>@lang('Car Name')</td>
                            <td class="fw-bold">{{ $car->car_name }}</td>
                        </tr>
                        <tr>
                            <td>@lang('Driver Name')</td>
                            <td class="fw-bold">{{ $car->car_driver_name }}</td>
                        </tr>
                        <tr>
                            <td>@lang('Phone')</td>
                            <td class="fw-bold">{{ $car->car_driver_phone }}</td>
                        </tr>
                        <tr>
                            <td>@lang('Date')</td>
                            <td class="fw-bold">{{ $car->stock_date }}</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <div class="card">
        <div class="card-body">
            <div class=" table-responsive mb-0">
                <table class="table table-bordered mb-1">
                    <thead>
                        <tr>
                            <th class=" text-center text-decoration-none fw-bold">@lang('Item')</th>
                            <th class=" text-center text-decoration-none fw-bold">@lang('Quantity')</th>
                        </tr>
                    </thead>
                    <tbody>

                        @foreach ($carDetails as $detail)
                            <tr>
                                <td>{{ $detail->name }}</td>
                                <td class="text-center">{{ $detail->stock }}</td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </div>
@endsection
