@extends('layouts.app')
@section('title', __('Plastic Buckets'))

@section('content')
    <div class="d-flex align-items-center justify-content-center mb-3">
        <div class="flex-grow-1">
            <x-page-title>@lang('Plastic Buckets')</x-page-title>
        </div>
        <x-back-btn href="{{ route('stocks.index') }}" />
    </div>

    <x-card>
        <div class=" table-responsive">
            <table id="example" class="table table-hover table-striped table-hover-x">
                <thead>
                    <tr>
                        <th>@lang('Category Name')</th>
                        <th>@lang('Stock')</th>
                    </tr>
                </thead>
                <tbody class="border-top-0">
                    @foreach ($plsticBuckets as $plsticBucket)
                        <tr>
                            <td>{{ $plsticBucket->category_name }}</td>
                            <td>{{ $plsticBucket->stock }}</td>
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
