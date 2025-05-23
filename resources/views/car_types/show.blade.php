@extends('layouts.app')
@section('title', __('Car Type') . ' - ' . $carType->name)

@section('content')
    <div class="d-flex align-items-center justify-content-center mb-3">
        <div class="h4 mb-0 flex-grow-1">@lang('Car Type') - {{ $carType->name }}</div>
        <a href="{{ route('car-types.edit', $carType) }}" class="btn btn-primary">@lang('Edit')</a>
        <x-back-btn href="{{ route('car-types.index') }}" />
    </div>
    
    <div class="row">
        <div class="col-md-8">
            <div class="card">
                <div class="card-body">
                    <div class="row mb-3">
                        <div class="col-sm-3">
                            <strong>@lang('Name'):</strong>
                        </div>
                        <div class="col-sm-9">
                            {{ $carType->name }}
                        </div>
                    </div>
                    
                    <div class="row mb-3">
                        <div class="col-sm-3">
                            <strong>@lang('Plate Number'):</strong>
                        </div>
                        <div class="col-sm-9">
                            <strong>{{ $carType->plate_number }}</strong>
                        </div>
                    </div>
                    
                    <div class="row mb-3">
                        <div class="col-sm-3">
                            <strong>@lang('Model'):</strong>
                        </div>
                        <div class="col-sm-9">
                            {{ $carType->model ?? __('Not provided') }}
                        </div>
                    </div>
                    
                    <div class="row mb-3">
                        <div class="col-sm-3">
                            <strong>@lang('Status_1'):</strong>
                        </div>
                        <div class="col-sm-9">
                            <span class="badge bg-{{ $carType->status_badge }}">{{ $carType->status_text }}</span>
                        </div>
                    </div>
                    
                    @if($carType->description)
                    <div class="row mb-3">
                        <div class="col-sm-3">
                            <strong>@lang('Description'):</strong>
                        </div>
                        <div class="col-sm-9">
                            {{ $carType->description }}
                        </div>
                    </div>
                    @endif
                    
                    <div class="row mb-3">
                        <div class="col-sm-3">
                            <strong>@lang('Created'):</strong>
                        </div>
                        <div class="col-sm-9">
                            {{ $carType->created_at->format('Y-m-d H:i:s') }}
                        </div>
                    </div>
                    
                    <div class="row mb-3">
                        <div class="col-sm-3">
                            <strong>@lang('Updated'):</strong>
                        </div>
                        <div class="col-sm-9">
                            {{ $carType->updated_at->format('Y-m-d H:i:s') }}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection