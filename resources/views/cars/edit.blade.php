@extends('layouts.app')
@section('title', __('Edit') . ' ' . __('Car'))

@section('content')
    <div class="d-flex align-items-center justify-content-center mb-3">
        <div class="flex-grow-1">
            <x-page-title>@lang('Edit Car')</x-page-title>
        </div>
        <x-back-btn href="{{ route('cars.index') }}" />
    </div>
    <x-card>
        @include('cars.partials.edit_form')
    </x-card>

@endsection
