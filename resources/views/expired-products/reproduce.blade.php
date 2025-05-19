@extends('layouts.app')
@section('title', __('Reproduce') . ' ' . __('Item'))

@section('content')
    <div class="d-flex align-items-center justify-content-center mb-3">
        <div class="flex-grow-1">
            <x-page-title>@lang('Reproduce Item')</x-page-title>
        </div>
        <x-back-btn href="{{ route('expired-products.index') }}" />
    </div>
    @include('expired-products.partials.form')
@endsection
