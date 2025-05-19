@extends('layouts.app')
@section('title', __('Country Milk'))

@section('content')
    <div class="d-flex align-items-center justify-content-center mb-3">
        <div class="h4 mb-0 flex-grow-1">@lang('Country Milk')</div>
        <a href="{{ route('country_milks.create') }}" class="btn btn-primary">@lang('Create')</a>
        <a href="{{ route('country_milks.print') }}" class="btn btn-success mx-2">@lang('Print')</a>
    </div>
    <div class="card w-100">
        <div class="card-body">
            <div class="mb-3">
                <form action="{{ route('country_milks.index') }}" role="form">
                    <input type="search" name="search_query" value="{{ Request::get('search_query') }}"
                        class="form-control w-auto" placeholder="@lang('Search...')" autocomplete="off">
                </form>
            </div>
            <div class="table-responsive">
                <table class="table table-hover table-striped table-hover-x">
                    <thead>
                        <tr>
                            <th>@lang('Type of Milk') (*)</th>
                            <th>@lang('Quantity of LP Powder') (kg)</th>
                            <th>@lang('Quantity of Natural Milk') (kg)</th>
                            <th>@lang('Quantity of ACC Ghee') (kg)</th>
                            <th>@lang('Quantity of Stabilizer') (kg)</th>
                            <th>@lang('Protein') (g)</th>
                            <th>@lang('Anti-Mold') (g)</th>
                            <th>@lang('Quantity of Water') (kg)</th>
                            <th class="text-center"></th>
                        </tr>
                    </thead>
                    <tbody class="border-top-0">
                        @foreach ($countryMilks as $countryMilk)
                            <tr>
                                <td class="align-middle fw-bold py-3">{{ $countryMilk->type_of_milk }}</td>
                                <td class="align-middle fw-bold">{{ $countryMilk->qty_lp_powder }}</td>
                                <td class="align-middle fw-bold">{{ $countryMilk->qty_natural_milk }}</td>
                                <td class="align-middle fw-bold">{{ $countryMilk->qty_ACC_ghee }}</td>
                                <td class="align-middle fw-bold">{{ $countryMilk->qty_stabilizer }}</td>
                                <td class="align-middle fw-bold">{{ $countryMilk->qty_protein }}</td>
                                <td class="align-middle fw-bold">{{ $countryMilk->qty_anti_mold }}</td>
                                <td class="align-middle fw-bold">{{ $countryMilk->qty_water }}</td>

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
                                                    href="{{ route('country_milks.edit', $countryMilk) }}">
                                                    @lang('Edit')
                                                </a>
                                            </li>
                                            @can_edit
                                            <li>
                                                <a class="dropdown-item" href="#">
                                                    <form action="{{ route('country_milks.destroy', $countryMilk) }}"
                                                        method="POST" id="form-{{ $countryMilk->id }}">
                                                        @csrf
                                                        @method('DELETE')
                                                        <button type="button"
                                                            class="btn btn-link p-0 m-0 w-100 text-start text-decoration-none text-danger"
                                                            onclick="submitDeleteForm('{{ $countryMilk->id }}')">
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
                @if ($countryMilks->isEmpty())
                    <x-no-data />
                @endif
            </div>
            <div class="">
                {{ $countryMilks->withQueryString()->links() }}
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
