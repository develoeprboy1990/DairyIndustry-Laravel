<?php

namespace App\Http\Controllers;

use App\Models\Kishek;
use App\Models\Kishek1;
use App\Models\Kishek2;
use App\Models\Kishek3;
use App\Models\Kishek4;
use App\Models\Kishek5;
use App\Models\Kishek6;
use App\Models\Kishek7;
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


class KishekController extends Controller
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
        
        return view('kishek.index', [
            'week' => $week,
            'year' => $year,
            'kishek' => $this->geKishek($year, $week)
        ]);
    }

    public function edit(Kishek $kishek, string $day = '1'): View
    {
        
        // add this part: start
        // Fetch the associated product, if it exists
        $product = $kishek->product_id ? Product::find($kishek->product_id) : null;
        
        // $product = $kishek->product_id && $kishek->dairy_serial == $day ? Product::find($kishek->product_id) : null;

        
        // Determine if 'Next Phase' should be checked
        // $isNextPhaseChecked = $product ? true : false;
        // $hasExistingProduct = $product ? true : false;
        $isNextPhaseChecked = false;
        $hasExistingProduct = false;
        $mounehCategory = Category::where('is_active', 1)->get();
        
        
        return view("kishek.edit", [
            'kishek' => $kishek,
            'day' => $day,
            
             //  add this part: start
            'mounehCategory' => $mounehCategory,
            'isNextPhaseChecked' => $isNextPhaseChecked,
            'hasExistingProduct' => $hasExistingProduct,
            'product' => $product
        ]);
    }

    public function update(Request $request, Kishek $kishek)
    {
        $request->validate([
            'day' => ['required', 'string', 'max:2'],
            'laban_qty' => ['nullable', 'string', 'min:0'],
            'groats' => ['nullable', 'string', 'min:0'],
            'salt' => ['nullable', 'string', 'min:0']
        ]);

        $sub_kishek = $kishek['kishek_'.$request->day];

        $sub_kishek['laban_qty'] = $request['laban_qty'];
        $sub_kishek['groats'] = $request['groats'];
        $sub_kishek['salt'] = $request['salt'];
        $sub_kishek['current_weight'] = $request['current_weight'];
        $sub_kishek['breaking_date'] = $request['breaking_date'];
        $sub_kishek['cost_of_breaking'] = $request['cost_of_breaking'];
        for ($i = 1; $i <= 9 ; $i++) { 
            $sub_kishek['labneh_added_'.$i] = $request['labneh_added_'.$i];
            $sub_kishek['labneh_amount_'.$i] = $request['labneh_amount_'.$i];
            $sub_kishek['current_weight_'.$i] = $request['current_weight_'.$i];
        }
        $sub_kishek['final_qty'] = $request['final_qty'];
        
        
         // add this part: start 95 line to 236
        if ($kishek->product_id) {
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
            
            
            $product = Product::find($kishek->product_id);
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
            
            $kishek->product_id = $product->id;
            
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
            $kishek->product_id = $product->id; // Store the new product ID
            $sub_kishek->product_id = $product->id; // Store the new product ID
            
        }else {
            // If next_phase checkbox is not checked, set product_id to null
            $kishek->product_id = null;
            $sub_kishek->product_id = null;
           
        }
        
        $kishek->save();
        $sub_kishek->save();

        return back()->with('success', __('Updated'));
    }

    public function print(?string $year = 'now', ?string $week = 'now'): View
    {
        if ($week == 'now') {
            $week = Carbon::now()->weekOfYear; 
            $year = Carbon::now()->format('y');
        }
        
        return view('kishek.print', [
            'week' => $week,
            'year' => $year,
            'kishek' => $this->geKishek($year, $week)
        ]);
    }

    private function geKishek($year, $week) : Kishek
    {
        $kishek =  Kishek::where('year', '=', $year)
                    ->where('week', '=', $week)
                    ->first();

        if ($kishek == null) {
            $kishek = new Kishek();
            $kishek->year = $year;
            $kishek->week = $week;
            $kishek->save();

            $kishek1 = new Kishek1();
            $kishek1->parent_id = $kishek->id;
            $kishek1->year = $year;
            $kishek1->week = $week;
            $kishek1->save();

            $kishek2 = new Kishek2();
            $kishek2->parent_id = $kishek->id;
            $kishek2->year = $year;
            $kishek2->week = $week;
            $kishek2->save();

            $kishek3 = new Kishek3();
            $kishek3->parent_id = $kishek->id;
            $kishek3->year = $year;
            $kishek3->week = $week;
            $kishek3->save();

            $kishek4 = new Kishek4();
            $kishek4->parent_id = $kishek->id;
            $kishek4->year = $year;
            $kishek4->week = $week;
            $kishek4->save();

            $kishek5 = new Kishek5();
            $kishek5->parent_id = $kishek->id;
            $kishek5->year = $year;
            $kishek5->week = $week;
            $kishek5->save();

            $kishek6 = new Kishek6();
            $kishek6->parent_id = $kishek->id;
            $kishek6->year = $year;
            $kishek6->week = $week;
            $kishek6->save();

            $kishek7 = new Kishek7();
            $kishek7->parent_id = $kishek->id;
            $kishek7->year = $year;
            $kishek7->week = $week;
            $kishek7->save();
        }
        return $kishek;
    }
}