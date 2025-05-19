@extends('layouts.app')
@section('title', __('Create') . ' ' . __('Bulgarian Cheese'))

@section('content')
    <div class="d-flex align-items-center justify-content-center mb-3">
        <div class="h4 mb-0 flex-grow-1">@lang('Create') @lang('Bulgarian Cheese')</div>
        <x-back-btn href="{{ route('mouneh-industries.index') }}" />
    </div>
    <div class="card w-100">
        <div class="card-body">
            @include('mounehindustries.partials.form')
        </div>
    </div>
@endsection
