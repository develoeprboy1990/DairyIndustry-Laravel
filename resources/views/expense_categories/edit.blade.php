@extends('layouts.app')
@section('title', __('Edit') . ' ' . __('Expnese Category'))

@section('content')
    <div class="d-flex align-items-center justify-content-center mb-3">
        <div class="flex-grow-1">
            <x-page-title>@lang('Edit Expense Category')</x-page-title>
        </div>
        <x-back-btn href="{{ route('expense-categories.index') }}" />
    </div>
    <x-card>
        @include('expense_categories.partials.form')
    </x-card>

@endsection
