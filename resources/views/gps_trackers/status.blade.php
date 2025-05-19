@extends('layouts.gps')
@section('title', __('GPS Tracker'))

@section('content')
    <div class="card w-100">
        <div class="card-body">
            <div class="mb-3">
                <h3>Vehicle Status On Map</h3>
            </div>
            <style>
                #map {
                    height: 400px;
                }
            </style>

            <div id="map"></div>

        </div>
    </div>
    {{-- ----------ends top bar --}}


@endsection
@push('script')
    <script>
        // Global variable to store coordinates from the AJAX call
        let ajaxCoordinates = null;

        // Function to initialize the Google Map
        function initMap(coordinates) {
            const map = new google.maps.Map(document.getElementById("map"), {
                zoom: 12,
                center: coordinates
            });

            // Optionally, add a marker at the coordinates
            new google.maps.Marker({
                position: coordinates,
                map: map,
                title: "My Location"
            });
        }

        // This callback is triggered when the Google Maps API is loaded
        function initMapFromAjax() {
            if (ajaxCoordinates) {
                initMap(ajaxCoordinates);
            } else {
                console.error("Coordinates not available.");
            }
        }

        // Function to dynamically load the Google Maps script
        function loadGoogleMapsScript() {
            const script = document.createElement("script");
            // Replace YOUR_API_KEY with your actual API key.
            script.src =
                "https://maps.googleapis.com/maps/api/js?key={{ $gpsTracker->google_map_api_key }}&callback=initMapFromAjax";
            script.async = true;
            script.defer = true;
            document.head.appendChild(script);
        }

        const settings = {
            async: true,
            crossDomain: true,
            url: '{{ $gpsTracker->url }}/get_devices_latest?user_api_hash={{ $gpsTracker->user_api_hash }}&lang=en',
            method: 'GET',
            headers: {
                Accept: 'application/json'
            }
        };

        $.ajax(settings).done(function(response) {
            console.log(response.items);
            let position = response.items.map((car) => {

                ajaxCoordinates = {
                    lat: parseFloat(car.lat),
                    lng: parseFloat(car.lng)
                };
            });
            loadGoogleMapsScript();

        });
    </script>
@endpush
