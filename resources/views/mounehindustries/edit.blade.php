@extends('layouts.app')
@section('title', __('Edit') . ' ' . __('Mouneh Industry'))

@section('content')
    <div class="d-flex align-items-center justify-content-center mb-3">
        <div class="h4 mb-0 flex-grow-1">@lang('Edit') @lang('Mouneh Industry')</div>
        <x-back-btn href="{{ route('mouneh-industries.index') }}" />
    </div>
    <div class="card w-100">
        <div class="card-body">
            @include('mounehindustries.partials.form', ['mounehIndustry' => $mounehIndustry])
        </div>
    </div>
@endsection
