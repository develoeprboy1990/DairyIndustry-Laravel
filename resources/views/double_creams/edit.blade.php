@extends('layouts.app')
@section('title', __('Edit') . ' ' . __('Double Cream'))

@section('content')
    <div class="d-flex align-items-center justify-content-center mb-3">
        <div class="h4 mb-0 flex-grow-1">@lang('Edit') @lang('Double Cream')</div>
        <x-back-btn href="{{ route('double_creams.index') }}" />
    </div>
    <div class="card w-100">
        <div class="card-body">
            @include('double_creams.partials.form', ['doubleCream' => $doubleCream])
        </div>
    </div>
@endsection
