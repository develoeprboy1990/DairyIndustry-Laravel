@extends('layouts.gps')
@section('title', __('GPS Tracker'))

@section('content')

    <div class="row">
        <div class="col-md-6">
            <div class="login-panel">
                <!-- Overlay div that covers the login panel -->
                <div class="overlay">
                    <div class="text-center">
                        <div class="text-white">
                            <p>Login Status: {{ $gpsTracker->login_active == 1 ? 'Active' : 'Inactive' }}</p>
                            @if ($gpsTracker->login_active == 1)
                                <p>Last Logged in: {{ $gpsTracker->updated_at }}</p>
                            @else
                                <p>You Need to login to get the GPS Tracking Data.</p>
                            @endif

                        </div>
                        <button id="loginBtn">Want to Update Settings?</button>
                    </div>
                </div>

                <!-- Login panel content -->
                <h3 class="text-center mb-4">Update Settings</h3>
                <form action="{{ route('gps_trackers.updateDetails') }}" method="POST" role="form">
                    @csrf
                    @method('PUT')

                    <div class="mb-3">
                        <label for="email" class="form-label">Email address</label>
                        <input type="email" class="form-control" name="email" id="email" placeholder="Enter email"
                            value="{{ old('email', isset($gpsTracker) ? $gpsTracker->email : '') }}" required>
                    </div>
                    <div class="mb-3">
                        <label for="password" class="form-label">Password</label>
                        <input type="password" class="form-control" name="password" id="password"
                            placeholder="Enter password"
                            value="{{ old('password', isset($gpsTracker) ? $gpsTracker->password : '') }}" required>
                    </div>

                    <div class="mb-3">
                        <label for="url" class="form-label">API Url</label>
                        <input type="text" class="form-control" id="url" name="url" placeholder="Enter API Url"
                            value="{{ old('url', isset($gpsTracker) ? $gpsTracker->url : '') }}" required>
                    </div>
                    <div class="mb-3">
                        <label for="google_map_api_key" class="form-label">Google Map API KEY</label>
                        <input type="text" class="form-control" name="google_map_api_key" id="google_map_api_key"
                            placeholder="Enter API Url"
                            value="{{ old('google_map_api_key', isset($gpsTracker) ? $gpsTracker->google_map_api_key : '') }}"
                            required>
                    </div>

                    <div class="d-grid">
                        <button type="submit" class="btn btn-primary" href="javascript:formSubmit();">Update</button>
                    </div>
                </form>
            </div>

        </div>
        <div class="col-md-6">

            <div class="bm-3">
                <label for="copyText" class="form-label">User API Hash</label>
                <div class="input-group">
                    <input type="text" class="form-control" id="dataInput"
                        value="{{ old('user_api_hash', isset($gpsTracker) ? $gpsTracker->user_api_hash : '') }}"
                        placeholder="Result will appear here" disabled>
                    <button class="btn btn-primary" type="submit" id="submitBtn">Get Code</button>
                </div>
                <small><em>Login if you you did not receive the User_api_hash</em></small>
            </div>
            <div class="mb-5">
                <form action="{{ route('gps_trackers.updateUserHash') }}" method="POST" id="user_hash" role="form">
                    @csrf
                    @method('PUT')

                    <input type="hidden" value="" name="user_api_hash" id="user_hashINP">

                </form>
            </div>

            <div class="bm-3">
                <div class="card text-center shadow rounded mx-auto" style="max-width: 400px;">
                    <div class="card-body">
                        <h5 class="card-title text-success">Login Status:
                            <strong>{{ $gpsTracker->login_active == 1 ? 'Active' : 'Inactive' }}</strong>
                        </h5>
                        <p class="card-text mb-0">Last Logged in:
                            <strong>{{ $gpsTracker->login_active == 1 ? $gpsTracker->updated_at : 'You Need to login to get the GPS Tracking Data.' }}</strong>
                        </p>
                    </div>
                </div>
            </div>
            <div class="pt-3" style="display: flex; justify-content: center;">
                <a href="{{ route('gps_trackers.vehicles') }}" class="btn btn-success mx-1">@lang('Vhicle List')</a>
                <a href="{{ route('gps_trackers.status') }}" class="btn btn-success mx-1">@lang('Vhicle Status')</a>
            </div>
        </div>
    </div>
    {{-- ----------ends top bar --}}
    <!-- Toast element -->
    <div id="toast" class="toast">Data saved successfully!</div>

@endsection
@push('script')
    <script>
        function showToast(message, duration) {
            var $toast = $("#toast");
            $toast.text(message);
            $toast.addClass("show");

            // Remove the toast after the specified duration
            setTimeout(function() {
                $toast.removeClass("show");
            }, duration);
        }


        // ===== form submission
        function formSubmit() {
            const email = '{{ $gpsTracker->email }}';
            const password = '{{ $gpsTracker->password }}';
            const url = "{{ $gpsTracker->url }}/login";


            if (email === "" || password === "") {
                alert("Email or Password is empty");
                return false;
            }

            const form = new FormData();
            form.append('email', email);
            form.append('password', password);

            // live : http://track.vt-lb.com/api/login
            // Mock Server : https://stoplight.io/mocks/viewtech/gps-tracking-software/385214494/login

            const settings = {
                async: true,
                crossDomain: true,
                url: url,
                method: 'POST',
                headers: {
                    Accept: 'application/json'
                },
                processData: false,
                contentType: false,
                mimeType: 'multipart/form-data',
                data: form
            };

            $.ajax(settings).done(function(response) {
                let _val = JSON.parse(response);
                if (_val.status == 1) {
                    // showToast("Login successfully!", 3000);
                    $("#dataInput").val(JSON.parse(response).user_api_hash);
                    $("#user_hashINP").val(JSON.parse(response).user_api_hash);
                    $("#submitBtn").text('Submit').prop("disabled", false);

                    document.getElementById('user_hash').submit();
                } else {
                    showToast("Login not successful!", 3000);
                }

                // console.log(JSON.parse(response));
            });
        }



        $(document).ready(function() {
            // When the "Want to login?" button is clicked
            $("#loginBtn").click(function() {
                // Slide up the overlay div to reveal the login panel underneath
                $(".overlay").slideUp(500);
            });

            var $btn = $("#submitBtn");
            var originalText = $btn.text();

            $btn.click(function() {
                // Set the button text to "Loading..." and disable it
                $btn.text("Loading...").prop("disabled", true);
                formSubmit();
            });



        });
    </script>
@endpush
