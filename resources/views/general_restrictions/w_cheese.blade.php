@extends('layouts.app')
@section('title', __('Warehouse'))

@section('content')
    <div class="d-flex align-items-center justify-content-center mb-3">
        <div class="h4 mb-0 flex-grow-1">@lang('Warehouse')-> {{ $category?->name }}</div>
        <a href="{{ route('generalRestrictions.wcreate', ($category ? $category->id : '')) }}" class="btn btn-primary">@lang('Create')</a>
        <x-back-btn href="{{ route('generalRestrictions.warehouse') }}" />
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
