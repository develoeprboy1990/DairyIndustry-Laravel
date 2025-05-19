<?php

namespace App\Http\Controllers;

use App\Models\GoudaRegular1;
use App\Models\GoudaRegular2;
use Illuminate\Contracts\View\View;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;


// add this part:start
use App\Models\MounehIndustry;
use App\Models\Category;
use App\Models\Settings;
use App\Models\Product;
use App\Http\Requests\StoreMounehIndustryRequest;
use App\Http\Requests\UpdateMounehIndustryRequest;
use App\Traits\Availability;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\RedirectResponse;
use Illuminate\Support\Facades\Redirect;
use App\Http\Resources\ProductSelectResourceCollection;

class GoudaRegularController extends Controller
{

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\View\View
     */
    public function index(Request $request, ?string $year = 'now', ?string $week = 'now'): View
    {
        if ($week == 'now') {
            $week = Carbon::now()->weekOfYear; 
            $year = Carbon::now()->format('y');
        }
        
        return view('gouda_regular.index', [
            'week' => $week,
            'year' => $year,
            'regular' => $this->geGoudaRegular($year, $week)
        ]);
    }

    public function edit(GoudaRegular1 $regular, string $day = '1'): View
    {
        // add this part: start
        // Fetch the associated product, if it exists
        $product = $regular->product_id ? Product::find($regular->product_id) : null;
        
        // $product = $regular->product_id && $regular->dairy_serial == $day ? Product::find($regular->product_id) : null;

        
        // Determine if 'Next Phase' should be checked
        // $isNextPhaseChecked = $product ? true : false;
        // $hasExistingProduct = $product ? true : false;
        $isNextPhaseChecked = false;
        $hasExistingProduct = false;
        $mounehCategory = Category::where('is_active', 1)->get();
        
        
        return view("gouda_regular.edit", [
            'regular' => $regular,
            'day' => $day,
            
              //  add this part: start
            'mounehCategory' => $mounehCategory,
            'isNextPhaseChecked' => $isNextPhaseChecked,
            'hasExistingProduct' => $hasExistingProduct,
            'product' => $product
        ]);
    }

    public function update(Request $request, GoudaRegular1 $regular)
    {
        $request->validate([
            'day' => ['required', 'string', 'max:2'],
            'qty' => ['nullable', 'string', 'min:0'],
            'time_on' => ['nullable', 'string', 'min:0'],
            'time_off' => ['nullable', 'string', 'min:0']
        ]);

        $regular['qty_'.$request->day] = $request['qty'];
        $regular['time_on_'.$request->day] = $request['time_on'];
        $regular['time_off_'.$request->day] = $request['time_off'];
        $regular['cooled_down_'.$request->day] = $request['cooled_down'];
        $regular['ferment_added_'.$request->day] = $request['ferment_added'];
        $regular['ferment_added_qty_'.$request->day] = $request['ferment_added_qty'];
        $regular['pressured_'.$request->day] = $request['pressured'];
        $regular['temperature_'.$request->day] = $request['temperature'];
        $regular['fire_cut_'.$request->day] = $request['fire_cut'];
        $regular['water_temperature_'.$request->day] = $request['water_temperature'];
        $regular['serum_removed_'.$request->day] = $request['serum_removed'];
        
        // add this part: start 95 line to 236
        if ($regular->product_id) {
            // Product exists, update it
            
            $validatedProductData = $request->validate([
                'name' => ['required', 'string', 'max:100'],
                'wholesale_price' => ['nullable', 'numeric', 'min:0'],
                'box_price' => ['nullable', 'numeric', 'min:0'],
                'unit_price' => ['nullable', 'numeric', 'min:0'],
                'cost' => ['nullable', 'numeric', 'min:0'],
                'sort_order' => ['nullable', 'numeric', 'min:0'],
                'image' => ['nullable', 'mimes:jpeg,jpg,png', 'max:2024'],
                'description' => ['nullable', 'string', 'max:2000'],
                'box_barcode' => ['nullable', 'string', 'max:43'],
                'unit_barcode' => ['nullable', 'string', 'max:43'],
                'superdealer_barcode' => ['nullable', 'string', 'max:43'],
                'wholesale_barcode' => ['nullable', 'string', 'max:43'],
                'box_sku' => ['nullable', 'string', 'max:64'],
                'unit_sku' => ['nullable', 'string', 'max:64'],
                'superdealer_sku' => ['nullable', 'string', 'max:64'],
                'wholesale_sku' => ['nullable', 'string', 'max:64'],
                'status' => ['required', 'string'],
                'in_stock' => ['nullable', 'numeric'],
                'category' => ['required', 'string'],
                'length' => ['nullable', 'numeric', 'min:0'],
                'width' => ['nullable', 'numeric', 'min:0'],
                'color' => ['nullable', 'string', 'max:200'],
                'type' => ['nullable', 'string', 'max:200'],
                'count_per_box' => ['required', 'numeric', 'min:1'],
                'expiry_date' => ['required', 'date'],
                'cost_unit' => ['nullable', 'string'],
                'bos_unit' => ['nullable', 'string'],
                'weight' => ['nullable', 'string'],
            ]);
            
            
            $product = Product::find($regular->product_id);
            $product->update([
                'name' => $request->name,
                'sort_order' => $request->sort_order ?? 1,
                'is_active' => ($request->status === 'available') ? 1 : 0,
                'wholesale_price' => $request->wholesale_price ?? 0,
                'box_price' => $request->box_price ?? 0,
                'unit_price' => $request->unit_price ?? 0,
                'cost' => $request->cost ?? 0,
                'description' => $request->description,
                'box_barcode' => $request->box_barcode,
                'unit_barcode' => $request->unit_barcode,
                'superdealer_barcode' => $request->superdealer_barcode,
                'wholesale_barcode' => $request->wholesale_barcode,
                'box_sku' => $request->box_sku,
                'unit_sku' => $request->unit_sku,
                'superdealer_sku' => $request->superdealer_sku,
                'wholesale_sku' => $request->wholesale_sku,
                'category_id' => $request->category,
                'in_stock' => $request->in_stock ?? 0,
                'track_stock' => $request->has('track_stock'),
                'continue_selling_when_out_of_stock' => $request->has('continue_selling_when_out_of_stock'),
                'width' =>  $request->width ?? 0,
                'length' => $request->length ?? 0,
                'color' => $request->color,
                'type' => $request->type,
                'count_per_box' => $request->count_per_box ?? 10,
                'expiry_date' => $request->expiry_date ?? '',
                'cost_unit' => $request->cost_unit ?? '',
                'box_unit' => $request->box_unit ?? '',
                'weight' => $request->weight
            ]);
            
            if ($request->hasFile('image')) {
                $product->updateImage($request->file('image'));
            }

            
        } elseif ($request->next_phase) {
            // No product exists, create a new one
            $validatedProductData = $request->validate([
                'name' => ['required', 'string', 'max:100'],
                'wholesale_price' => ['nullable', 'numeric', 'min:0'],
                'box_price' => ['nullable', 'numeric', 'min:0'],
                'unit_price' => ['nullable', 'numeric', 'min:0'],
                'cost' => ['nullable', 'numeric', 'min:0'],
                'sort_order' => ['nullable', 'numeric', 'min:0'],
                'image' => ['nullable', 'mimes:jpeg,jpg,png', 'max:2024'],
                'description' => ['nullable', 'string', 'max:2000'],
                'box_barcode' => ['nullable', 'string', 'max:43'],
                'unit_barcode' => ['nullable', 'string', 'max:43'],
                'superdealer_barcode' => ['nullable', 'string', 'max:43'],
                'wholesale_barcode' => ['nullable', 'string', 'max:43'],
                'box_sku' => ['nullable', 'string', 'max:64'],
                'unit_sku' => ['nullable', 'string', 'max:64'],
                'superdealer_sku' => ['nullable', 'string', 'max:64'],
                'wholesale_sku' => ['nullable', 'string', 'max:64'],
                'status' => ['required', 'string'],
                'in_stock' => ['nullable', 'numeric'],
                'category' => ['required', 'string'],
                'length' => ['nullable', 'numeric', 'min:0'],
                'width' => ['nullable', 'numeric', 'min:0'],
                'color' => ['nullable', 'string', 'max:200'],
                'type' => ['nullable', 'string', 'max:200'],
                'count_per_box' => ['required', 'numeric', 'min:1'],
                'expiry_date' => ['nullable', 'date'],
                'cost_unit' => ['nullable', 'string'],
                'bos_unit' => ['nullable', 'string'],
                'weight' => ['nullable', 'string'],
            ]);
            
            $product = Product::create([
                'name' => $request->name,
                'sort_order' => $request->sort_order ?? 1,
                'is_active' => ($request->status === 'available') ? 1 : 0,
                'wholesale_price' => $request->wholesale_price ?? 0,
                'box_price' => $request->box_price ?? 0,
                'unit_price' => $request->unit_price ?? 0,
                'cost' => $request->cost ?? 0,
                'description' => $request->description,
                'box_barcode' => $request->box_barcode,
                'unit_barcode' => $request->unit_barcode,
                'superdealer_barcode' => $request->superdealer_barcode,
                'wholesale_barcode' => $request->wholesale_barcode,
                'box_sku' => $request->box_sku,
                'unit_sku' => $request->unit_sku,
                'superdealer_sku' => $request->superdealer_sku,
                'wholesale_sku' => $request->wholesale_sku,
                'category_id' => $request->category,
                'in_stock' => $request->in_stock ?? 0,
                'track_stock' => $request->has('track_stock'),
                'continue_selling_when_out_of_stock' => $request->has('continue_selling_when_out_of_stock'),
                'count_per_box' => $request->count_per_box ?? 10,
                'expiry_date' => $request->expiry_date,
                'cost_unit' => $request->cost_unit,
                'box_unit' => $request->box_unit,
                'weight' => $request->weight
            ]);
            if ($request->hasFile('image')) {
                $product->updateImage($request->file('image'));
            }

            $regular->product_id = $product->id; // Store the new product ID
        }else {
            // If next_phase checkbox is not checked, set product_id to null
            $regular->product_id = null;
        }
        
        
        $regular->save();

        $regular2 = $regular->regular2;
        $regular2['put_in_water_'.$request->day] = $request['put_in_water'];
        $regular2['in_mold_'.$request->day] = $request['in_mold'];
        $regular2['date_'.$request->day] = $request['date'];
        $regular2['water_'.$request->day] = $request['water'];
        $regular2['salt_'.$request->day] = $request['salt'];
        $regular2['lancienne_qty_'.$request->day] = $request['lancienne_qty'];
        $regular2['reqular_qty_'.$request->day] = $request['reqular_qty'];
        $regular2->save();

        return back()->with('success', __('Updated'));
    }

    public function print(?string $year = 'now', ?string $week = 'now'): View
    {
        if ($week == 'now') {
            $week = Carbon::now()->weekOfYear; 
            $year = Carbon::now()->format('y');
        }
        
        return view('gouda_regular.print', [
            'week' => $week,
            'year' => $year,
            'regular' => $this->geGoudaRegular($year, $week)
        ]);
    }

    private function geGoudaRegular($year, $week) : GoudaRegular1
    {
        $regular1 =  GoudaRegular1::where('year', '=', $year)
                    ->where('week', '=', $week)
                    ->first();

        if ($regular1 == null) {
            $regular1 = new GoudaRegular1();
            $regular1->year = $year;
            $regular1->week = $week;
            $regular1->save();

            $regular2 = new GoudaRegular2();
            $regular2->parent_id = $regular1->id;
            $regular2->year = $year;
            $regular2->week = $week;
            $regular2->save();
        }

        return $regular1;
    }
}