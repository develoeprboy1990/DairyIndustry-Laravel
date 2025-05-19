@extends('layouts.app')
@section('title', __('Feta Cheese'))

@section('content')
    <div class="d-flex align-items-center justify-content-center mb-3">
        <div class="h4 mb-0 flex-grow-1">@lang('Feta Cheese')</div>
        <a href="{{ route('feta_cheeses.create') }}" class="btn btn-primary">@lang('Create')</a>
        <a href="{{ route('feta_cheeses.print') }}" class="btn btn-success mx-2">@lang('Print')</a>
    </div>
    <div class="card w-100">
        <div class="card-body">
            <div class="mb-3">
                <form action="{{ route('feta_cheeses.index') }}" role="form">
                    <input type="search" name="search_query" value="{{ Request::get('search_query') }}"
                        class="form-control w-auto" placeholder="@lang('Search...')" autocomplete="off">
                </form>
            </div>
            <div class="table-responsive">
                <table class="table table-hover table-striped table-hover-x">
                    <thead>
                        <tr>
                            <th>@lang('Type of Milk') (*)</th>
                            <th>@lang('Quantity of Milk') (kg)</th>
                            <th>@lang('Quantity of Swedish Powder') (kg)</th>
                            <th>@lang('Quantity of ACC Ghee') (kg)</th>
                            <th>@lang('Quantity of Protein') (kg)</th>
                            <th>@lang('Quantity of Stabilizer') (kg)</th>
                            <th>@lang('Quantity of GBL') (kg)</th>
                            <th>@lang('Quantity of Cheese') (kg)</th>
                            <th>@lang('Quantity of Water') (kg)</th>
                            <th class="text-center"></th>
                        </tr>
                    </thead>
                    <tbody class="border-top-0">
                        @foreach ($fetaCheeses as $fetaCheese)
                            <tr>
                                <td class="align-middle fw-bold py-3">{{ $fetaCheese->type_of_milk }}</td>
                                <td class="align-middle fw-bold">{{ $fetaCheese->quantity_milk }}</td>
                                <td class="align-middle fw-bold">{{ $fetaCheese->quantity_swedish_powder }}</td>
                                <td class="align-middle fw-bold">{{ $fetaCheese->quantity_ACC_ghee }}</td>
                                <td class="align-middle fw-bold">{{ $fetaCheese->quantity_protein }}</td>
                                <td class="align-middle fw-bold">{{ $fetaCheese->quantity_stabilizer }}</td>
                                <td class="align-middle fw-bold">{{ $fetaCheese->quantity_GBL }}</td>
                                <td class="align-middle fw-bold">{{ $fetaCheese->quantity_cheese }}</td>
                                <td class="align-middle fw-bold">{{ $fetaCheese->quantity_water }}</td>

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
                                                    href="{{ route('feta_cheeses.edit', $fetaCheese) }}">
                                                    @lang('Edit')
                                                </a>
                                            </li>
                                            @can_edit
                                            <li>
                                                <a class="dropdown-item" href="#">
                                                    <form action="{{ route('feta_cheeses.destroy', $fetaCheese) }}"
                                                        method="POST" id="form-{{ $fetaCheese->id }}">
                                                        @csrf
                                                        @method('DELETE')
                                                        <button type="button"
                                                            class="btn btn-link p-0 m-0 w-100 text-start text-decoration-none text-danger"
                                                            onclick="submitDeleteForm('{{ $fetaCheese->id }}')">
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
                @if ($fetaCheeses->isEmpty())
                    <x-no-data />
                @endif
            </div>
            <div class="">
                {{ $fetaCheeses->withQueryString()->links() }}
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
