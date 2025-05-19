@extends('layouts.app')
@section('title', __('Plastic Buckets'))

@section('content')
    <div class="d-flex align-items-center justify-content-center mb-3">
        <div class="flex-grow-1">
            <x-page-title>@lang('Plastic Bucket Categories')</x-page-title>
        </div>
        <a href="{{ route('plasticBuckets.create') }}"
            class="btn btn-primary btn-ic @if (!Auth::user()->can_create) disabled @endif">
            <x-heroicon-o-plus class="hero-icon-sm me-2 text-white" />
            @lang('Add Category')
        </a>
    </div>

    <x-card>
        <div class=" table-responsive">
            <table class="table table-hover table-striped table-hover-x">
                <thead>
                    <tr>
                        <th>@lang('Category Name')</th>
                        <th>@lang('Stock')</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody class="border-top-0">
                    @foreach ($plsticBuckets as $plsticBucket)
                        <tr>
                            <td>{{ $plsticBucket->category_name }}</td>
                            <td>{{ $plsticBucket->stock }}</td>
                            <td>
                                <div class="dropdown d-flex">
                                    <button class="btn btn-link ms-auto text-black p-0" type="button"
                                        id="dropdownMenuButton1" data-bs-toggle="dropdown" data-bs-boundary="window"
                                        aria-expanded="false">
                                        <x-heroicon-o-ellipsis-horizontal class="hero-icon" />
                                    </button>
                                    <x-dropdown-menu class="dropdown-menu-end" aria-labelledby="dropdownMenuButton1">
                                        @can_edit
                                        <x-dropdown-item href="{{ route('plasticBuckets.edit', $plsticBucket) }}">
                                            <x-heroicon-o-pencil class="hero-icon-sm me-2 text-gray-400" />
                                            @lang('Edit')
                                        </x-dropdown-item>
                                        @endcan_edit

                                        @can_delete
                                        <x-dropdown-item href="#">
                                            <a class="dropdown-item" href="#">
                                                <form action="{{ route('plasticBuckets.destroy', $plsticBucket) }}"
                                                    method="POST" id="form-{{ $plsticBucket->id }}">
                                                    @csrf
                                                    @method('DELETE')
                                                    <button type="button"
                                                        class="btn btn-link p-0 m-0 w-100 text-start text-decoration-none text-danger"
                                                        onclick="submitDeleteForm('{{ $plsticBucket->id }}')">
                                                        @lang('Delete')
                                                    </button>
                                                </form>
                                            </a>
                                        </x-dropdown-item>
                                        @endcan_delete
                                    </x-dropdown-menu>
                                </div>
                            </td>
                        </tr>
                    @endforeach

                </tbody>
            </table>
        </div>
    </x-card>
@endsection
@push('script')
    <script>
        function submitDeleteForm(id) {
            const form = document.querySelector(`#form-${id}`);
            Swal.fire(swalConfig()).then((result) => {
                if (result.isConfirmed) {
                    form.submit();
                } else {
                    topbar.hide();
                }
            });
        }
    </script>
@endpush
