<?php

namespace App\Http\Controllers;

use App\Models\LabanProcess1;
use App\Models\LabanProcess2;
use Illuminate\Contracts\View\View;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use App\Models\MilkDetail;


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

class LabanProcessController extends Controller
{
    public $FILEDS1 = [
        'qty' => 'Quantity of milk',
        'water' => 'Milk Analyzer / Water %',
        'on_fire' => 'On fire @',
        'off_fire' => 'Off fire @',
        'cooled_down' => 'Cooling time @',
        'laban_added' => 'Laban Added @',
        'laban_added_qty' => 'Qty of Laban Added',
        'ready' => 'Ready @',
        'test' => 'P.H. test',
        'notes' => 'Notes'
    ];

    public $FILEDS2 = [
        'bulk_qty' => 'Quantity of Bulk kg',
        'glass_qty' => 'Quantity of glass-cup',
        'bucket_1_qty' => 'Quantity of 1 kg bucket',
        'bucket_2_qty' => 'Quantity of 2 kg bucket',
        'bucket_5_qty' => 'Quantity of 5 kg bucket',
        'put_in_fridge' => 'Put in Fridge @',
        'final_qty' => 'Final Quantity of Laben in kg'
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
        
        return view('laban_process.index', [
            'week' => $week,
            'year' => $year,
            'laban' => $this->geLabanProcess($year, $week),
            'fields1' => $this->FILEDS1,
            'fields2' => $this->FILEDS2
        ]);
    }

    public function edit(LabanProcess1 $laban, string $day = '1'): View
    {
        $sum = MilkDetail::getSum($laban->year, $laban->week);
        
        // add this part: start
        // Fetch the associated product, if it exists
        $product = $laban->product_id ? Product::find($laban->product_id) : null;
        
        // $product = $laban->product_id && $laban->dairy_serial == $day ? Product::find($laban->product_id) : null;

        
        // Determine if 'Next Phase' should be checked
        // $isNextPhaseChecked = $product ? true : false;
        // $hasExistingProduct = $product ? true : false;
        $isNextPhaseChecked = false;
        $hasExistingProduct = false;
        $mounehCategory = Category::where('is_active', 1)->get();
        
        return view("laban_process.edit", [
            'laban' => $laban,
            'day' => $day,
            'milk_sum' => $sum['2_qty_'.$day.'_sum'],
            'fields1' => $this->FILEDS1,
            'fields2' => $this->FILEDS2,
             //  add this part: start
            'mounehCategory' => $mounehCategory,
            'isNextPhaseChecked' => $isNextPhaseChecked,
            'hasExistingProduct' => $hasExistingProduct,
            'product' => $product
            
        ]);
    }

    public function update(Request $request, LabanProcess1 $laban)
    {
        $request->validate([
            'day' => ['required', 'string', 'max:2']
        ]);

        foreach ($this->FILEDS1 as $key => $value) {
            $laban[$key.'_'.$request->day] = $request[$key];
        }
        
        // add this part: start 95 line to 236
        if ($laban->product_id) {
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
            
            
            $product = Product::find($laban->product_id);
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

            $laban->product_id = $product->id; // Store the new product ID
        }else {
            // If next_phase checkbox is not checked, set product_id to null
            $laban->product_id = null;
        }
        
        
        
        $laban->save();

        $laban2 = $laban->laban2;
        foreach ($this->FILEDS2 as $key => $value) {
            $laban2[$key.'_'.$request->day] = $request[$key];
        }
        $laban2->save();

        return back()->with('success', __('Updated'));
    }

    public function print(?string $year = 'now', ?string $week = 'now'): View
    {
        if ($week == 'now') {
            $week = Carbon::now()->weekOfYear; 
            $year = Carbon::now()->format('y');
        }
        
        return view('laban_process.print', [
            'week' => $week,
            'year' => $year,
            'laban' => $this->geLabanProcess($year, $week),
            'fields1' => $this->FILEDS1,
            'fields2' => $this->FILEDS2
        ]);
    }

    private function geLabanProcess($year, $week) : LabanProcess1
    {
        $laban1 =  LabanProcess1::where('year', '=', $year)
                    ->where('week', '=', $week)
                    ->first();

        if ($laban1 == null) {
            $laban1 = new LabanProcess1();
            $laban1->year = $year;
            $laban1->week = $week;
            $laban1->save();

            $laban2 = new LabanProcess2();
            $laban2->parent_id = $laban1->id;
            $laban2->save();
        }

        return $laban1;
    }
}