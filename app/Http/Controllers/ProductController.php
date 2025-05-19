<?php

namespace App\Http\Controllers;

use App\Models\Product;
use App\Models\PlasticBucket;
use App\Models\GeneralRestriction;
use App\Models\Category;
use App\Models\Settings;
use Illuminate\View\View;
use App\Traits\Availability;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\RedirectResponse;
use Illuminate\Support\Facades\Redirect;
use App\Http\Resources\ProductSelectResourceCollection;

class ProductController extends Controller
{
    use Availability;

    public $data;

    /**
     * Show resources.
     *
     * @return \Illuminate\View\View
     */
    public function index(Request $request)
    {
        $hasExchangeRate = config('settings')->enableExchangeRateForItems;
        $exchangeRate = config('settings')->exchangeRate;
        $products = Product::all();
        $sum_cost = Product::sum('cost');
        $sum_unit_price = Product::sum('unit_price');
        $sum_box_price = Product::sum('box_price');

        $total_whole_cost = 0;
        $total_whole_unit_price = 0;
        $total_whole_box_price = 0;
        foreach ($products as $p) {
            $total_whole_cost += $p->cost * $p->in_stock;
            $total_whole_unit_price += $p->unit_price * $p->in_stock;
            $total_whole_box_price += $p->box_price * $p->in_stock / 10;
        }


        $this->data['categories'] = Category::orderBy('sort_order', 'ASC')->get();
        $this->data['total_cost'] = currency_format($sum_cost);
        $this->data['total_whole_cost'] = currency_format($total_whole_cost, $hasExchangeRate).' ('.currency_format($sum_cost).')';
        $this->data['total_unit_price'] = currency_format($sum_unit_price);
        $this->data['total_whole_unit_price'] = currency_format($total_whole_unit_price, $hasExchangeRate).' ('.currency_format($total_whole_unit_price).')';
        $this->data['total_box_price'] = currency_format($sum_box_price, $hasExchangeRate).' ('.currency_format($sum_box_price).')';
        $this->data['total_whole_box_price'] = currency_format($total_whole_box_price, $hasExchangeRate).' ('.currency_format($total_whole_box_price).')';
        $this->data['total_in_stock'] = Product::sum('in_stock');




        return view("products.index", $this->data);
    }


    /**
     * Show resources.
     *
     * @return \Illuminate\View\View
     */
    public function create(): View
    {
        $plasticBuckets = PlasticBucket::all();
        return view("products.create", [
            'categories' => Category::orderBy('sort_order', 'ASC')->get(),
            'plasticBuckets' => $plasticBuckets
        ]);
    }
    /**
     * Show resources.
     *
     * @return \Illuminate\View\View
     */
    public function edit(Product $product): View
    {
        $plasticBuckets = PlasticBucket::all();
        $plasticBucketStock = json_decode($product->plastic_bucket_stock, true);

        // dd($plasticBucketStock, $plasticBuckets);
        return view("products.edit", [
            'product' => $product,
            'categories' => Category::orderBy('sort_order', 'ASC')->get(),
            'plasticBuckets' => $plasticBuckets,
            'plasticBucketStock' => $plasticBucketStock
        ]);
    }
    /**
     * Delete resources.
     *
     * @return \Illuminate\Http\RedirectResponse
     */
    public function destroy(Product $product): RedirectResponse
    {
        // Update MounehIndustry records that are associated with this product
        $product->mounehIndustries()->update(['product_id' => null]);
        $product->cheeses()->update(['product_id' => null]);
    
        // Delete the product
        $product->delete();
    
        return Redirect::back()->with("success", __("Deleted"));
    }
    /**
     * Delete resources.
     *
     * @return \Illuminate\Http\RedirectResponse
     */
    public function imageDestroy(Product $product): RedirectResponse
    {
        $product->deleteImage();
        return Redirect::back()->with("success", __("Image Removed"));
    }

    /**
     * Show resources.
     *
     * @return \Illuminate\Http\RedirectResponse
     */
    public function store(Request $request): RedirectResponse
    {
        $request->validate([
            'name' => ['required', 'string', 'max:100'],
            // 'sale_price' => ['nullable', 'numeric', 'min:0'],
            'wholesale_price' => ['nullable', 'numeric', 'min:0'],
            // 'retailsale_price' => ['nullable', 'numeric', 'min:0'],
            'box_price' => ['nullable', 'numeric', 'min:0'],
            'unit_price' => ['nullable', 'numeric', 'min:0'],
            // 'price_per_gram' => ['nullable', 'numeric', 'min:0'],
            // 'price_per_kilogram' => ['nullable', 'numeric', 'min:0'],
            'cost' => ['nullable', 'numeric', 'min:0'],
            'sort_order' => ['nullable', 'numeric', 'min:0'],
            'image' => ['nullable', 'mimes:jpeg,jpg,png', 'max:2024'],
            'description' => ['nullable', 'string', 'max:2000'],
            // 'barcode' => ['nullable', 'string', 'max:43'],
            // 'wholesale_barcode' => ['nullable', 'string', 'max:43'],
            // 'retail_barcode' => ['nullable', 'string', 'max:43'],
            'box_barcode' => ['nullable', 'string', 'max:43'],
            'unit_barcode' => ['nullable', 'string', 'max:43'],
            'superdealer_barcode' => ['nullable', 'string', 'max:43'],
            'wholesale_barcode' => ['nullable', 'string', 'max:43'],
            // 'pricepergram_barcode' => ['nullable', 'string', 'max:43'],
            // 'priceperkilogram_barcode' => ['nullable', 'string', 'max:43'],
            // 'sku' => ['nullable', 'string', 'max:64'],
            // 'wholesale_sku' => ['nullable', 'string', 'max:64'],
            // 'retail_sku' => ['nullable', 'string', 'max:64'],
            'box_sku' => ['nullable', 'string', 'max:64'],
            'unit_sku' => ['nullable', 'string', 'max:64'],
            'superdealer_sku' => ['nullable', 'string', 'max:64'],
            'wholesale_sku' => ['nullable', 'string', 'max:64'],
            // 'pricepergram_sku' => ['nullable', 'string', 'max:64'],
            // 'priceperkilogram_sku' => ['nullable', 'string', 'max:64'],
            'status' => ['required', 'string'],
            'in_stock' => ['required', 'numeric'],

            'plastic_bucket_stock'   => ['required','array'],
            'plastic_bucket_stock.*' => ['nullable','numeric','min:0'],

            'minimum_stock' => ['required', 'numeric', 'min:0'],
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
            'main_category' => ['nullable', 'string']
        ]);

        // $wholesale_price = 0;
        // $retailsale_price = 0;
        // if($request->wholesale_price === null && $request->retailsale_price !== null) {$wholesale_price = $request->retailsale_price * 10;$retailsale_price = $request->retailsale_price;}
        // else if($request->wholesale_price !== null && $request->retailsale_price === null) {$retailsale_price = $request->wholesale_price / 10;$wholesale_price = $request->wholesale_price;}
        // else if($request->wholesale_price !== null && $request->retailsale_price !== null) {$wholesale_price = $request->wholesale_price;$retailsale_price = $request->retailsale_price;}
        $newBucketStocks = $request->plastic_bucket_stock;
        $box_price = 0;
        $unit_price = 0;
        if($request->box_price === null && $request->unit_price !== null) {$box_price = $request->unit_price * $request->count_per_box ;$unit_price = $request->unit_price;}
        else if($request->box_price !== null && $request->unit_price === null) {$unit_price = $request->box_price / $request->count_per_box ;$box_price = $request->box_price;}
        else if($request->box_price !== null && $request->unit_price !== null) {$box_price = $request->box_price;$unit_price = $request->unit_price;}


        $request->plastic_bucket_stock = json_encode($request->plastic_bucket_stock);
        $product = Product::create([
            'name' => $request->name,
            'sort_order' => $request->sort_order ?? 1,
            'is_active' => $this->isAvailable($request->status),
            // 'sale_price' => $request->sale_price ?? 0,
            'wholesale_price' => $request->wholesale_price ?? 0,
            // 'retailsale_price' => $retailsale_price ?? 0,
            'box_price' => $box_price ?? 0,
            'unit_price' => $unit_price ?? 0,
            'cost' => $request->cost ?? 0,
            'description' => $request->description,
            // 'barcode' => $request->barcode,
            // 'wholesale_barcode' => $request->wholesale_barcode,
            // 'retail_barcode' => $request->retail_barcode,
            'box_barcode' => $request->box_barcode,
            'unit_barcode' => $request->unit_barcode,
            'superdealer_barcode' => $request->superdealer_barcode,
            'wholesale_barcode' => $request->wholesale_barcode,
            // 'pricepergram_barcode' => $request->pricepergram_barcode,
            // 'priceperkilogram_barcode' => $request->priceperkilogram_barcode,
            // 'sku' => $request->sku,
            // 'wholesale_sku' => $request->wholesale_sku,
            // 'retail_sku' => $request->retail_sku,
            'box_sku' => $request->box_sku,
            'unit_sku' => $request->unit_sku,
            'superdealer_sku' => $request->superdealer_sku,
            'wholesale_sku' => $request->wholesale_sku,
            // 'pricepergram_sku' => $request->pricepergram_sku,
            // 'priceperkilogram_sku' => $request->priceperkilogram_sku,
            // 'price_per_kilogram'=>$request->price_per_kilogram ?? 0.0,
            // 'price_per_gram'=>$request->price_per_gram ?? 0.0,
            'category_id' => $request->category,
            'in_stock' => $request->in_stock ?? 0,
            'plastic_bucket_stock' => $request->plastic_bucket_stock,
            'minimum_stock' => $request->minimum_stock ?? 0,
            'packet_type_1kg' => $request->packet_type_1kg ?? 0,
            'packet_type_2kg' => $request->packet_type_2kg ?? 0,
            'packet_type_5kg' => $request->packet_type_5kg ?? 0,
            'track_stock' => $request->has('track_stock'),
            'continue_selling_when_out_of_stock' => $request->has('continue_selling_when_out_of_stock'),
            'count_per_box' => $request->count_per_box ?? 10,
            'expiry_date' => $request->expiry_date,
            'cost_unit' => $request->cost_unit,
            'box_unit' => $request->box_unit,
            'weight' => $request->weight,
            'main_category' => $request->main_category
        ]);

        if ($request->has('image')) {
            $product->updateImage($request->image);
        }

        
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
        

        return Redirect::back()->with("success", __("Created"));
    }

    /**
     * update resources.
     *
     * @return \Illuminate\Http\RedirectResponse
     */
    public function update(Request $request, Product $product): RedirectResponse
    {

        $request->validate([
            'name' => ['required', 'string', 'max:100'],
            // 'sale_price' => ['nullable', 'numeric', 'min:0'],
            'wholesale_price' => ['nullable', 'numeric', 'min:0'],
            // 'retailsale_price' => ['nullable', 'numeric', 'min:0'],
            'box_price' => ['nullable', 'numeric', 'min:0'],
            'unit_price' => ['nullable', 'numeric', 'min:0'],
            // 'price_per_gram' => ['nullable', 'numeric', 'min:0'],
            // 'price_per_kilogram' => ['nullable', 'numeric', 'min:0'],
            'cost' => ['nullable', 'numeric', 'min:0'],
            'sort_order' => ['nullable', 'numeric', 'min:0'],
            'image' => ['nullable', 'mimes:jpeg,jpg,png', 'max:2024'],
            'description' => ['nullable', 'string', 'max:2000'],
            // 'barcode' => ['nullable', 'string', 'max:43'],
            // 'wholesale_barcode' => ['nullable', 'string', 'max:43'],
            // 'retail_barcode' => ['nullable', 'string', 'max:43'],
            'box_barcode' => ['nullable', 'string', 'max:43'],
            'unit_barcode' => ['nullable', 'string', 'max:43'],
            'superdealer_barcode' => ['nullable', 'string', 'max:43'],
            'wholesale_barcode' => ['nullable', 'string', 'max:43'],
            // 'pricepergram_barcode' => ['nullable', 'string', 'max:43'],
            // 'priceperkilogram_barcode' => ['nullable', 'string', 'max:43'],
            // 'sku' => ['nullable', 'string', 'max:64'],
            // 'wholesale_sku' => ['nullable', 'string', 'max:64'],
            // 'retail_sku' => ['nullable', 'string', 'max:64'],
            'box_sku' => ['nullable', 'string', 'max:64'],
            'unit_sku' => ['nullable', 'string', 'max:64'],
            'superdealer_sku' => ['nullable', 'string', 'max:64'],
            'wholesale_sku' => ['nullable', 'string', 'max:64'],
            'pricepergram_sku' => ['nullable', 'string', 'max:64'],
            'priceperkilogram_sku' => ['nullable', 'string', 'max:64'],
            'status' => ['required', 'string'],
            'in_stock' => ['required', 'numeric'],

            'plastic_bucket_stock'   => ['required','array'],
            'plastic_bucket_stock.*' => ['nullable','numeric','min:0'],


            'minimum_stock' => ['required', 'numeric', 'min:0'],
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
            'main_category' => ['nullable', 'string'],
        ]);


        // Decode the old plastic bucket stock from the product record.
        $oldPlasticBucketStock = json_decode($product->plastic_bucket_stock, true) ?? [];

        // Get the new plastic bucket stock from the request.
        $newPlasticBucketStock = $request->input('plastic_bucket_stock');

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


        // $wholesale_price = 0;
        // $retailsale_price = 0;
        // if($request->wholesale_price === null && $request->retailsale_price !== null) {$wholesale_price = $request->retailsale_price * 20;$retailsale_price = $request->retailsale_price;}
        // else if($request->wholesale_price !== null && $request->retailsale_price === null) {$retailsale_price = $request->wholesale_price / 20;$wholesale_price = $request->wholesale_price;}
        // else if($request->wholesale_price !== null && $request->retailsale_price !== null) {$wholesale_price = $request->wholesale_price;$retailsale_price = $request->retailsale_price;}
        
        $box_price = 0;
        $unit_price = 0;
        if($request->box_price === null && $request->unit_price !== null) {$box_price = $request->unit_price * $request->count_per_box; $unit_price = $request->unit_price;}
        else if($request->box_price !== null && $request->unit_price === null) {$unit_price = $request->box_price / $request->count_per_box; $box_price = $request->box_price;}
        else if($request->box_price !== null && $request->unit_price !== null) {$box_price = $request->box_price;$unit_price = $request->unit_price;}

        $request->plastic_bucket_stock = json_encode($request->plastic_bucket_stock);
        $product->update([
            'name' => $request->name,
            'sort_order' => $request->sort_order ?? 1,
            'is_active' => $this->isAvailable($request->status),
            // 'sale_price' => $request->sale_price ?? 0,
            'wholesale_price' => $request->wholesale_price ?? 0,
            // 'retailsale_price' => $request->retailsale_price ?? 0,
            'box_price' => $request->box_price ?? 0,
            'unit_price' => $request->unit_price ?? 0,
            'cost' => $request->cost ?? 0,
            'description' => $request->description,
            // 'barcode' => $request->barcode,
            // 'wholesale_barcode' => $request->wholesale_barcode,
            // 'retail_barcode' => $request->retail_barcode,
            'box_barcode' => $request->box_barcode,
            'unit_barcode' => $request->unit_barcode,
            'superdealer_barcode' => $request->superdealer_barcode,
            'wholesale_barcode' => $request->wholesale_barcode,
            // 'pricepergram_barcode' => $request->pricepergram_barcode,
            // 'priceperkilogram_barcode' => $request->priceperkilogram_barcode,
            // 'sku' => $request->sku,
            // 'wholesale_sku' => $request->wholesale_sku,
            // 'retail_sku' => $request->retail_sku,
            'box_sku' => $request->box_sku,
            'unit_sku' => $request->unit_sku,
            'superdealer_sku' => $request->superdealer_sku,
            'wholesale_sku' => $request->wholesale_sku,
            // 'pricepergram_sku' => $request->pricepergram_sku,
            // 'priceperkilogram_sku' => $request->priceperkilogram_sku,
            // 'price_per_kilogram'=>$request->price_per_kilogram ?? 0.0,
            // 'price_per_gram'=>$request->price_per_gram ?? 0.0,
            'category_id' => $request->category,
            'in_stock' => $request->in_stock ?? 0,
            'plastic_bucket_stock' => $request->plastic_bucket_stock,
            'minimum_stock' => $request->minimum_stock ?? 0,
            'packet_type_1kg' => $request->packet_type_1kg ?? 0,
            'packet_type_2kg' => $request->packet_type_2kg ?? 0,
            'packet_type_5kg' => $request->packet_type_5kg ?? 0,
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
            'main_category' => $request->main_category
        ]);
        if ($request->has('image')) {
            $product->updateImage($request->image);
        }

        
        return Redirect::back()->with("success", __("Updated"));
    }


    public function search(Request $request)
    {
        $query = trim($request->get('query'));
        if (is_null($query)) {
            return $this->jsonResponse(['data' => []]);
        }
        $products = Product::search($query)->latest()->take(10)->get();
        return $this->jsonResponse(['data' => new ProductSelectResourceCollection($products)]);
    }
}