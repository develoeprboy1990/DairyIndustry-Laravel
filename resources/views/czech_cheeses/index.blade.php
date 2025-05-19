@extends('layouts.app')
@section('title', __('Czech Cheese'))

@section('content')
    <div class="d-flex align-items-center justify-content-center mb-3">
        <div class="h4 mb-0 flex-grow-1">@lang('Czech Cheese')</div>
        <a href="{{ route('czech_cheeses.create') }}" class="btn btn-primary">@lang('Create')</a>
        <a href="{{ route('czech_cheeses.print') }}" class="btn btn-success mx-2">@lang('Print')</a>
    </div>
    <div class="card w-100">
        <div class="card-body">
            <div class="mb-3">
                <form action="{{ route('czech_cheeses.index') }}" role="form">
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
                            <th>@lang('Quantity of Tamara Ghee') (kg)</th>
                            <th>@lang('Quantity of Starch') (kg)</th>
                            <th>@lang('Quantity of Stabilizer') (kg)</th>
                            <th>@lang('TC3')</th>
                            <th>@lang('704')</th>
                            <th>@lang('Quantity of Salt') (kg)</th>
                            <th>@lang('Quantity of Cheese') (kg)</th>
                            <th>@lang('Quantity of Water') (kg)</th>
                            <th class="text-center"></th>
                        </tr>
                    </thead>
                    <tbody class="border-top-0">
                        @foreach ($czechCheeses as $czechCheese)
                            <tr>
                                <td class="align-middle fw-bold py-3">{{ $czechCheese->type_of_cheese }}</td>
                                <td class="align-middle fw-bold">{{ $czechCheese->quantity_of_milk }}</td>
                                <td class="align-middle fw-bold">{{ $czechCheese->quantity_of_swedish_powder }}</td>
                                <td class="align-middle fw-bold">{{ $czechCheese->quantity_of_tamara_ghee }}</td>
                                <td class="align-middle fw-bold">{{ $czechCheese->quantity_of_starch }}</td>
                                <td class="align-middle fw-bold">{{ $czechCheese->quantity_of_stabilizer }}</td>
                                <td class="align-middle fw-bold">{{ $czechCheese->obj_TC3 }}</td>
                                <td class="align-middle fw-bold">{{ $czechCheese->obj_704 }}</td>
                                <td class="align-middle fw-bold">{{ $czechCheese->quantity_of_salt }}</td>
                                <td class="align-middle fw-bold">{{ $czechCheese->quantity_of_cheese }}</td>
                                <td class="align-middle fw-bold">{{ $czechCheese->quantity_of_water }}</td>

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
                                                    href="{{ route('czech_cheeses.edit', $czechCheese) }}">
                                                    @lang('Edit')
                                                </a>
                                            </li>
                                            @can_edit
                                            <li>
                                                <a class="dropdown-item" href="#">
                                                    <form action="{{ route('czech_cheeses.destroy', $czechCheese) }}"
                                                        method="POST" id="form-{{ $czechCheese->id }}">
                                                        @csrf
                                                        @method('DELETE')
                                                        <button type="button"
                                                            class="btn btn-link p-0 m-0 w-100 text-start text-decoration-none text-danger"
                                                            onclick="submitDeleteForm('{{ $czechCheese->id }}')">
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
                @if ($czechCheeses->isEmpty())
                    <x-no-data />
                @endif
            </div>
            <div class="">
                {{ $czechCheeses->withQueryString()->links() }}
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
