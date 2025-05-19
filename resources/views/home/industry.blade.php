@extends('layouts.app')
@section('title', config('app.name'))

@section('content')
    <div class="row">
        <div class="col-md-4 mb-3 d-flex align-items-stretch">
            <x-card class="clickable-cell">
                <div class="text-center">
                    <img src="{{ asset('images/webp/box.webp') }}" height="100" class="mb-3" alt="box">
                    <h3>@lang('Bulgarian Cheese')</h3>
                    <a href="{{ route('mouneh-industries.index') }}" class="stretched-link"></a>
                </div>
            </x-card>
        </div>

        <div class="col-md-4 mb-3 d-flex align-items-stretch">
            <x-card class="clickable-cell">
                <div class="text-center">
                    <img src="{{ asset('images/webp/box.webp') }}" height="100" class="mb-3" alt="box">
                    <h3>@lang('Czech Cheese')</h3>
                    <a href="{{ route('czech_cheeses.index') }}" class="stretched-link"></a>
                </div>
            </x-card>
        </div>

        <div class="col-md-4 mb-3 d-flex align-items-stretch">
            <x-card class="clickable-cell">
                <div class="text-center">
                    <img src="{{ asset('images/webp/box.webp') }}" height="100" class="mb-3" alt="box">
                    <h3>@lang('Country Milk')</h3>
                    <a href="{{ route('country_milks.index') }}" class="stretched-link"></a>
                </div>
            </x-card>
        </div>
        <div class="col-md-4 mb-3 d-flex align-items-stretch">
            <x-card class="clickable-cell">
                <div class="text-center">
                    <img src="{{ asset('images/webp/box.webp') }}" height="100" class="mb-3" alt="box">
                    <h3>@lang('Commercial Milk')</h3>
                    <a href="{{ route('commercial_milks.index') }}" class="stretched-link"></a>
                </div>
            </x-card>
        </div>

        {{-- MyCountryLabneh --}}
        <div class="col-md-4 mb-3 d-flex align-items-stretch">
            <x-card class="clickable-cell">
                <div class="text-center">
                    <img src="{{ asset('images/webp/box.webp') }}" height="100" class="mb-3" alt="box">
                    <h3>@lang('My Country Labneh')</h3>
                    <a href="{{ route('my_country_labnehs.index') }}" class="stretched-link"></a>
                </div>
            </x-card>
        </div>

        {{-- MyCountryLabneh --}}
        <div class="col-md-4 mb-3 d-flex align-items-stretch">
            <x-card class="clickable-cell">
                <div class="text-center">
                    <img src="{{ asset('images/webp/box.webp') }}" height="100" class="mb-3" alt="box">
                    <h3>@lang('White Cheese')</h3>
                    <a href="{{ route('white_cheeses.index') }}" class="stretched-link"></a>
                </div>
            </x-card>
        </div>

        {{-- Double Cream --}}
        <div class="col-md-4 mb-3 d-flex align-items-stretch">
            <x-card class="clickable-cell">
                <div class="text-center">
                    <img src="{{ asset('images/webp/box.webp') }}" height="100" class="mb-3" alt="box">
                    <h3>@lang('Double Cream')</h3>
                    <a href="{{ route('double_creams.index') }}" class="stretched-link"></a>
                </div>
            </x-card>
        </div>

        {{-- Feta Cheese --}}
        <div class="col-md-4 mb-3 d-flex align-items-stretch">
            <x-card class="clickable-cell">
                <div class="text-center">
                    <img src="{{ asset('images/webp/box.webp') }}" height="100" class="mb-3" alt="box">
                    <h3>@lang('Feta Cheese')</h3>
                    <a href="{{ route('feta_cheeses.index') }}" class="stretched-link"></a>
                </div>
            </x-card>
        </div>

        {{-- ------old content below ---- --}}
        {{-- <div class="col-md-4 mb-3 d-flex align-items-stretch">
            <x-card class="clickable-cell">
                <div class="text-center">
                    <img src="{{ asset('images/webp/box.webp') }}" height="100" class="mb-3" alt="box">
                    <h3>@lang('Cheeses and Labneh')</h3>
                    <a href="{{ route('cheeses.index') }}" class="stretched-link"></a>
                </div>
            </x-card>
        </div>
        <div class="col-md-4 mb-3 d-flex align-items-stretch">
            <x-card class="clickable-cell">
                <div class="text-center">
                    <img src="{{ asset('images/webp/square.webp') }}" height="100" class="mb-3" alt="box">
                    <h3>@lang('Milk Details')</h3>
                    <a href="{{ route('milk_details.index') }}" class="stretched-link"></a>
                </div>
            </x-card>
        </div>
        <div class="col-md-4 mb-3 d-flex align-items-stretch">
            <x-card class="clickable-cell">
                <div class="text-center">
                    <img src="{{ asset('images/webp/square.webp') }}" height="100" class="mb-3" alt="box">
                    <h3>@lang('Cerak, Double Cream & Ricotta Process')</h3>
                    <a href="{{ route('dairy_industry.index') }}" class="stretched-link"></a>
                </div>
            </x-card>
        </div>
        <div class="col-md-4 mb-3 d-flex align-items-stretch">
            <x-card class="clickable-cell">
                <div class="text-center">
                    <img src="{{ asset('images/webp/square.webp') }}" height="100" class="mb-3" alt="box">
                    <h3>@lang('Cheese Process')</h3>
                    <a href="{{ route('cheese_process.index') }}" class="stretched-link"></a>
                </div>
            </x-card>
        </div>
        <div class="col-md-4 mb-3 d-flex align-items-stretch">
            <x-card class="clickable-cell">
                <div class="text-center">
                    <img src="{{ asset('images/webp/box.webp') }}" height="100" class="mb-3" alt="box">
                    <h3>@lang('Gouda a l’ancienne & regular')</h3>
                    <a href="{{ route('gouda_regular.index') }}" class="stretched-link"></a>
                </div>
            </x-card>
        </div>
        <div class="col-md-4 mb-3 d-flex align-items-stretch">
            <x-card class="clickable-cell">
                <div class="text-center">
                    <img src="{{ asset('images/webp/box.webp') }}" height="100" class="mb-3" alt="box">
                    <h3>@lang('Kishek')</h3>
                    <a href="{{ route('kishek.index') }}" class="stretched-link"></a>
                </div>
            </x-card>
        </div>
        <div class="col-md-4 mb-3 d-flex align-items-stretch">
            <x-card class="clickable-cell">
                <div class="text-center">
                    <img src="{{ asset('images/webp/square.webp') }}" height="100" class="mb-3" alt="box">
                    <h3>@lang('Laban Process')</h3>
                    <a href="{{ route('laban_process.index') }}" class="stretched-link"></a>
                </div>
            </x-card>
        </div>
        <div class="col-md-4 mb-3 d-flex align-items-stretch">
            <x-card class="clickable-cell">
                <div class="text-center">
                    <img src="{{ asset('images/webp/square.webp') }}" height="100" class="mb-3" alt="box">
                    <h3>@lang('Labneh Process')</h3>
                    <a href="{{ route('labneh_process.index') }}" class="stretched-link"></a>
                </div>
            </x-card>
        </div>
        <div class="col-md-4 mb-3 d-flex align-items-stretch">
            <x-card class="clickable-cell">
                <div class="text-center">
                    <img src="{{ asset('images/webp/box.webp') }}" height="100" class="mb-3" alt="box">
                    <h3>@lang('Margarine')</h3>
                    <a href="{{ route('margarine.index') }}" class="stretched-link"></a>
                </div>
            </x-card>
        </div>
        <div class="col-md-4 mb-3 d-flex align-items-stretch">
            <x-card class="clickable-cell">
                <div class="text-center">
                    <img src="{{ asset('images/webp/box.webp') }}" height="100" class="mb-3" alt="box">
                    <h3>@lang('Le Comte & La Comtesse')</h3>
                    <a href="{{ route('comte.index') }}" class="stretched-link"></a>
                </div>
            </x-card>
        </div>
        <div class="col-md-4 mb-3 d-flex align-items-stretch">
            <x-card class="clickable-cell">
                <div class="text-center">
                    <img src="{{ asset('images/webp/box.webp') }}" height="100" class="mb-3" alt="box">
                    <h3>@lang('Raclette')</h3>
                    <a href="{{ route('raclette.index') }}" class="stretched-link"></a>
                </div>
            </x-card>
        </div>
        <div class="col-md-4 mb-3 d-flex align-items-stretch">
            <x-card class="clickable-cell">
                <div class="text-center">
                    <img src="{{ asset('images/webp/box.webp') }}" height="100" class="mb-3" alt="box">
                    <h3>@lang('Serum based Dairy')</h3>
                    <a href="{{ route('serum.index') }}" class="stretched-link"></a>
                </div>
            </x-card>
        </div>
        <div class="col-md-4 mb-3 d-flex align-items-stretch">
            <x-card class="clickable-cell">
                <div class="text-center">
                    <img src="{{ asset('images/webp/square.webp') }}" height="100" class="mb-3" alt="box">
                    <h3>@lang('Shankleesh Process')</h3>
                    <a href="{{ route('shankleesh.index') }}" class="stretched-link"></a>
                </div>
            </x-card>
        </div>
        <div class="col-md-4 mb-3 d-flex align-items-stretch">
            <x-card class="clickable-cell">
                <div class="text-center">
                    <img src="{{ asset('images/webp/box.webp') }}" height="100" class="mb-3" alt="box">
                    <h3>@lang('Tomme')</h3>
                    <a href="{{ route('tomme.index') }}" class="stretched-link"></a>
                </div>
            </x-card>
        </div> --}}
    </div>
@endsection
