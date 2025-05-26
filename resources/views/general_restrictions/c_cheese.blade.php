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
                                            data-id="{{ $generalRestriction->id }}" 
                                            data-itemstock="{{ $generalRestriction->gr_stock }}"
                                            data-itemname="{{ $generalRestriction->product_name }}">
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
                    
                    <!-- Item Name Display -->
                    <div class="mb-3">
                        <label for="item_name_display" class="form-label">@lang('Item Name')</label>
                        <input type="text" class="form-control" id="item_name_display" readonly>
                    </div>
                    
                    <!-- Transfer Stock -->
                    <div class="mb-3">
                        <label for="gr_stock" class="form-label">@lang('Transfer Quantity')</label>
                        <input type="number" class="form-control" id="gr_stock" name="gr_stock" min="1" required>
                        <div class="form-text">@lang('Available Stock'): <span id="available_stock"></span></div>
                    </div>
                    
                    <!-- Driver Selection -->
                    <div class="mb-3">
                        <label for="driver_id" class="form-label">@lang('Select Driver')</label>
                        <select class="form-select" id="driver_id" name="driver_id">
                            <option value="">@lang('Select Driver (Optional)')</option>
                            @isset($drivers)
                                @foreach($drivers as $driver)
                                    <option value="{{ $driver->id }}">{{ $driver->name }} 
                                        @if($driver->phone) - {{ $driver->phone }} @endif
                                    </option>
                                @endforeach
                            @endisset
                        </select>
                    </div>
                    
                    <!-- Car Type Selection -->
                    <div class="mb-3">
                        <label for="car_type_id" class="form-label">@lang('Select Vehicle')</label>
                        <select class="form-select" id="car_type_id" name="car_type_id">
                            <option value="">@lang('Select Vehicle (Optional)')</option>
                            @isset($carTypes)
                                @foreach($carTypes as $carType)
                                    <option value="{{ $carType->id }}">{{ $carType->full_name }}</option>
                                @endforeach
                            @endisset
                        </select>
                    </div>
                    
                    <!-- Transfer Destination -->
                    <div class="mb-3">
                        <label for="main_category" class="form-label">@lang('Transfer To')</label>
                        <select class="form-select" id="main_category" name="main_category" required>
                            <option value="coolingRoomsBeiruit">@lang('Cooling Rooms Beirut')</option>
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
            var modal = $(this);
            
            // Set the form values
            modal.find('.modal-body #id').val(button.data('id'));
            modal.find('.modal-body #gr_stock').attr('max', button.data('itemstock'));
            modal.find('.modal-body #available_stock').text(button.data('itemstock'));
            modal.find('.modal-body #item_name_display').val(button.data('itemname'));
            
            // Reset dropdowns
            modal.find('.modal-body #driver_id').val('');
            modal.find('.modal-body #car_type_id').val('');
            modal.find('.modal-body #gr_stock').val('');
        });
        
        // Validate stock input
        $('#gr_stock').on('input', function() {
            var maxStock = parseInt($(this).attr('max'));
            var currentValue = parseInt($(this).val());
            
            if (currentValue > maxStock) {
                $(this).val(maxStock);
            }
        });
    });
</script>
@endpush