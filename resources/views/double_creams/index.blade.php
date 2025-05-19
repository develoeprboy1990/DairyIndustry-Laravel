@extends('layouts.app')
@section('title', __('Double Cream'))

@section('content')
    <div class="d-flex align-items-center justify-content-center mb-3">
        <div class="h4 mb-0 flex-grow-1">@lang('Double Cream')</div>
        <a href="{{ route('double_creams.create') }}" class="btn btn-primary">@lang('Create')</a>
        <a href="{{ route('double_creams.print') }}" class="btn btn-success mx-2">@lang('Print')</a>
    </div>
    <div class="card w-100">
        <div class="card-body">
            <div class="mb-3">
                <form action="{{ route('double_creams.index') }}" role="form">
                    <input type="search" name="search_query" value="{{ Request::get('search_query') }}"
                        class="form-control w-auto" placeholder="@lang('Search...')" autocomplete="off">
                </form>
            </div>
            <div class="table-responsive">
                <table class="table table-hover table-striped table-hover-x">
                    <thead>
                        <tr>
                            <th>@lang('Type of Cheese')</th>
                            <th>@lang('Quantity of Whey') (kg)</th>
                            <th>@lang('Quantity of Cylinder Powder') (kg)</th>
                            <th>@lang('Quantity of Calcium') (kg)</th>
                            <th class="text-center"></th>
                        </tr>
                    </thead>
                    <tbody class="border-top-0">
                        @foreach ($doubleCreams as $doubleCream)
                            <tr>
                                <td class="align-middle fw-bold">{{ $doubleCream->type_of_cheese }}</td>
                                <td class="align-middle fw-bold">{{ $doubleCream->quantity_of_cheese_whey }}</td>
                                <td class="align-middle fw-bold">{{ $doubleCream->quantity_of_cylinder_powder }}</td>
                                <td class="align-middle fw-bold">{{ $doubleCream->quantity_of_calcium }}</td>

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
                                                    href="{{ route('double_creams.edit', $doubleCream) }}">
                                                    @lang('Edit')
                                                </a>
                                            </li>
                                            @can_edit
                                            <li>
                                                <a class="dropdown-item" href="#">
                                                    <form action="{{ route('double_creams.destroy', $doubleCream) }}"
                                                        method="POST" id="form-{{ $doubleCream->id }}">
                                                        @csrf
                                                        @method('DELETE')
                                                        <button type="button"
                                                            class="btn btn-link p-0 m-0 w-100 text-start text-decoration-none text-danger"
                                                            onclick="submitDeleteForm('{{ $doubleCream->id }}')">
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
                @if ($doubleCreams->isEmpty())
                    <x-no-data />
                @endif
            </div>
            <div class="">
                {{ $doubleCreams->withQueryString()->links() }}
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
