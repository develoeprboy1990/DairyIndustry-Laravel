@extends('layouts.app')
@section('title', __('Edit') . ' ' . __('White Cheese'))

@section('content')
    <div class="d-flex align-items-center justify-content-center mb-3">
        <div class="h4 mb-0 flex-grow-1">@lang('Edit') @lang('White Cheese')</div>
        <x-back-btn href="{{ route('white_cheeses.index') }}" />
    </div>
    <div class="card w-100">
        <div class="card-body">
            @include('white_cheeses.partials.form', ['whiteCheese' => $whiteCheese])
        </div>
    </div>
@endsection
