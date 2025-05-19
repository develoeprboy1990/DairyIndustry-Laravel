<!DOCTYPE html>
<html lang="{{ $settings->lang }}" dir="{{ $settings->dir }}">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="theme-color" content="#000000" />
    <title>@yield('title', config('app.name'))</title>
    <link rel="preload" href="{{ $cssUrl }}" as="style" />
    <link rel="stylesheet" href="{{ $cssUrl }}">
    <link rel="icon" type="image/x-icon" href="{{ asset('meet_logo.ico') }}">
    <link rel="manifest" href="/manifest.json">
    <style>
        /* Style for the login panel container */
        .login-panel {
            position: relative;
            padding: 30px;
            border: 1px solid #ccc;
            border-radius: 8px;
            background: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        /* Overlay style */
        .overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.7);
            /* 70% opacity */
            display: flex;
            justify-content: center;
            align-items: center;
            z-index: 2;
        }

        /* Style for the overlay button */
        .overlay button {
            font-size: 1.2rem;
            padding: 10px 20px;
            background-color: #007bff;
            border: none;
            border-radius: 4px;
            color: #fff;
            cursor: pointer;
        }

        /* Toast container styling */
        .toast {
            visibility: hidden;
            /* Hidden by default. Visible when shown */
            min-width: 250px;
            margin-left: -125px;
            background-color: rgb(14, 148, 95);
            color: #fff;
            text-align: center;
            border-radius: 4px;
            padding: 16px;
            position: fixed;
            z-index: 9999;
            left: 50%;
            bottom: 30px;
            /* Position at bottom of screen */
            font-size: 16px;
            opacity: 0;
            transition: opacity 0.5s ease-in-out, visibility 0.5s ease-in-out;
        }

        /* Class to show the toast */
        .toast.show {
            visibility: visible;
            opacity: 1;
        }
    </style>
    @include('layouts.lang-tag')
    @stack('style')
    @stack('head')
</head>

<body class="x-body">
    <div class="h-100" id="app">
        @auth
            <div class="x-sidebar border-end bg-white">
                @include('layouts.sidebar-items')
            </div>
            <div class="x-container">
                @include('layouts.navbar')
                <div class="x-container-secondary p-3">
                    @include('layouts.alerts')
                    @yield('content')
                </div>
            </div>
        @else
            @yield('content')
        @endauth
    </div>
</body>

</html>
<script src="{{ mix('js/app.js') }}"></script>
<script src="{{ mix('js/vfs_fonts.js') }}"></script>
@stack('script')
