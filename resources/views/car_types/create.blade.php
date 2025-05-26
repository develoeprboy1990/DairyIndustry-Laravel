@extends('layouts.app')
@section('title', __('Create') . ' ' . __('Car Type'))

@section('content')
    <div class="d-flex align-items-center justify-content-center mb-3">
        <div class="h4 mb-0 flex-grow-1">@lang('Create') @lang('Car Type')</div>
        <x-back-btn href="{{ route('car-types.index') }}" />
    </div>
    <div class="card w-100">
        <div class="card-body">
            @include('car_types.partials.form')
        </div>
    </div>
@endsection