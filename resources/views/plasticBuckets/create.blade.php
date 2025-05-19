@extends('layouts.app')
@section('title', __('Create') . ' ' . __('Plastic Bucket Category'))

@section('content')
    <div class="d-flex align-items-center justify-content-center mb-3">
        <div class="flex-grow-1">
            <x-page-title>@lang('New Plastic Bucket Category')</x-page-title>
        </div>
        <x-back-btn href="{{ route('plasticBuckets.index') }}" />
    </div>
    <x-card>
        @include('plasticBuckets.partials.form')
    </x-card>
@endsection
