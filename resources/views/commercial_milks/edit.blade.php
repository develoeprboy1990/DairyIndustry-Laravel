@extends('layouts.app')
@section('title', __('Edit') . ' ' . __('Commercial Milks'))

@section('content')
    <div class="d-flex align-items-center justify-content-center mb-3">
        <div class="h4 mb-0 flex-grow-1">@lang('Edit') @lang('Commercial Milks')</div>
        <x-back-btn href="{{ route('commercial_milks.index') }}" />
    </div>
    <div class="card w-100">
        <div class="card-body">
            @include('commercial_milks.partials.form', ['commercialMilk' => $commercialMilk])
        </div>
    </div>
@endsection
