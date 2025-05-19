@extends('layouts.app')
@section('title', __('Edit') . ' ' . __('Country Milk'))

@section('content')
    <div class="d-flex align-items-center justify-content-center mb-3">
        <div class="h4 mb-0 flex-grow-1">@lang('Edit') @lang('Country Milk')</div>
        <x-back-btn href="{{ route('country_milks.index') }}" />
    </div>
    <div class="card w-100">
        <div class="card-body">
            @include('country_milks.partials.form', ['countryMilk' => $countryMilk])
        </div>
    </div>
@endsection
