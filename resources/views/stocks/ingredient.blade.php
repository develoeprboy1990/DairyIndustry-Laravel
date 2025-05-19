@extends('layouts.app')
@section('title', __('Ingredients'))

@section('content')
    <div class="d-flex align-items-center justify-content-center mb-3">
        <div class="flex-grow-1">
            <x-page-title>@lang('Ingredients')</x-page-title>
        </div>
        <x-back-btn href="{{ route('stocks.index') }}" />
    </div>

    <div class="card w-100">
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-hover table-striped table-hover-x">
                    <thead>
                        <tr>
                            <th>@lang('Ingredient Types') (*)</th>
                            <th>@lang('Stock')</th>
                        </tr>
                    </thead>
                    <tbody class="border-top-0">
                        <tr>
                            <td>Quantity of Milk</td>
                            <td>{{ $ingredient->quantity_of_milk }} kg</td>
                        </tr>
                        <tr>
                            <td>Quantity of Swedish Powder</td>
                            <td>{{ $ingredient->quantity_of_swedish_powder }} kg</td>
                        </tr>
                        <tr>
                            <td>Quantity of ACC Butter</td>
                            <td>{{ $ingredient->quantity_of_ACC_butter }} kg</td>
                        </tr>
                        <tr>
                            <td>Quantity of Cheese</td>
                            <td>{{ $ingredient->quantity_of_cheese }} kg</td>
                        </tr>
                        <tr>
                            <td>Quantity of Citriv Acid</td>
                            <td>{{ $ingredient->quantity_of_citriv_acid }} kg</td>
                        </tr>
                        <tr>
                            <td>Quantity of Water</td>
                            <td>{{ $ingredient->quantity_of_water }} kg</td>
                        </tr>
                        <tr>
                            <td>Quantity of Tamara Ghee</td>
                            <td>{{ $ingredient->quantity_of_tamara_ghee }} kg</td>
                        </tr>
                        <tr>
                            <td>Quantity of Starch</td>
                            <td>{{ $ingredient->quantity_of_starch }} gauges</td>
                        </tr>
                        <tr>
                            <td>Quantity of Stabilizer</td>
                            <td>{{ $ingredient->quantity_of_stabilizer }} kg</td>
                        </tr>
                        <tr>
                            <td>Quantity of TC3</td>
                            <td>{{ $ingredient->quantity_of_TC3 }} envelop</td>
                        </tr>
                        <tr>
                            <td>Quantity of 704</td>
                            <td>{{ $ingredient->quantity_of_704 }} envelop</td>
                        </tr>
                        <tr>
                            <td>Quantity of Salt</td>
                            <td>{{ $ingredient->quantity_of_salt }} kg</td>
                        </tr>
                        <tr>
                            <td>Quantity of LP Powder</td>
                            <td>{{ $ingredient->quantity_of_LP_powder }} kg</td>
                        </tr>
                        <tr>
                            <td>Quantity of ACC Ghee</td>
                            <td>{{ $ingredient->quantity_of_ACC_ghee }} kg</td>
                        </tr>
                        <tr>
                            <td>Quantity of Protin</td>
                            <td>{{ $ingredient->quantity_of_protin }} g</td>
                        </tr>
                        <tr>
                            <td>Quantity of Anti Mold</td>
                            <td>{{ $ingredient->quantity_of_anti_mold }} g</td>
                        </tr>
                        <tr>
                            <td>Quantity of Qarqam</td>
                            <td>{{ $ingredient->quantity_of_qarqam }} g</td>
                        </tr>
                        <tr>
                            <td>Quantity of Cylinder Powder</td>
                            <td>{{ $ingredient->quantity_of_cylinder_powder }} kg</td>
                        </tr>
                        <tr>
                            <td>Quantity of Calcium</td>
                            <td>{{ $ingredient->quantity_of_calcium }}g</td>
                        </tr>
                        <tr>
                            <td>Quantity of Whey</td>
                            <td>{{ $ingredient->quantity_of_whey }} kg</td>
                        </tr>
                        <tr>
                            <td>Quantity of GBL</td>
                            <td>{{ $ingredient->quantity_of_GBL }} g</td>
                        </tr>
                        <tr>
                            <td>Quantity of Sorbate</td>
                            <td>{{ $ingredient->quantity_of_sorbate }} g</td>
                        </tr>

                    </tbody>
                </table>
            </div>
        </div>
    </div>
@endsection
