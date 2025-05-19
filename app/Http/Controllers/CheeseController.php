<?php

namespace App\Http\Controllers;

use App\Models\Cheese;

use App\Models\MounehIndustry;
use App\Models\Category;
use App\Models\Settings;
use App\Models\Product;
use App\Http\Requests\StoreMounehIndustryRequest;
use App\Http\Requests\UpdateMounehIndustryRequest;
use App\Traits\Availability;
use Illuminate\Support\Facades\DB;

use App\Http\Resources\ProductSelectResourceCollection;

use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redirect;
use Illuminate\View\View;
use Illuminate\Support\Carbon;



class CheeseController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\View\View
     */
    public function index(Request $request): View
    {
        $cheese = Cheese::search($request->search_query)->orderBy('order')->paginate(20);
        return view('cheeses.index', [
            'cheeses' => $cheese
        ]);
    }

    public function print(Request $request): View
    {
        $cheese = Cheese::search($request->search_query)->orderBy('order')->get();
        return view('cheeses.print', [
            'cheeses' => $cheese
        ]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\View\View
     */
    public function create(): View
    {
        
        
           // Fetch the category where name is 'mouneh'
        // $mounehCategory = Category::where('name', 'Cheese & Labneh')->first();
        $mounehCategory = Category::where('is_active', 1)->get();
    
        // Handle case if 'mouneh' category is not found
        if (!$mounehCategory) {
            abort(404, 'Cheese & Labneh category not found.');
        }
        
        // Default to false for a new Mouneh Industry (no product associated yet)
        $isNextPhaseChecked = false;
    
        return view("cheeses.create", [
            'mounehCategory' => $mounehCategory, // Pass the 'mouneh' category
             'isNextPhaseChecked' => $isNextPhaseChecked,
        ]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\RedirectResponse
     */
    public function store(Request $request): RedirectResponse
    {
        $request->validate([
            'name' => ['required', 'string', 'max:100'],
            'order' => ['nullable', 'numeric', 'min:0']
        ]);

        $cheese = new Cheese();
        $cheese->name = $request->name;
        $cheese->order = $request->order;
        $cheese->manufacturing_date = $request->manufacturing_date;
        $cheese->evaporation_hours = $request->evaporation_hours;
        $cheese->quantity = $request->quantity;
        $cheese->unit = $request->unit;
        
         // Check if the "next_phase" checkbox is checked, and create a Product
        if ($request->next_phase) {

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
    
            $box_price = 0;
            $unit_price = 0;
            if($request->box_price === null && $request->unit_price !== null) {$box_price = $request->unit_price * $request->count_per_box ;$unit_price = $request->unit_price;}
            else if($request->box_price !== null && $request->unit_price === null) {$unit_price = $request->box_price / $request->count_per_box ;$box_price = $request->box_price;}
            else if($request->box_price !== null && $request->unit_price !== null) {$box_price = $request->box_price;$unit_price = $request->unit_price;}
    
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
    
            if ($request->has('image')) {
                $product->updateImage($request->image);
            }
    
            // Attach the created product ID to the Cheese
            $cheese->product_id = $product->id;
        }else {
            // If next_phase checkbox is not checked, set product_id to null
            $cheese->product_id = null;
        }
        
        
        $cheese->save();

        return Redirect::back()->with("success", __("Created"));
    }


    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Cheese  $customer
     * @return \Illuminate\Http\RedirectResponse
     */
    public function destroy(Cheese $cheese): RedirectResponse
    {
        
         // Delete the associated product if it exists
        if ($cheese->product) {
            $cheese->product->delete(); // Delete the related Product
        }
    
        // Delete the MounehIndustry record
        $cheese->delete();

        return Redirect::back()->with("success", __("Deleted"));
    }

    public function edit(Cheese $cheese): View
    {
        $mounehCategory = Category::where('is_active', 1)->get();
        
        // Fetch the associated product, if it exists
        $product = $cheese->product_id
        ? Product::find($cheese->product_id)
        : null;
        
        // Handle case if 'mouneh' category is not found
        if (!$mounehCategory) {
            abort(404, 'Mouneh category not found.');
        }
        
        // Determine if 'Next Phase' should be checked
        $isNextPhaseChecked = $product ? true : false;
        $hasExistingProduct = $product ? true : false;
        
        return view("cheeses.edit", [
            'cheese' => $cheese,
            'mounehCategory' => $mounehCategory,
            'product'=> $product,
            'isNextPhaseChecked' => $isNextPhaseChecked,
            'hasExistingProduct' => $hasExistingProduct,
        ]);
        
    }
    
    public function update(Request $request, Cheese $cheese)
    {
        $request->validate([
            'name' => ['required', 'string', 'max:100'],
            'order' => ['nullable', 'numeric', 'min:0']
        ]);

        $cheese->name = $request->name;
        $cheese->order = $request->order;
        $cheese->manufacturing_date = $request->manufacturing_date;
        $cheese->evaporation_hours = $request->evaporation_hours;
        $cheese->quantity = $request->quantity;
        $cheese->unit = $request->unit;
        
        
                
         // Handle the product logic
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
            
            if ($request->has('image')) {
                $product->updateImage($request->image);
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
            if ($request->has('image')) {
                $product->updateImage($request->image);
            }
            

            $cheese->product_id = $product->id; // Store the new product ID
        }else {
            // If next_phase checkbox is not checked, set product_id to null
            $cheese->product_id = null;
        }
        
        
        
        $cheese->save();

        return back()->with('success', __('Updated'));
    }
}