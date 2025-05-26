@extends('layouts.app')
@section('title', __('Transfer History'))

@section('content')
    <div class="d-flex align-items-center justify-content-center mb-3">
        <div class="h4 mb-0 flex-grow-1">@lang('Transfer History')</div>
        <x-back-btn href="{{ route('generalRestrictions.index') }}" />
    </div>
    <div class="card w-100">
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-hover table-striped table-hover-x">
                    <thead>
                        <tr>
                            <th>@lang('Date')</th>
                            <th>@lang('Product')</th>
                            <th>@lang('Quantity')</th>
                            <th>@lang('From')</th>
                            <th>@lang('To')</th>
                            <th>@lang('Driver')</th>
                            <th>@lang('Vehicle')</th>
                            <th>@lang('Price')</th>
                        </tr>
                    </thead>
                    <tbody class="border-top-0">
                        @foreach ($transferHistories as $transfer)
                            <tr>
                                <td class="align-middle">{{ $transfer->created_at->format('Y-m-d H:i') }}</td>
                                <td class="align-middle fw-bold">{{ $transfer->product_name }}</td>
                                <td class="align-middle">{{ $transfer->gr_stock }}</td>
                                <td class="align-middle">
                                    <span class="badge bg-primary">{{ ucfirst(str_replace('_', ' ', $transfer->from_sub_category_name)) }}</span>
                                </td>
                                <td class="align-middle">
                                    <span class="badge bg-success">{{ ucfirst(str_replace('_', ' ', $transfer->to_sub_category_name)) }}</span>
                                </td>
                                <td class="align-middle">
                                    @if($transfer->driver)
                                        <div>
                                            <strong>{{ $transfer->driver->name }}</strong>
                                            @if($transfer->driver->phone)
                                                <br><small class="text-muted">{{ $transfer->driver->phone }}</small>
                                            @endif
                                        </div>
                                    @else
                                        <span class="text-muted">@lang('Not assigned')</span>
                                    @endif
                                </td>
                                <td class="align-middle">
                                    @if($transfer->carType)
                                        <div>
                                            <strong>{{ $transfer->carType->name }}</strong>
                                            <br><small class="text-muted">{{ $transfer->carType->plate_number }}</small>
                                        </div>
                                    @else
                                        <span class="text-muted">@lang('Not assigned')</span>
                                    @endif
                                </td>
                                <td class="align-middle">{{ number_format($transfer->gr_price, 2) }}</td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>
                @if ($transferHistories->isEmpty())
                    <x-no-data />
                @endif
            </div>
            <div class="">
                {{ $transferHistories->withQueryString()->links() }}
            </div>
        </div>
    </div>
@endsection