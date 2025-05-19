@extends('layouts.app')
@section('title', __('Sales Man Stock'))

@section('content')
    <div class="d-flex align-items-center justify-content-center mb-3">
        <div class="flex-grow-1">
            <x-page-title>@lang('Sales Man Stock')</x-page-title>
        </div>
        <x-back-btn href="{{ route('stocks.index') }}" />
    </div>

    <x-card>
        <div class=" table-responsive">
            <table id="example" class="table table-hover table-striped table-hover-x">
                <thead>
                    <tr>
                        <th>@lang('Sales Man Name')</th>
                        <th>@lang('Category Name')</th>
                        <th>@lang('Stock')</th>
                    </tr>
                </thead>
                <tbody class="border-top-0">
                    @foreach ($salesman as $sales)
                        <tr>
                            <td>{{ $sales->salesman_name }}</td>
                            <td>{{ $sales->category }}</td>
                            <td>{{ $sales->stock }}</td>
                        </tr>
                    @endforeach

                </tbody>
            </table>
        </div>
    </x-card>
@endsection
@push('script')
    <script>
        new DataTable('#example');
    </script>
@endpush
