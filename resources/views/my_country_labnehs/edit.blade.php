@extends('layouts.app')
@section('title', __('Edit') . ' ' . __('My Country Labneh'))

@section('content')
    <div class="d-flex align-items-center justify-content-center mb-3">
        <div class="h4 mb-0 flex-grow-1">@lang('Edit') @lang('My Country Labneh')</div>
        <x-back-btn href="{{ route('my_country_labnehs.index') }}" />
    </div>
    <div class="card w-100">
        <div class="card-body">
            @include('my_country_labnehs.partials.form', ['myCountryLabneh' => $myCountryLabneh])
        </div>
    </div>
@endsection
