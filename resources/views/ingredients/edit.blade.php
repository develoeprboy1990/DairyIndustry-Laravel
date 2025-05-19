@extends('layouts.app')
@section('title', __('Edit') . ' ' . __('Feta Cheese'))

@section('content')
    <div class="d-flex align-items-center justify-content-center mb-3">
        <div class="h4 mb-0 flex-grow-1">@lang('Edit') @lang('Feta Cheese')</div>
        <x-back-btn href="{{ route('feta_cheeses.index') }}" />
    </div>
    <div class="card w-100">
        <div class="card-body">
            @include('feta_cheeses.partials.form', ['fetaCheese' => $fetaCheese])
        </div>
    </div>
@endsection
