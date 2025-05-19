<?php

namespace App\Http\Controllers;

use App\Models\CheeseProcess1;
use App\Models\CheeseProcess2;
use App\Models\DairyIndustry;
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


class CheeseProcessController extends Controller
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
        
        return view('cheese_process.index', [
            'week' => $week,
            'year' => $year,
            'cheese' => $this->geCheeseProcess($year, $week)
        ]);
    }

    public function edit(CheeseProcess1 $cheese, string $day = '1'): View
    {
        // add this part: start
        // Fetch the associated product, if it exists
        $product = $cheese->product_id ? Product::find($cheese->product_id) : null;
        
    // $product = $cheese->product_id && $cheese->dairy_serial == $day ? Product::find($cheese->product_id) : null;

        
        // Determine if 'Next Phase' should be checked
        $isNextPhaseChecked = $product ? true : false;
        $hasExistingProduct = $product ? true : false;
        $mounehCategory = Category::where('is_active', 1)->get();
        
        
        return view("cheese_process.edit", [
            'cheese' => $cheese,
            'day' => $day,
            
            //  add this part: start
            'mounehCategory' => $mounehCategory,
            'isNextPhaseChecked' => $isNextPhaseChecked,
            'hasExistingProduct' => $hasExistingProduct,
            'product' => $product
        ]);
    }

    public function update(Request $request, CheeseProcess1 $cheese)
    {
        $request->validate([
            'day' => ['required', 'string', 'max:2'],
            'qty' => ['nullable', 'string', 'min:0'],
            'milk_analyzer' => ['nullable', 'string', 'min:0'],
            'time_on' => ['nullable', 'string', 'min:0'],
            'time_off' => ['nullable', 'string', 'min:0'],
            'cooled_down' => ['nullable', 'string', 'min:0'],
            'rennet_qty' => ['nullable', 'string', 'min:0'],
            'added' => ['nullable', 'string', 'min:0'],
            'fermented' => ['nullable', 'string', 'min:0'],
            'cut' => ['nullable', 'string', 'min:0'],
            'balady_cheese_qty' => ['nullable', 'string', 'min:0'],
            'put_in_mold' => ['nullable', 'string', 'min:0'],
            'boiling_started_1' => ['nullable', 'string', 'min:0'],
            'boiling_started_2' => ['nullable', 'string', 'min:0'],
            'halloum_cheese_qty' => ['nullable', 'string', 'min:0'],
            'in_fridge' => ['nullable', 'string', 'min:0'],
            'akkwai_cheese_qty' => ['nullable', 'string', 'min:0'],
        ]);

        $cheese['qty_'.$request->day] = $request['qty'];
        $cheese['milk_analyzer_'.$request->day] = $request['milk_analyzer'];
        $cheese['time_on_'.$request->day] = $request['time_on'];
        $cheese['time_off_'.$request->day] = $request['time_off'];
        $cheese['cooled_down_'.$request->day] = $request['cooled_down'];
        $cheese['rennet_qty_'.$request->day] = $request['rennet_qty'];
        $cheese['added_'.$request->day] = $request['added'];
        $cheese['fermented_'.$request->day] = $request['fermented'];
        $cheese['cut_'.$request->day] = $request['cut'];
        $cheese['balady_cheese_qty_'.$request->day] = $request['balady_cheese_qty'];
        
        
        // add this part: start 95 line to 236
        if ($cheese->product_id) {
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
            
            
            $product = Product::find($cheese->product_id);
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
                'box_price' => $box_price ?? 0,
                'unit_price' => $unit_price ?? 0,
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

            $cheese->product_id = $product->id; // Store the new product ID
        }else {
            // If next_phase checkbox is not checked, set product_id to null
            $cheese->product_id = null;
        }
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        $cheese->save();

        $cheese2 = $cheese->cheese2;
        $cheese2['put_in_mold_'.$request->day] = $request['put_in_mold'];
        $cheese2['in_fridge_'.$request->day] = $request['in_fridge'];
        $cheese2['boiling_started_1_'.$request->day] = $request['boiling_started_1'];
        $cheese2['boiling_started_2_'.$request->day] = $request['boiling_started_2'];
        $cheese2['halloum_cheese_qty_'.$request->day] = $request['halloum_cheese_qty'];
        $cheese2['akkwai_cheese_qty_'.$request->day] = $request['akkwai_cheese_qty'];
        $cheese2->save();

        return back()->with('success', __('Updated'));
    }

    public function print(?string $year = 'now', ?string $week = 'now'): View
    {
        if ($week == 'now') {
            $week = Carbon::now()->weekOfYear; 
            $year = Carbon::now()->format('y');
        }
        
        return view('cheese_process.print', [
            'week' => $week,
            'year' => $year,
            'cheese' => $this->geCheeseProcess($year, $week)
        ]);
    }

    private function geCheeseProcess($year, $week) : CheeseProcess1
    {
        $cheese1 =  CheeseProcess1::where('year', '=', $year)
                    ->where('week', '=', $week)
                    ->first();

        if ($cheese1 == null) {
            $cheese1 = new CheeseProcess1();
            $cheese1->year = $year;
            $cheese1->week = $week;
            $cheese1->save();

            $cheese2 = new CheeseProcess2();
            $cheese2->parent_id = $cheese1->id;
            $cheese2->year = $year;
            $cheese2->week = $week;
            $cheese2->save();
        }

        return $cheese1;
    }
}