@extends('layouts.app')
@section('title', __('Driver') . ' - ' . $driver->name)

@section('content')
    <div class="d-flex align-items-center justify-content-center mb-3">
        <div class="h4 mb-0 flex-grow-1">@lang('Driver') - {{ $driver->name }}</div>
        <a href="{{ route('drivers.edit', $driver) }}" class="btn btn-primary">@lang('Edit')</a>
        <x-back-btn href="{{ route('drivers.index') }}" />
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
                            {{ $driver->name }}
                        </div>
                    </div>
                    
                    <div class="row mb-3">
                        <div class="col-sm-3">
                            <strong>@lang('Phone'):</strong>
                        </div>
                        <div class="col-sm-9">
                            {{ $driver->phone ?? __('Not provided') }}
                        </div>
                    </div>
                    
                    <div class="row mb-3">
                        <div class="col-sm-3">
                            <strong>@lang('License Number'):</strong>
                        </div>
                        <div class="col-sm-9">
                            {{ $driver->license_number ?? __('Not provided') }}
                        </div>
                    </div>
                    
                    <div class="row mb-3">
                        <div class="col-sm-3">
                            <strong>@lang('Status_1'):</strong>
                        </div>
                        <div class="col-sm-9">
                            <span class="badge bg-{{ $driver->status_badge }}">{{ $driver->status_text }}</span>
                        </div>
                    </div>
                    
                    @if($driver->notes)
                    <div class="row mb-3">
                        <div class="col-sm-3">
                            <strong>@lang('Notes'):</strong>
                        </div>
                        <div class="col-sm-9">
                            {{ $driver->notes }}
                        </div>
                    </div>
                    @endif
                    
                    <div class="row mb-3">
                        <div class="col-sm-3">
                            <strong>@lang('Created'):</strong>
                        </div>
                        <div class="col-sm-9">
                            {{ $driver->created_at->format('Y-m-d H:i:s') }}
                        </div>
                    </div>
                    
                    <div class="row mb-3">
                        <div class="col-sm-3">
                            <strong>@lang('Updated'):</strong>
                        </div>
                        <div class="col-sm-9">
                            {{ $driver->updated_at->format('Y-m-d H:i:s') }}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection