@extends('layouts.app')
@section('title', __('Cooling Rooms'))

@section('content')
<div class="d-flex align-items-center justify-content-center mb-3">
    <div class="h4 mb-0 flex-grow-1">@lang('Cooling Rooms')-> {{ $category?->name }}</div>
    <a href="{{ route('generalRestrictions.ccreate', ($category ? $category->id : '')) }}" class="btn btn-primary">@lang('Create')</a>
    <x-back-btn href="{{ route('generalRestrictions.coolingRooms') }}" />
</div>
<div class="card w-100">
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-hover table-striped table-hover-x">
                <thead>
                    <tr>
                        <th>@lang('Item Name')</th>
                        <th>@lang('Item Price')</th>
                        <th>@lang('Item Stock')</th>
                        <th>@lang('Main Category')</th>
                        <th>@lang('Sub Category')</th>
                        <th class="text-center"></th>
                    </tr>
                </thead>
                <tbody class="border-top-0">
                    @foreach ($generalRestrictions as $generalRestriction)
                    <tr>
                        <td class="align-middle">{{ $generalRestriction->product_name }}</td>
                        <td class="align-middle">{{ $generalRestriction->gr_price }}</td>
                        <td class="align-middle">{{ $generalRestriction->gr_stock }}</td>
                        <td class="align-middle">{{ $category?->name }}</td>
                        <td class="align-middle">{{ $generalRestriction->sub_category_name }}</td>

                        <td class="align-middle">
                            <div class="dropdown d-flex">
                                <button class="btn btn-link me-auto text-black p-0" type="button"
                                    id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
                                    <x-heroicon-o-ellipsis-horizontal class="hero-icon" />
                                </button>
                                <ul class="dropdown-menu dropdown-menu-end animate slideIn shadow-sm"
                                    aria-labelledby="dropdownMenuButton1">
                                    <li>
                                        <a class="dropdown-item transfer" data-bs-toggle="modal" data-bs-target="#filterModal"
                                            data-href="{{ route('generalRestrictions.wedit', $generalRestriction) }}"
                                            data-id="{{ $generalRestriction->id }}" data-itemstock="{{ $generalRestriction->gr_stock }}">
                                            @lang('Transfer')
                                        </a>
                                    </li>

                                    <li>
                                        <a class="dropdown-item"
                                            href="{{ route('generalRestrictions.wedit', $generalRestriction) }}">
                                            @lang('Edit')
                                        </a>
                                    </li>
                                    @can_edit
                                    <li>
                                        <a class="dropdown-item" href="#">
                                            <form
                                                action="{{ route('generalRestrictions.destroy', $generalRestriction) }}"
                                                method="POST" id="form-{{ $generalRestriction->id }}">
                                                @csrf
                                                @method('DELETE')
                                                <button type="button"
                                                    class="btn btn-link p-0 m-0 w-100 text-start text-decoration-none text-danger"
                                                    onclick="submitDeleteForm('{{ $generalRestriction->id }}')">
                                                    @lang('Delete')
                                                </button>
                                            </form>
                                        </a>
                                    </li>
                                    @endcan_edit
                                </ul>
                            </div>
                        </td>
                    </tr>
                    @endforeach
                </tbody>
            </table>

        </div>

    </div>
</div>

<div class="modal" id="filterModal" tabindex="-1" aria-labelledby="filterModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="filterModalLabel">@lang('Transfer Stock')</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="{{ route('generalRestrictions.stocktransfer') }}" method="POST" role="form">

                @csrf
                <div class="modal-body">
                    <input type="hidden" name="id" id="id" value="">
                    <div class="mb-3">
                        <label for="gr_stock" class="form-label">@lang('Item Stock')</label>
                        <input type="number" class="form-control" id="gr_stock" name="gr_stock" value="">
                    </div>
                    <div class="mb-3">
                        <label for="main_category" class="form-label">@lang('Transfer To Category')</label>
                        <select class="form-select " id="main_category" name="main_category">
                            <option value="coolingRoomsBeiruit">Cooling Rooms Beiruit</option>
                        </select>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary w-100">@lang('Confirm Transfer')</button>
                </div>
            </form>
        </div>
    </div>
</div>
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
    $(document).ready(function() {
        $('#filterModal').on('show.bs.modal', function(event) {
            var button = $(event.relatedTarget); // Button that triggered the modal
            var href = button.data('href'); // Extract info from data-* attributes
            var modal = $(this);
            //modal.find('.modal-content form').attr('action', href);
            modal.find('.modal-body #id').val(button.data('id'));
            modal.find('.modal-body #gr_stock').val(button.data('itemstock'));
        });
    });
</script>
@endpush