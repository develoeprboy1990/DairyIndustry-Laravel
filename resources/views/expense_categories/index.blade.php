@extends('layouts.app')
@section('title', __('Expense Categories'))

@section('content')
    <div class="d-flex align-items-center justify-content-center mb-3">
        <div class="flex-grow-1">
            <x-page-title>@lang('Expense Categories')</x-page-title>
        </div>
        <a href="{{ route('expense-categories.create') }}"
            class="btn btn-primary btn-ic @if (!Auth::user()->can_create) disabled @endif">
            <x-heroicon-o-plus class="hero-icon-sm me-2 text-white" />
            @lang('Add Expense Category')
        </a>
    </div>

    <x-card>
        <x-table id="expense-categories-table">
            <x-thead>
                <tr>
                    <x-th>@lang('Expense Category Name')</x-th>
                    <x-th>@lang('Sort Order')</x-th>
                    <x-th>@lang('Status_1')</x-th>
                    <x-th></x-th>
                </tr>
            </x-thead>
        </x-table>
    </x-card>
@endsection

@push('script')
    <script>
        $(document).ready(function() {
            let dataTable = $('#expense-categories-table').DataTable({
                processing: true,
                serverSide: true,
                language: {
                    url: '{{ asset("datatables/i18n/{$settings->lang}.json") }}',
                },
                ajax: {
                    url: "{{ route('api.expense-categories.index') }}",
                    dataSrc: 'data'
                },
                columns: [{
                        data: "name",
                        render: function(data, type, row) {
                            return `<div class="fw-bold">${row.name}</div>`;
                        }
                    },
                    {
                        data: 'sort_order',
                        render: function(data, type, row) {
                            return `<span>${row.sort_order}</span>`;
                        }
                    },
                    {
                        data: "is_active",
                        render: function(data, type, row) {
                            return `<span class="badge rounded-0 text-uppercase text-xs fw-normal ${row.status_badge_bg_color}">${row.status}</span>`;
                        }
                    },
                    {
                        orderable: false,
                        data: function(data, type, dataToSet) {
                            var editUrl = "{{ route('expense-categories.edit', ':id') }}";
                            var deleteUrl = "{{ route('expense-categories.destroy', ':id') }}";
                            editUrl = editUrl.replace(':id', data.id);
                            deleteUrl = deleteUrl.replace(':id', data.id);
                            return `<div class="dropdown d-flex">` +
                                `<button class="btn btn-link text-black p-0" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">` +
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
                                `</div>`;
                        }
                    }
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
