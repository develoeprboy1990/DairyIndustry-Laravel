@extends('layouts.app')
@section('title', __('Cars'))

@section('content')
    <div class="d-flex align-items-center justify-content-center mb-3">
        <div class="flex-grow-1">
            <x-page-title>@lang('Cars')</x-page-title>
        </div>
        <a href="{{ route('cars.create') }}" class="btn btn-primary btn-ic @if (!Auth::user()->can_create) disabled @endif">
            <x-heroicon-o-plus class="hero-icon-sm me-2 text-white" />
            @lang('Add Car')
        </a>
    </div>

    <x-card>
        <div class="table-responsive">
            <table class="table table-hover table-striped table-hover-x">
                <thead>
                    <tr>
                        <th>@lang('Date')</th>
                        <th>@lang('Car Type')</th>
                        <th>@lang('Car Name')</th>
                        <th>@lang('Driver Name')</th>
                        <th>@lang('Driver Phone')</th>
                        <th class="text-center"></th>
                    </tr>
                </thead>
                <tbody class="border-top-0">
                    @foreach ($cars as $car)
                        <tr>
                            <td class="align-middle fw-bold py-3">{{ $car->stock_date }}</td>
                            <td class="align-middle fw-bold py-3">{{ $car->car_type }}</td>
                            <td class="align-middle fw-bold">{{ $car->car_name }}</td>
                            <td class="align-middle fw-bold">{{ $car->car_driver_name }}</td>
                            <td class="align-middle fw-bold">{{ $car->car_driver_phone }}</td>
                            <td class="align-middle">
                                <div class="dropdown d-flex">
                                    <button class="btn btn-link me-auto text-black p-0" type="button"
                                        id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
                                        <x-heroicon-o-ellipsis-horizontal class="hero-icon" />
                                    </button>
                                    <ul class="dropdown-menu dropdown-menu-end animate slideIn shadow-sm"
                                        aria-labelledby="dropdownMenuButton1">
                                        <li>
                                            <a class="dropdown-item" href="{{ route('cars.edit', $car->id) }}">
                                                @lang('Edit')
                                            </a>
                                        </li>
                                        <li>
                                            <a class="dropdown-item" href="{{ route('cars.show', $car->id) }}">
                                                @lang('View')
                                            </a>
                                        </li>
                                        @can_edit
                                        <li>
                                            <a class="dropdown-item" href="#">
                                                <form action="{{ route('cars.destroy', $car->id) }}" method="POST"
                                                    id="form-{{ $car->id }}">
                                                    @csrf
                                                    @method('DELETE')
                                                    <button type="button"
                                                        class="btn btn-link p-0 m-0 w-100 text-start text-decoration-none text-danger"
                                                        onclick="submitDeleteForm('{{ $car->id }}')">
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
            @if ($cars->isEmpty())
                <x-no-data />
            @endif
        </div>
    </x-card>
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
