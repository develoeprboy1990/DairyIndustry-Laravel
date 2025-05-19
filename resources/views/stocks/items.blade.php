@extends('layouts.app')
@section('title', __('Items'))

@section('content')
    <div class="d-flex align-items-center justify-content-center mb-3">
        <div class="flex-grow-1">
            <x-page-title>@lang('Items')</x-page-title>
        </div>
        <x-back-btn href="{{ route('stocks.index') }}" />
    </div>

    <x-card>
        <div class=" table-responsive">
            <table id="example" class="table table-hover table-striped table-hover-x">
                <thead>
                    <tr>
                        <th>@lang('Item Name')</th>
                        <th>@lang('Category Name')</th>
                        <th>@lang('Stock')</th>
                    </tr>
                </thead>
                <tbody class="border-top-0">
                    @foreach ($products as $product)
                        <tr>
                            <td>{{ $product->name }}</td>
                            <td>{{ $product->category->name }}</td>
                            <td>{{ $product->in_stock }}</td>
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
