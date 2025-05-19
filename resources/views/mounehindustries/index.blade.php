@extends('layouts.app')
@section('title', __('Bulgarian Cheese'))

@section('content')
    <div class="d-flex align-items-center justify-content-center mb-3">
        <div class="h4 mb-0 flex-grow-1">@lang('Bulgarian Cheese')</div>
        <a href="{{ route('mouneh-industries.create') }}" class="btn btn-primary">@lang('Create')</a>
        <a href="{{ route('mouneh-industries.print') }}" class="btn btn-success mx-2">@lang('Print')</a>
    </div>
    <div class="card w-100">
        <div class="card-body">
            <div class="mb-3">
                <form action="{{ route('mouneh-industries.index') }}" role="form">
                    <input type="search" name="search_query" value="{{ Request::get('search_query') }}"
                        class="form-control w-auto" placeholder="@lang('Search...')" autocomplete="off">
                </form>
            </div>
            <div class="table-responsive">
                <table class="table table-hover table-striped table-hover-x">
                    <thead>
                        <tr>
                            <th>@lang('Type of Cheese')</th>
                            <th>@lang('Quantity of Milk') (kg)</th>
                            <th>@lang('Quantity of Swedish Powder') (kg)</th>
                            <th>@lang('Quantity of ACC Butter') (kg)</th>
                            <th>@lang('Quantity of Cheese') (gauges)</th>
                            <th>@lang('Quantity of Water') (kg)</th>
                            <th>@lang('Quantity of Citric Acid') (g)</th>
                            <th>@lang('Final Produced Quantity') (kg)</th>
                            <th class="text-center"></th>
                        </tr>
                    </thead>
                    <tbody class="border-top-0">
                        @foreach ($mounehIndustries as $mounehIndustry)
                            <tr>
                                <td class="align-middle fw-bold py-3">{{ $mounehIndustry->type_of_mouneh }}</td>
                                <td class="align-middle fw-bold">{{ $mounehIndustry->quantity_of_fruit_vegetable }}</td>
                                <td class="align-middle fw-bold">{{ $mounehIndustry->quantity_of_sugar_salt }}</td>
                                <td class="align-middle fw-bold">{{ $mounehIndustry->quantity_of_acid }}</td>
                                <td class="align-middle fw-bold">{{ $mounehIndustry->cheese_qty }}</td>
                                <td class="align-middle fw-bold">{{ $mounehIndustry->water_qty }}</td>
                                <td class="align-middle fw-bold">{{ $mounehIndustry->citricAcid_qty }}</td>
                                <td class="align-middle fw-bold">{{ $mounehIndustry->final_quantity }}</td>

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
                                                    href="{{ route('mouneh-industries.edit', $mounehIndustry) }}">
                                                    @lang('Edit')
                                                </a>
                                            </li>
                                            @can_edit
                                            <li>
                                                <a class="dropdown-item" href="#">
                                                    <form
                                                        action="{{ route('mouneh-industries.destroy', $mounehIndustry) }}"
                                                        method="POST" id="form-{{ $mounehIndustry->id }}">
                                                        @csrf
                                                        @method('DELETE')
                                                        <button type="button"
                                                            class="btn btn-link p-0 m-0 w-100 text-start text-decoration-none text-danger"
                                                            onclick="submitDeleteForm('{{ $mounehIndustry->id }}')">
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
                @if ($mounehIndustries->isEmpty())
                    <x-no-data />
                @endif
            </div>
            <div class="">
                {{ $mounehIndustries->withQueryString()->links() }}
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
