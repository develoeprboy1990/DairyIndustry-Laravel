<?php

namespace App\Http\Controllers;

use App\Models\MounehIndustry;
use App\Models\Category;
use App\Models\Settings;
use App\Models\Product;
use App\Models\PlasticBucket;
use App\Models\GeneralRestriction;
use App\Models\Ingredient;
use App\Http\Requests\StoreMounehIndustryRequest;
use App\Http\Requests\UpdateMounehIndustryRequest;
use App\Traits\Availability;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redirect;
use Illuminate\View\View;
use App\Http\Resources\ProductSelectResourceCollection;

class MounehIndustryController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\View\View
     */
    public function index(Request $request): View
    {
        $mounehIndustries = MounehIndustry::search($request->search_query)->orderBy('created_at', 'desc')->paginate(20);
        return view('mounehindustries.index', [
            'mounehIndustries' => $mounehIndustries
        ]);
    }

    public function print(Request $request): View
    {
        $mounehIndustries = MounehIndustry::search($request->search_query)->orderBy('created_at', 'desc')->get();
        return view('mounehindustries.print', [
            'mounehIndustries' => $mounehIndustries
        ]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\View\View
     */
    public function create(): View
    {
        $plasticBuckets = PlasticBucket::all();
         // Fetch the category where name is 'mouneh'
        // $mounehCategory = Category::where('name', 'Lvb mouneh industry')->first();
        $mounehCategory = Category::where('is_active', 1)->get();
    
        // // Handle case if 'mouneh' category is not found
        // if (!$mounehCategory) {
        //     abort(404, 'Mouneh category not found.');
        // }
        
        // Default to false for a new Mouneh Industry (no product associated yet)
        $isNextPhaseChecked = false;
    
        return view("mounehindustries.create", [
            'mounehCategory' => $mounehCategory, // Pass the 'mouneh' category
             'isNextPhaseChecked' => $isNextPhaseChecked,
             'plasticBuckets' => $plasticBuckets
        ]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \App\Http\Requests\StoreMounehIndustryRequest  $request
     * @return \Illuminate\Http\RedirectResponse
     */
    public function store(StoreMounehIndustryRequest $request): RedirectResponse
    {
        $mounehIndustry = new MounehIndustry();
        $mounehIndustry->type_of_mouneh = $request->type_of_mouneh;
        $mounehIndustry->quantity_of_fruit_vegetable = $request->quantity_of_fruit_vegetable;
        $mounehIndustry->quantity_of_sugar_salt = $request->quantity_of_sugar_salt;
        $mounehIndustry->quantity_of_acid = $request->quantity_of_acid;
        $mounehIndustry->cheese_qty = $request->cheese_qty;
        $mounehIndustry->water_qty = $request->water_qty;
        $mounehIndustry->citricAcid_qty = $request->citricAcid_qty;
        $mounehIndustry->final_quantity = $request->final_quantity;


        
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

                'minimum_stock' => ['required', 'numeric', 'min:0'],
                'plastic_bucket_stock'   => ['required','array'],
                'plastic_bucket_stock.*' => ['nullable','numeric','min:0'],
                'main_category' => ['nullable', 'string'],
            ]);

            $newBucketStocks = $request->plastic_bucket_stock;
            $request->plastic_bucket_stock = json_encode($request->plastic_bucket_stock);
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
                'weight' => $request->weight,

                'minimum_stock' => $request->minimum_stock ?? 0,
                'plastic_bucket_stock' => $request->plastic_bucket_stock,
                'main_category' => $request->main_category
            ]);
    
            if ($request->hasFile('image')) { // Check if a file is uploaded
                $product->updateImage($request->file('image')); // Use file() to get the UploadedFile instance
            }
    
            // Attach the created product ID to the MounehIndustry
            $mounehIndustry->product_id = $product->id;


            // ===== save the plustic buckets
            foreach ($newBucketStocks as $bucketId => $additionalStock) {
                // Only update if the additional stock is a positive number
                if ($additionalStock > 0) {
                    // Find the corresponding plastic bucket record
                    $bucket = PlasticBucket::find($bucketId);
                    if ($bucket) {
                        // Add the additional stock to the existing stock
                        $bucket->stock = $bucket->stock + $additionalStock;
                        $bucket->save();
                    }
                }
            }

            if($request->main_category){
                $generalRestriction = new GeneralRestriction();
                $generalRestriction->sub_category_name = $request->main_category;
                $generalRestriction->category_id = $request->category;
                $generalRestriction->product_id = $product->id; 
                $generalRestriction->product_name = $request->name;
                $generalRestriction->gr_stock = $request->in_stock ?? 0;
                $generalRestriction->gr_price = $request->cost;
                $generalRestriction->save();
            }
        }else {
            // If next_phase checkbox is not checked, set product_id to null
            $mounehIndustry->product_id = null;
        }
        
        $mounehIndustry->save();


        // ====save the Ingredients
        $ingredient = Ingredient::first();
        $ingredient->quantity_of_milk = $ingredient->quantity_of_milk + ($request->quantity_of_fruit_vegetable ?? 0);
        $ingredient->quantity_of_swedish_powder = $ingredient->quantity_of_swedish_powder + ($request->quantity_of_sugar_salt ?? 0);
        $ingredient->quantity_of_ACC_butter = $ingredient->quantity_of_ACC_butter + ($request->quantity_of_acid ?? 0);
        $ingredient->quantity_of_cheese = $ingredient->quantity_of_cheese + ($request->cheese_qty ?? 0);
        $ingredient->quantity_of_citriv_acid = $ingredient->quantity_of_citriv_acid + ($request->citricAcid_qty ?? 0);
        $ingredient->quantity_of_water =  $ingredient->quantity_of_water + ($request->water_qty ?? 0);

        // Save the updated record.
        $ingredient->save();


        return Redirect::back()->with("success", __("Created"));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\MounehIndustry  $mounehIndustry
     * @return \Illuminate\View\View
     */
    public function edit(MounehIndustry $mounehIndustry): View
    {
         $mounehCategory = Category::where('is_active', 1)->get();
        
        // Fetch the associated product, if it exists
        $product = $mounehIndustry->product_id
        ? Product::find($mounehIndustry->product_id)
        : null;
        
        // Handle case if 'mouneh' category is not found
        if (!$mounehCategory) {
            abort(404, 'Mouneh category not found.');
        }
        
        // Determine if 'Next Phase' should be checked
        $isNextPhaseChecked = $product ? true : false;
        $hasExistingProduct = $product ? true : false;

        $plasticBuckets = PlasticBucket::all();
        $plasticBucketStock = $product ? json_decode($product->plastic_bucket_stock, true) : null;
        
        return view("mounehindustries.edit", [
            'mounehIndustry' => $mounehIndustry,
            'mounehCategory' => $mounehCategory,
            'product'=> $product,
            'isNextPhaseChecked' => $isNextPhaseChecked,
            'hasExistingProduct' => $hasExistingProduct,
            'plasticBuckets' => $plasticBuckets,
            'plasticBucketStock' => $plasticBucketStock
        ]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \App\Http\Requests\UpdateMounehIndustryRequest  $request
     * @param  \App\Models\MounehIndustry  $mounehIndustry
     * @return \Illuminate\Http\RedirectResponse
     */
    public function update(UpdateMounehIndustryRequest $request, MounehIndustry $mounehIndustry): RedirectResponse
    {
        $old_mouneh = MounehIndustry::findOrFail($mounehIndustry->id);

        // ====save the Ingredients
        $ingredient = Ingredient::first();
        $ingredient->quantity_of_milk = ($ingredient->quantity_of_milk - $old_mouneh->quantity_of_fruit_vegetable) + ($request->quantity_of_fruit_vegetable ?? 0);
        $ingredient->quantity_of_swedish_powder = ($ingredient->quantity_of_swedish_powder - $old_mouneh->quantity_of_sugar_salt) + ($request->quantity_of_sugar_salt ?? 0);
        $ingredient->quantity_of_ACC_butter = ($ingredient->quantity_of_ACC_butter - $old_mouneh->quantity_of_acid) + ($request->quantity_of_acid ?? 0);
        $ingredient->quantity_of_cheese = ($ingredient->quantity_of_cheese - $old_mouneh->cheese_qty) + ($request->cheese_qty ?? 0);
        $ingredient->quantity_of_citriv_acid = ($ingredient->quantity_of_citriv_acid - $old_mouneh->citricAcid_qty) + ($request->citricAcid_qty ?? 0);
        $ingredient->quantity_of_water =  ($ingredient->quantity_of_water + $old_mouneh->water_qty) + ($request->water_qty ?? 0);
        // Save the updated record.
        $ingredient->save();


        $mounehIndustry->type_of_mouneh = $request->type_of_mouneh;
        $mounehIndustry->quantity_of_fruit_vegetable = $request->quantity_of_fruit_vegetable;
        $mounehIndustry->quantity_of_sugar_salt = $request->quantity_of_sugar_salt;
        $mounehIndustry->quantity_of_acid = $request->quantity_of_acid;
        $mounehIndustry->cheese_qty = $request->cheese_qty;
        $mounehIndustry->water_qty = $request->water_qty;
        $mounehIndustry->citricAcid_qty = $request->citricAcid_qty;
        $mounehIndustry->final_quantity = $request->final_quantity;
        
        
         // Handle the product logic
        if ($mounehIndustry->product_id) {
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

                'minimum_stock' => ['required', 'numeric', 'min:0'],
                'plastic_bucket_stock'   => ['required','array'],
                'plastic_bucket_stock.*' => ['nullable','numeric','min:0'],
                'main_category' => ['nullable', 'string'],
            ]);

            // Get the new plastic bucket stock from the request.
            $newPlasticBucketStock = $request->input('plastic_bucket_stock');
            $request->plastic_bucket_stock = json_encode($request->plastic_bucket_stock);

            $product = Product::find($mounehIndustry->product_id);

            // Decode the old plastic bucket stock from the product record.
            $oldPlasticBucketStock = json_decode($product->plastic_bucket_stock, true) ?? [];

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
                'weight' => $request->weight,

                'minimum_stock' => $request->minimum_stock ?? 0,
                'plastic_bucket_stock' => $request->plastic_bucket_stock,
                'main_category' => $request->main_category
            ]);
            
            if ($request->has('image')) {
                $product->updateImage($request->image);
            }


            // Loop through the new plastic bucket stocks.
            foreach ($newPlasticBucketStock as $bucketId => $newValue) {
                // Get the old value; if not set, assume 0.
                $oldValue = isset($oldPlasticBucketStock[$bucketId]) ? $oldPlasticBucketStock[$bucketId] : 0;
                // Calculate the difference.
                $difference = $newValue - $oldValue;

                // If there is a change, update the global plastic bucket stock.
                if ($difference != 0) {
                    $bucket = PlasticBucket::find($bucketId);
                    if ($bucket) {
                        // Adjust the global stock by the difference.
                        $bucket->stock += $difference;
                        $bucket->save();
                    }
                }
            }

            if($request->main_category){
                $generalRestriction = GeneralRestriction::where('product_id', $product->id)
                ->where('category_id', $request->category)
                ->first();
                if($generalRestriction){
                    $generalRestriction->sub_category_name = $request->main_category;
                    $generalRestriction->category_id = $request->category;
                    $generalRestriction->product_id = $product->id; 
                    $generalRestriction->product_name = $request->name;
                    $generalRestriction->gr_stock = $request->in_stock ?? 0;
                    $generalRestriction->gr_price = $request->cost;
                    $generalRestriction->save();
                }
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

                'minimum_stock' => ['required', 'numeric', 'min:0'],
                'plastic_bucket_stock'   => ['required','array'],
                'plastic_bucket_stock.*' => ['nullable','numeric','min:0'],
                'main_category' => ['nullable', 'string'],
            ]);

            
            // Get the new plastic bucket stock from the request.
            $newBucketStocks = $request->plastic_bucket_stock;
            $request->plastic_bucket_stock = json_encode($request->plastic_bucket_stock);
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
                'weight' => $request->weight,

                'minimum_stock' => $request->minimum_stock ?? 0,
                'plastic_bucket_stock' => $request->plastic_bucket_stock,
                'main_category' => $request->main_category
            ]);
            if ($request->has('image')) {
                $product->updateImage($request->image);
            }
            

            $mounehIndustry->product_id = $product->id; // Store the new product ID



            foreach ($newBucketStocks as $bucketId => $additionalStock) {
                // Only update if the additional stock is a positive number
                if ($additionalStock > 0) {
                    // Find the corresponding plastic bucket record
                    $bucket = PlasticBucket::find($bucketId);
                    if ($bucket) {
                        // Add the additional stock to the existing stock
                        $bucket->stock = $bucket->stock + $additionalStock;
                        $bucket->save();
                    }
                }
            }
    
            if($request->main_category){
                $generalRestriction = new GeneralRestriction();
                $generalRestriction->sub_category_name = $request->main_category;
                $generalRestriction->category_id = $request->category;
                $generalRestriction->product_id = $product->id; 
                $generalRestriction->product_name = $request->name;
                $generalRestriction->gr_stock = $request->in_stock ?? 0;
                $generalRestriction->gr_price = $request->cost;
                $generalRestriction->save();
            }
        }else {
            // If next_phase checkbox is not checked, set product_id to null
            $mounehIndustry->product_id = null;
        }
        
        $mounehIndustry->save();

        return back()->with('success', __('Updated'));
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\MounehIndustry  $mounehIndustry
     * @return \Illuminate\Http\RedirectResponse
     */
   public function destroy(MounehIndustry $mounehIndustry): RedirectResponse
    {
        // Delete the associated product if it exists
        if ($mounehIndustry->product) {
            $mounehIndustry->product->delete(); // Delete the related Product
        }
    
        // Delete the MounehIndustry record
        $mounehIndustry->delete();
    
        return Redirect::back()->with("success", __("Deleted"));
    }
}