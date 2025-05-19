<?php

namespace App\Http\Controllers;

use App\Models\Raclette1;
use App\Models\Raclette2;
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

class RacletteController extends Controller
{
    public $FILEDS1 = [
        'qty' => 'Quantity of Milk',
        'on_fire' => 'On Fire @',
        'off_fire' => 'Off of Fire @',
        'temperature_1' => 'Temperature',
        'cool_down' => 'Cooled down @',
        'ferment_added' => 'Added Ferment @',
        'temperature_2' => 'Temperature',
        'pressured' => 'Pressured @',
        'breaking' => 'On Fire + breaking @',
        'stirring_until' => 'Stirring until @',
        'serum_extracted' => 'Serum extracted @'
    ];

    public $FILEDS2 = [
        'serum_qty' => 'Serum’s quantity',
        'water' => 'Water Quantity added :',
        'fire_on' => 'Stirring on fire From: Till:',
        'put_in_mold' => 'Put in mold @',
        'stirring1' => 'Stirring @',
        'stirring2' => 'Stirring @',
        'stirring3' => 'Stirring @',
        'date' => 'Date: ',
        'water_vs_salt' => 'Quantity of Water: vs Quantity of Salt:',
        'notes' => 'Notes:',
        'final_qty' => 'Final Quantity: '
    ];
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
        
        // dd($this->geRaclette($year, $week));
        return view('raclette.index', [
            'week' => $week,
            'year' => $year,
            'raclette' => $this->geRaclette($year, $week),
            'fields1' => $this->FILEDS1,
            'fields2' => $this->FILEDS2
        ]);
    }

    public function edit(Raclette1 $raclette, string $day = '1'): View
    {
         // add this part: start
        // Fetch the associated product, if it exists
        $product = $raclette->product_id ? Product::find($raclette->product_id) : null;
        
        // $product = $raclette->product_id && $raclette->dairy_serial == $day ? Product::find($raclette->product_id) : null;

        
        // Determine if 'Next Phase' should be checked
        // $isNextPhaseChecked = $product ? true : false;
        // $hasExistingProduct = $product ? true : false;
        $isNextPhaseChecked = false;
        $hasExistingProduct = false;
        $mounehCategory = Category::where('is_active', 1)->get();
        
        return view("raclette.edit", [
            'raclette' => $raclette,
            'day' => $day,
            'fields1' => $this->FILEDS1,
            'fields2' => $this->FILEDS2,
            //  add this part: start
            'mounehCategory' => $mounehCategory,
            'isNextPhaseChecked' => $isNextPhaseChecked,
            'hasExistingProduct' => $hasExistingProduct,
            'product' => $product
        ]);
    }

    public function update(Request $request, Raclette1 $raclette)
    {
        $request->validate([
            'day' => ['required', 'string', 'max:2']
        ]);

        foreach ($this->FILEDS1 as $key => $value) {
            $raclette[$key.'_'.$request->day] = $request[$key];
        }
        
        
          
        // add this part: start 95 line to 236
        if ($raclette->product_id) {
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
            
            
            $product = Product::find($raclette->product_id);
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

            $raclette->product_id = $product->id; // Store the new product ID
        }else {
            // If next_phase checkbox is not checked, set product_id to null
            $raclette->product_id = null;
        }
        
        
        
        $raclette->save();

        $raclette2 = $raclette->raclette2;
        foreach ($this->FILEDS2 as $key => $value) {
            $raclette2[$key.'_'.$request->day] = $request[$key];
        }
        $raclette2->save();

        return back()->with('success', __('Updated'));
    }

    public function print(?string $year = 'now', ?string $week = 'now'): View
    {
        if ($week == 'now') {
            $week = Carbon::now()->weekOfYear; 
            $year = Carbon::now()->format('y');
        }
        
        return view('raclette.print', [
            'week' => $week,
            'year' => $year,
            'raclette' => $this->geRaclette($year, $week),
            'fields1' => $this->FILEDS1,
            'fields2' => $this->FILEDS2
        ]);
    }

    private function geRaclette($year, $week) : Raclette1
    {
        $raclette1 =  Raclette1::where('year', '=', $year)
                    ->where('week', '=', $week)
                    ->first();

        if ($raclette1 == null) {
            $raclette1 = new Raclette1();
            $raclette1->year = $year;
            $raclette1->week = $week;
            $raclette1->save();

            $raclette2 = new Raclette2();
            $raclette2->parent_id = $raclette1->id;
            $raclette2->save();
        }

        return $raclette1;
    }
}