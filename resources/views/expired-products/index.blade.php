@extends('layouts.app')
@section('title', __('Expired Items'))

@section('content')

    <div class="d-flex align-items-center justify-content-center mb-3">
        <div class="flex-grow-1">
            <x-page-title>@lang('Expired Items')</x-page-title>
        </div>
    </div>

    <x-card>
        <x-table id="expired-products-table">
            <x-thead>
                <tr>
                    <x-th>@lang('Item')</x-th>
                    <x-th>@lang('Description')</x-th>
                    <x-th>@lang('Expiry Date')</x-th>
                    <x-th>@lang('Category')</x-th>
                    <x-th>@lang('Status')</x-th>
                    <x-th></x-th>
                </tr>
            </x-thead>
        </x-table>

        <div class="row">
            <div class="col-12">
                <div style="text-align: right;">
                    <span class="fw-bold">TOTAL EXPIRED ITEMS: </span> {{ $total_expired_items }}
                </div>
            </div>
        </div>
    </x-card>
@endsection

@push('script')
    <script type="text/javascript">
        $(document).ready(function() {
            let dataTable = $('#expired-products-table').DataTable({
                processing: true,
                serverSide: true,
                language: {
                    url: '{{ asset("datatables/i18n/{$settings->lang}.json") }}',
                },
                ajax: {
                    url: "{{ route('api.expired-products.index') }}",
                    dataSrc: 'data'
                },
                columns: [
                    {
                        data: "name",
                        render: function(data, type, row) {
                            return '<div class=" d-flex align-items-center">' +
                              
                                `<div class="fw-bold">${ row.name}</div>` +
                                `</div>`
                        }
                    },
                    { data: 'description', orderable: false },
                    { data: 'expiry_date' },
                    { data: 'category', orderable: false },

                    {
                        data: "is_active",
                        render: function(data, type, row) {
                            if (data === 0) {
                                return `<span class="badge rounded-0 text-uppercase text-xs fw-normal bg-danger">Not Available</span>`;
                            } else if (data === 1) {
                                return `<span class="badge rounded-0 text-uppercase text-xs fw-normal bg-success">Available</span>`;
                            }
                            return ''; // In case of any unexpected value, return empty
                        }
                    },
                    {
                        orderable: false,
                        data: function(data, type, dataToSet) {
                        var trashUrl = "{{ route('expired-products.trash', ':id') }}";
                        var reproduceUrl = "{{ route('expired-products.reproduce.form', ':id') }}";
                        trashUrl = trashUrl.replace(':id', data.id);
                        reproduceUrl = reproduceUrl.replace(':id', data.id);
                    
                        return `<div class="dropdown d-flex">` +
                            `<button class="btn btn-link text-black p-0" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">` +
                            `<x-heroicon-o-ellipsis-horizontal class="hero-icon" />` +
                            `</button>` +
                            `<x-dropdown-menu class="dropdown-menu-end" aria-labelledby="dropdownMenuButton1">` +
                            `<x-dropdown-item href="${reproduceUrl}">` +
                            `<x-heroicon-o-arrow-left class="hero-icon-sm me-2 text-gray-400" />` +
                            `@lang('Reproduce')` +
                            `</x-dropdown-item>` +
                            `<x-dropdown-item>` +
                            `<form action="${trashUrl}" method="POST" id="form-${data.id}">` +
                            `@csrf` +
                            `<button type="button" class="btn btn-link p-0 m-0 w-100 text-start text-decoration-none text-danger align-items-center btn-sm" onclick="submitTrashForm('${data.id}')">` +
                            `<x-heroicon-o-trash class="hero-icon-sm me-2 text-gray-400" />` +
                            `@lang('Trash')` +
                            `</button>` +
                            `</form>` +
                            `</x-dropdown-item>` +
                            `</x-dropdown-menu>` +
                            `</div>`;
                    }

                    }
                ],
            });
        });

        function submitTrashForm(id) {
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
