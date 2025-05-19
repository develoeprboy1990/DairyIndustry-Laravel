@extends('layouts.print')

@section('content')
    <table class="table table-bordered table-hover mb-0">
        <tbody>
            <tr>
                <td width="50%">@lang('Name')</td>
                <td width="50%">{{ $customer->name }}</td>
            </tr>
            <tr>
                <td colspan="2">
                    <img src="https://barcode.orcascan.com/?type=code128&format=png&data={{ $customer->name }}" width="100%"
                        height="150px" />
                </td>
            </tr>
        </tbody>
    </table>
@endsection
