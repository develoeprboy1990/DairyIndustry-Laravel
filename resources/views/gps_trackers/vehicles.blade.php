@extends('layouts.gps')
@section('title', __('GPS Tracker'))

@section('content')
    <div class="card w-100">
        <div class="card-body">
            <div class="mb-3">
                <h3>Vehicle List</h3>
            </div>
            <div class="table-responsive">
                <table class="table table-hover table-striped table-hover-x" id="dataTable-gps">
                    <thead>
                        <tr>
                            <th>@lang('Id') </th>
                            <th>@lang('Vehicle Name') </th>
                            <th>@lang('Online') </th>
                            <th>@lang('Driver Name') </th>
                            <th>@lang('Lat') </th>
                            <th>@lang('Lng') </th>
                        </tr>
                    </thead>
                    <tbody class="border-top-0">

                    </tbody>
                </table>
            </div>
        </div>
    </div>
    {{-- ----------ends top bar --}}


@endsection
@push('script')
    <script>
        const settings = {
            async: true,
            crossDomain: true,
            url: '{{ $gpsTracker->url }}/get_devices?user_api_hash={{ $gpsTracker->user_api_hash }}&lang=en',
            method: 'GET',
            headers: {
                Accept: 'application/json'
            }
        };
        let template = ``;

        $.ajax(settings).done(function(response) {
            console.log(response[0].items);

            const rows = response[0].items.map(track => {
                return `
                <tr>
                <td>${track.id}</td>
                <td>${track.name}</td>
                <td>${track.online}</td>
                <td>${track.driver}</td>
                <td>${track.lat}</td>
                <td>${track.lng}</td>
                </tr>
            `;
            });

            document.querySelector('#dataTable-gps tbody').innerHTML = rows;

        });
    </script>
@endpush
