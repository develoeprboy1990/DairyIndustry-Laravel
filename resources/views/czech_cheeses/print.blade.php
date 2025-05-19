@inject('carbon', 'Carbon\Carbon')
<html lang="en" dir="ltr">

<head>
    <title>Mouneh Industries</title>
    <style>
        @media print {
            body {
                width: 100%;
                margin: 0;
                position: relative;
                height: auto;
            }

            body::before {
                content: "";
                position: fixed;
                top: 0;
                left: 15%;
                width: 100vw;
                height: 100vh;
                background-image: url('/images/meet_logo.png');
                background-size: contain;
                background-repeat: repeat-y;
                opacity: 0.1;
                z-index: -1;
                pointer-events: none;
            }

            .content {
                position: relative;
                z-index: 1;
                page-break-inside: avoid;
            }
        }

        .text-red {
            color: #ff0000;
        }

        table,
        th,
        td {
            border: 1px solid black;
            border-collapse: collapse;
            text-align: center;
        }
    </style>
</head>

<body>
    <div style="margin-bottom: 0.2rem;text-align: center !important;">
        <div style="text-align: left;">
            <h2>Mouneh Industries</h2>
        </div>
        <div style="display: flex; margin-bottom: 1.5rem; width: 100%;">
            <table style="border: 1px solid; width: 100%;">
                <thead>
                    <tr>
                        <th>@lang('Seq')</th>
                        <th>@lang('Item Description')</th>
                        <th class="text-red">@lang('Sunday')</th>
                        <th>@lang('Monday')</th>
                        <th>@lang('Tuesday')</th>
                        <th>@lang('Wednesday')</th>
                        <th>@lang('Thursday')</th>
                        <th>@lang('Friday')</th>
                        <th>@lang('Saturday')</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td></td>
                        <td style="text-align: right;">Date:</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    @foreach ($czechCheeses as $czechCheese)
                        <tr>
                            <td>{{ $czechCheese->id }}</td>
                            <td>{{ $czechCheese->type_of_cheese }} - milk
                                {{ $czechCheese->quantity_of_milk }} - swedish powder
                                {{ $czechCheese->quantity_of_swedish_powder }} - tamara ghee
                                {{ $czechCheese->quantity_of_tamara_ghee }} - starch
                                {{ $czechCheese->quantity_of_starch }} - stabilizer
                                {{ $czechCheese->quantity_of_stabilizer }} - TC3
                                {{ $czechCheese->obj_TC3 }} - 704
                                {{ $czechCheese->obj_704 }} - salt
                                {{ $czechCheese->quantity_of_salt }} - cheese
                                {{ $czechCheese->quantity_of_cheese }} - water
                                {{ $czechCheese->quantity_of_water }}
                            </td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
    </div>
    <style type="text/css">
        .text-red {
            color: #ff0000;
        }

        table,
        th,
        td {
            border: 1px solid black;
            border-collapse: collapse;
            text-align: center;
        }
    </style>
</body>

</html>
<script>
    document.addEventListener("DOMContentLoaded", function() {
        window.print();
    });
</script>
