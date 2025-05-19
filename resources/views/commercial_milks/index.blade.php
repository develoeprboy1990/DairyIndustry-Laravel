@extends('layouts.app')
@section('title', __('Commercial Milk'))

@section('content')
    <div class="d-flex align-items-center justify-content-center mb-3">
        <div class="h4 mb-0 flex-grow-1">@lang('Commercial Milk')</div>
        <a href="{{ route('commercial_milks.create') }}" class="btn btn-primary">@lang('Create')</a>
        <a href="{{ route('commercial_milks.print') }}" class="btn btn-success mx-2">@lang('Print')</a>
    </div>
    <div class="card w-100">
        <div class="card-body">
            <div class="mb-3">
                <form action="{{ route('commercial_milks.index') }}" role="form">
                    <input type="search" name="search_query" value="{{ Request::get('search_query') }}"
                        class="form-control w-auto" placeholder="@lang('Search...')" autocomplete="off">
                </form>
            </div>
            <div class="table-responsive">
                <table class="table table-hover table-striped table-hover-x">
                    <thead>
                        <tr>
                            <th>@lang('Type of Milk')</th>
                            <th>@lang('Quantity of Whey') (kg)</th>
                            <th>@lang('Quantity of LP Powder') (kg)</th>
                            <th>@lang('Quantity of ACC Ghee') (kg)</th>
                            <th>@lang('Quantity of Starch') (kg)</th>
                            <th>@lang('Quantity of Stabilizer') (kg)</th>
                            <th>@lang('Quantity of Sorbate') (kg)</th>
                            <th>@lang('Quantity of Protin') (kg)</th>
                            <th>@lang('Quantity of Anti Mold') (kg)</th>
                            <th>@lang('Quantity of Water') (kg)</th>
                            <th>@lang('Final Produced Quantity') (kg)</th>

                            <th class="text-center"></th>
                        </tr>
                    </thead>
                    <tbody class="border-top-0">
                        @foreach ($commercialMilks as $commercialMilk)
                            <tr>
                                <td class="align-middle fw-bold">{{ $commercialMilk->type_of_milk }}</td>
                                <td class="align-middle fw-bold">{{ $commercialMilk->quantity_of_LP_powder }}</td>
                                <td class="align-middle fw-bold">{{ $commercialMilk->quantity_of_ACC_ghee }}</td>
                                <td class="align-middle fw-bold">{{ $commercialMilk->quantity_of_starch }}</td>
                                <td class="align-middle fw-bold">{{ $commercialMilk->quantity_of_stabilizer }}</td>
                                <td class="align-middle fw-bold">{{ $commercialMilk->quantity_of_sorbate }}</td>
                                <td class="align-middle fw-bold">{{ $commercialMilk->quantity_of_protin }}</td>
                                <td class="align-middle fw-bold">{{ $commercialMilk->quantity_of_anti_mold }}</td>
                                <td class="align-middle fw-bold">{{ $commercialMilk->quantity_of_water }}</td>
                                <td class="align-middle fw-bold">{{ $commercialMilk->final_quantity }}</td>

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
                                                    href="{{ route('commercial_milks.edit', $commercialMilk) }}">
                                                    @lang('Edit')
                                                </a>
                                            </li>
                                            @can_edit
                                            <li>
                                                <a class="dropdown-item" href="#">
                                                    <form action="{{ route('commercial_milks.destroy', $commercialMilk) }}"
                                                        method="POST" id="form-{{ $commercialMilk->id }}">
                                                        @csrf
                                                        @method('DELETE')
                                                        <button type="button"
                                                            class="btn btn-link p-0 m-0 w-100 text-start text-decoration-none text-danger"
                                                            onclick="submitDeleteForm('{{ $commercialMilk->id }}')">
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
                @if ($commercialMilks->isEmpty())
                    <x-no-data />
                @endif
            </div>
            <div class="">
                {{ $commercialMilks->withQueryString()->links() }}
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
