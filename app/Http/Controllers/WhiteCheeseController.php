<?php

namespace App\Http\Controllers;

use App\Models\WhiteCheese;
use App\Models\Category;
use App\Models\Product;
use App\Models\Ingredient;
use App\Models\PlasticBucket;
use App\Models\GeneralRestriction;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use Illuminate\Http\RedirectResponse;
use Illuminate\Support\Facades\Redirect;
use App\Http\Requests\WhiteCheeseRequest;
use Illuminate\View\View;

class WhiteCheeseController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\View\View
     */
    public function index(Request $request): View
    {

        $whiteCheeses = WhiteCheese::search($request->search_query)->orderBy('created_at', 'desc')->paginate(20);
        return view('white_cheeses.index', [
            'whiteCheeses' => $whiteCheeses
        ]);
    }

    /**
     * Print of the resource.
     *
     * @return \Illuminate\View\View
     */
    public function print(Request $request): View
    {
        $whiteCheeses = WhiteCheese::search($request->search_query)->orderBy('created_at', 'desc')->get();
        return view('white_cheeses.print', [
            'whiteCheeses' => $whiteCheeses
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
        $cheeseCategory = Category::where('is_active', 1)->get();
    
        // // Handle case if 'mouneh' category is not found
        // if (!$mounehCategory) {
        //     abort(404, 'Mouneh category not found.');
        // }
        
        // Default to false for a new Mouneh Industry (no product associated yet)
        $isNextPhaseChecked = false;
    
        return view("white_cheeses.create", [
            'cheeseCategory' => $cheeseCategory, // Pass the 'mouneh' category
             'isNextPhaseChecked' => $isNextPhaseChecked,
             'plasticBuckets' => $plasticBuckets
        ]);
    }


    /**
     * Store a newly created resource in storage.
     *
     * @param  \App\Http\Requests\WhiteCheeseRequest  $request
     * @return \Illuminate\Http\RedirectResponse
     */
    public function store(WhiteCheeseRequest $request): RedirectResponse
    {

        $whiteCheese = new WhiteCheese();
        $whiteCheese->type_of_cheese = $request->type_of_cheese;
        $whiteCheese->quantity_of_milk = $request->quantity_of_milk;
        $whiteCheese->quantity_of_cylinder_powder = $request->quantity_of_cylinder_powder;
        $whiteCheese->quantity_of_ACC_ghee = $request->quantity_of_ACC_ghee;
        $whiteCheese->quantity_of_starch = $request->quantity_of_starch;
        $whiteCheese->quantity_of_stabilizer = $request->quantity_of_stabilizer;
        $whiteCheese->quantity_of_protein = $request->quantity_of_protein;
        $whiteCheese->quantity_of_calcium = $request->quantity_of_calcium;
        $whiteCheese->quantity_of_water = $request->quantity_of_water;
        $whiteCheese->quantity_of_salt = $request->quantity_of_salt;
        $whiteCheese->final_quantity = $request->final_quantity;


        
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
    
            // Attach the created product ID to the whiteCheese
            $whiteCheese->product_id = $product->id;

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
            $whiteCheese->product_id = null;
        }
        
        $whiteCheese->save();

        // ====save the Ingredients
        $ingredient = Ingredient::first();
        $ingredient->quantity_of_milk = $ingredient->quantity_of_milk + ($request->quantity_of_milk ?? 0);
        $ingredient->quantity_of_cylinder_powder = $ingredient->quantity_of_cylinder_powder + ($request->quantity_of_cylinder_powder ?? 0);
        $ingredient->quantity_of_ACC_ghee = $ingredient->quantity_of_ACC_ghee + ($request->quantity_of_ACC_ghee ?? 0);
        $ingredient->quantity_of_starch =  $ingredient->quantity_of_starch + ($request->quantity_of_starch ?? 0);
        $ingredient->quantity_of_stabilizer =  $ingredient->quantity_of_stabilizer + ($request->quantity_of_stabilizer ?? 0);
        $ingredient->quantity_of_protin =  $ingredient->quantity_of_protin + ($request->quantity_of_protein ?? 0);
        $ingredient->quantity_of_calcium =  $ingredient->quantity_of_calcium + ($request->quantity_of_calcium ?? 0);
        $ingredient->quantity_of_water =  $ingredient->quantity_of_water + ($request->quantity_of_water ?? 0);
        $ingredient->quantity_of_salt =  $ingredient->quantity_of_salt + ($request->quantity_of_salt ?? 0);
        // Save the updated record.
        $ingredient->save();

        return Redirect::back()->with("success", __("Created"));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\WhiteCheese  $whiteCheese
     * @return \Illuminate\View\View
     */
    public function edit(WhiteCheese $whiteCheese): View
    {
         $cheeseCategory = Category::where('is_active', 1)->get();
        
        // Fetch the associated product, if it exists
        $product = $whiteCheese->product_id
        ? Product::find($whiteCheese->product_id)
        : null;
        
        // Handle case if 'mouneh' category is not found
        if (!$whiteCheese) {
            abort(404, 'Mouneh category not found.');
        }
        
        // Determine if 'Next Phase' should be checked
        $isNextPhaseChecked = $product ? true : false;
        $hasExistingProduct = $product ? true : false;

        $plasticBuckets = PlasticBucket::all();
        $plasticBucketStock = $product ? json_decode($product->plastic_bucket_stock, true) : null;
        
        return view("white_cheeses.edit", [
            'whiteCheese' => $whiteCheese,
            'cheeseCategory' => $cheeseCategory,
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
     * @param  \App\Http\Requests\WhiteCheeseRequest  $request
     * @param  \App\Models\WhiteCheese  $whiteCheese
     * @return \Illuminate\Http\RedirectResponse
     */
    public function update(WhiteCheeseRequest $request, WhiteCheese $whiteCheese): RedirectResponse
    {
        $old_whiteCheese = WhiteCheese::findOrFail($whiteCheese->id);

        // ====save the Ingredients
        $ingredient = Ingredient::first();
        $ingredient->quantity_of_milk = ($ingredient->quantity_of_milk - $old_whiteCheese->quantity_of_milk) + ($request->quantity_of_milk ?? 0);
        $ingredient->quantity_of_cylinder_powder = ($ingredient->quantity_of_cylinder_powder - $old_whiteCheese->quantity_of_cylinder_powder) + ($request->quantity_of_cylinder_powder ?? 0);
        $ingredient->quantity_of_ACC_ghee = ($ingredient->quantity_of_ACC_ghee - $old_whiteCheese->quantity_of_ACC_ghee) + ($request->quantity_of_ACC_ghee ?? 0);
        $ingredient->quantity_of_starch = ($ingredient->quantity_of_starch - $old_whiteCheese->quantity_of_starch) + ($request->quantity_of_starch ?? 0);
        $ingredient->quantity_of_stabilizer = ($ingredient->quantity_of_stabilizer - $old_whiteCheese->quantity_of_stabilizer) + ($request->quantity_of_stabilizer ?? 0);
        $ingredient->quantity_of_protin = ($ingredient->quantity_of_protin - $old_whiteCheese->quantity_of_protein) + ($request->quantity_of_protein ?? 0);
        $ingredient->quantity_of_calcium =  ($ingredient->quantity_of_calcium - $old_whiteCheese->quantity_of_calcium) + ($request->quantity_of_calcium ?? 0);
        $ingredient->quantity_of_water =  ($ingredient->quantity_of_water - $old_whiteCheese->quantity_of_water) + ($request->quantity_of_water ?? 0);
        $ingredient->quantity_of_salt =  ($ingredient->quantity_of_salt - $old_whiteCheese->quantity_of_salt) + ($request->quantity_of_salt ?? 0);
        // Save the updated record.
        $ingredient->save();
        // ============================

        $whiteCheese->type_of_cheese = $request->type_of_cheese;
        $whiteCheese->quantity_of_milk = $request->quantity_of_milk;
        $whiteCheese->quantity_of_cylinder_powder = $request->quantity_of_cylinder_powder;
        $whiteCheese->quantity_of_ACC_ghee = $request->quantity_of_ACC_ghee;
        $whiteCheese->quantity_of_starch = $request->quantity_of_starch;
        $whiteCheese->quantity_of_stabilizer = $request->quantity_of_stabilizer;
        $whiteCheese->quantity_of_protein = $request->quantity_of_protein;
        $whiteCheese->quantity_of_calcium = $request->quantity_of_calcium;
        $whiteCheese->quantity_of_water = $request->quantity_of_water;
        $whiteCheese->quantity_of_salt = $request->quantity_of_salt;
        $whiteCheese->final_quantity = $request->final_quantity;
        
        
         // Handle the product logic
        if ($whiteCheese->product_id) {
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

            $product = Product::find($whiteCheese->product_id);

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
            

            $whiteCheese->product_id = $product->id; // Store the new product ID

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
            $whiteCheese->product_id = null;
        }
        
        
        
        $whiteCheese->save();

        return back()->with('success', __('Updated'));
    }



    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\WhiteCheese  $whiteCheese
     * @return \Illuminate\Http\RedirectResponse
     */
   public function destroy(WhiteCheese $whiteCheese): RedirectResponse
   {
       // Delete the associated product if it exists
       if ($whiteCheese->product) {
           $whiteCheese->product->delete(); // Delete the related Product
       }
   
       // Delete the MounehIndustry record
       $whiteCheese->delete();
   
       return Redirect::back()->with("success", __("Deleted"));
   }
}
