@extends('layouts.app')
@section('title', __('Create') . ' ' . __('Car Type'))

@section('content')
    <div class="d-flex align-items-center justify-content-center mb-3">
        <div class="flex-grow-1">
            <x-page-title>@lang('New Car Type')</x-page-title>
        </div>
        <x-back-btn href="{{ route('cars.index') }}" />
    </div>
    <x-card>
        @include('cars.partials.form')
    </x-card>
@endsection
