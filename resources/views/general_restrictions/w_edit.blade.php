@extends('layouts.app')
@section('title', __('Edit') . ' ' . __('Wherehouse'))

@section('content')
    <div class="d-flex align-items-center justify-content-center mb-3">
        <div class="h4 mb-0 flex-grow-1">@lang('Edit') @lang('Wherehouse')-> {{ $category?->name }}</div>
        <x-back-btn href="{{ route('generalRestrictions.whereHouseCheese', ($category ? $category->id : '')) }}" />
    </div>
    <div class="card w-100">
        <div class="card-body">
            @include('general_restrictions.partials.form')
        </div>
    </div>
@endsection
