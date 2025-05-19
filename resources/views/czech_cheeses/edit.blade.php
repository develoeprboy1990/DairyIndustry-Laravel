@extends('layouts.app')
@section('title', __('Edit') . ' ' . __('Czech Cheese'))

@section('content')
    <div class="d-flex align-items-center justify-content-center mb-3">
        <div class="h4 mb-0 flex-grow-1">@lang('Edit') @lang('Czech Cheese')</div>
        <x-back-btn href="{{ route('czech_cheeses.index') }}" />
    </div>
    <div class="card w-100">
        <div class="card-body">
            @include('czech_cheeses.partials.form', ['czechCheese' => $czechCheese])
        </div>
    </div>
@endsection
