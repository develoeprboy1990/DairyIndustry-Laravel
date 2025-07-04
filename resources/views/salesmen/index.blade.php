@extends('layouts.app')
@section('title', __('Sales Man'))

@section('content')
    <div class="d-flex align-items-center justify-content-center mb-3">
        <div class="flex-grow-1">
            <x-page-title>@lang('Sales Man')</x-page-title>
        </div>
        <a href="{{ route('salesmen.create') }}"
            class="btn btn-primary btn-ic @if (!Auth::user()->can_create) disabled @endif">
            <x-heroicon-o-plus class="hero-icon-sm me-2 text-white" />
            @lang('Add Sales Man')
        </a>
    </div>

    <x-card>
        <x-table id="categories-table">
            <x-thead>
                <tr>
                    <x-th>@lang('Sales Man Name')</x-th>
                    <x-th>@lang('Category')</x-th>
                    <x-th>@lang('Quantity')</x-th>
                    <x-th>@lang('Stock')</x-th>
                    <x-th>@lang('Retail Price')</x-th>
                    <x-th>@lang('Return')</x-th>
                    <x-th>@lang('Instead')</x-th>
                    <x-th></x-th>
                </tr>
            </x-thead>
        </x-table>
    </x-card>
@endsection
@push('script')
    <script>
        $(document).ready(function() {
            let dataTable = $('#categories-table').DataTable({
                processing: true,
                serverSide: true,
                language: {
                    url: '{{ asset("datatables/i18n/{$settings->lang}.json") }}',
                },
                ajax: {
                    url: "{{ route('api.salesman.index') }}",
                    dataSrc: 'data'
                },
                columns: [{
                        data: "salesman_name",
                    },
                    {
                        data: 'category'
                    },
                    {
                        data: "quantity",
                    },
                    {
                        data: "stock",
                    },
                    {
                        data: "retail_price",
                    },
                    {
                        data: "return",
                    },
                    {
                        data: "instead",
                    },
                    {
                        orderable: false,
                        data: function(data, type, dataToSet) {
                            var editUrl = "{{ route('salesmen.edit', ':id') }}";
                            var deleteUrl = "{{ route('salesmen.destroy', ':id') }}";
                            editUrl = editUrl.replace(':id', data.id);
                            deleteUrl = deleteUrl.replace(':id', data.id);
                            return `<div class="dropdown d-flex">` +
                                `<button class="btn btn-link  text-black p-0" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">` +
                                `<x-heroicon-o-ellipsis-horizontal class="hero-icon" />` +
                                `</button>` +
                                `<x-dropdown-menu class="dropdown-menu-end" aria-labelledby="dropdownMenuButton1">` +
                                `<x-dropdown-item href="${editUrl}">` +
                                `<x-heroicon-o-pencil class="hero-icon-sm me-2 text-gray-400" />` +
                                `@lang('Edit')` +
                                `</x-dropdown-item>` +
                                `<x-dropdown-item href="#">` +
                                `<form action="${deleteUrl}" method="POST" id="form-${data.id}">` +
                                `@csrf` +
                                `@method('DELETE')` +
                                `<button type="button" class="btn btn-link p-0 m-0 w-100 text-start text-decoration-none text-danger align-items-center btn-sm" onclick="submitDeleteForm('${data.id}')">` +
                                `<x-heroicon-o-trash class="hero-icon-sm me-2 text-gray-400" />` +
                                `@lang('Delete')` +
                                `</button>` +
                                `</form>` +
                                `</x-dropdown-item>` +
                                `</x-dropdown-menu>` +
                                `</div>`

                        }
                    },

                ]
            });
        });


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
