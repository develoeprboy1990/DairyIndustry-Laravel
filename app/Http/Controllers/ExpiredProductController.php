<?php

namespace App\Http\Controllers;

use App\Models\ExpiredProduct;
use App\Models\Product;
use App\Models\Category;
use App\Models\Settings;
use Illuminate\View\View;
use App\Traits\Availability;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\RedirectResponse;
use Illuminate\Support\Facades\Redirect;
use App\Http\Resources\ProductSelectResourceCollection;


use Illuminate\Http\Request;

class ExpiredProductController extends Controller
{
    // Display the list of expired products
    public function index()
    {
        // Fetch total count of expired items for display
        $total_expired_items = ExpiredProduct::where('reproduce', 0)->count();
        // Return the view with the total count
        return view('expired-products.index', compact('total_expired_items'));
    }

    // Display the list of expired products
    public function reproduceForm($id)
    {
        // Fetch the expired product by ID
        $expiredProduct = ExpiredProduct::findOrFail($id);

        // Fetch the product linked to this expired product
        $product = $expiredProduct->product;

        $categories = Category::orderBy('sort_order', 'ASC')->get();

        return view('expired-products.reproduce', compact('expiredProduct', 'product', 'categories'));
    }

    // Display the list of expired products
    public function trash($id)
    {
        try {
            // Begin a transaction
            DB::beginTransaction();

            // Find the expired product entry
            $expiredProduct = ExpiredProduct::findOrFail($id);

            // Validate and update the original product
            $product = Product::find($expiredProduct->product_id);
            if ($product) {
                $product->update([
                    'expired_stock' => 0,                    // Set stock to 0
                    'expired_product_id' => null,    // Remove the expired product reference
                    'expired' => false               // Mark as not expired
                ]);
            } else {
                // Handle the case where the product doesn't exist
                return Redirect::back()->withErrors(__("Associated product not found."));
            }

            // Delete the expired product entry
            $expiredProduct->delete();

            // Commit the transaction
            DB::commit();

            return Redirect::back()->with("success", __("Deleted successfully."));
        } catch (\Exception $e) {
            // Rollback the transaction on error
            DB::rollBack();

            // Log the error for debugging
            Log::error("Error in trashing expired product: ", ['error' => $e->getMessage()]);

            return Redirect::back()->withErrors(__("An error occurred. Please try again."));
        }
    }

    public function reproduce(Request $request): RedirectResponse
    {
        $request->validate([
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
            'in_stock' => ['required', 'numeric'],
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
            'conversion_amount' => ['nullable', 'numeric', 'min:0'],



        ]);


        $box_price = 0;
        $unit_price = 0;
        if ($request->box_price === null && $request->unit_price !== null) {
            $box_price = $request->unit_price * $request->count_per_box;
            $unit_price = $request->unit_price;
        } else if ($request->box_price !== null && $request->unit_price === null) {
            $unit_price = $request->box_price / $request->count_per_box;
            $box_price = $request->box_price;
        } else if ($request->box_price !== null && $request->unit_price !== null) {
            $box_price = $request->box_price;
            $unit_price = $request->unit_price;
        }

        $old_product_id = $request->old_product_id;
        $expired_product_id = $request->expired_product_id;

        $product = Product::create([
            'name' => $request->name,
            'sort_order' => $request->sort_order ?? 1,
            'is_active' => $request->status,

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
            'expired_product_id' => $request->expired_product_id,
        ]);

        // echo($request->retailsale_price);

        if ($request->has('image')) {
            $product->updateImage($request->image);
        }


        $OldProduct = Product::findOrFail($old_product_id);

        if ($OldProduct) {
            $OldProduct->update([
                'expired_stock' => 0,
                'expired' => false
            ]);
        } else {
            // Handle the case where the product doesn't exist
            return Redirect::back()->withErrors(__("Associated old product not found."));
        }

        $expiredProduct = ExpiredProduct::findOrFail($expired_product_id);
        if ($expiredProduct) {
            $expiredProduct->update([
                'conversion_rate' => $request->conversion_amount,
                'reproduce' => true
            ]);
        } else {
            // Handle the case where the product doesn't exist
            return Redirect::back()->withErrors(__("Associated expired product not found."));
        }



        return redirect()->route('products.index')->with("success", __("Expired Products successfully reproduced"));
    }


    public function edit(ExpiredProduct $expiredProduct)
    {
        return view('expired-products.edit', compact('expiredProduct'));
    }
    public function update(Request $request, ExpiredProduct $expiredProduct)
    {
        $request->validate([
            'product_id' => 'nullable|string|max:36',
            'expired_stock' => 'required|numeric|min:0',
            'conversion_rate' => 'nullable|numeric|min:0',
            'expiry_date' => 'required|date',
            'trash' => 'boolean',
            'reproduce' => 'boolean',
        ]);

        $expiredProduct->update($request->all());

        return redirect()->route('expired-products.index')->with('success', 'Expired product updated successfully.');
    }

    public function destroy(ExpiredProduct $expiredProduct)
    {
        $expiredProduct->delete();
        return redirect()->route('expired-products.index')->with('success', 'Expired product deleted successfully.');
    }
}
