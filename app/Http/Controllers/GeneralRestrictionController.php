<?php

namespace App\Http\Controllers;

use App\Models\Category;
use App\Models\Product;
use App\Models\GeneralRestriction;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redirect;
use Illuminate\View\View;


class GeneralRestrictionController extends Controller
{
    public function index(Request $request): View
    {

        return view("general_restrictions.index");
    }


    public function warehouse(Request $request): View
    {
        $categories = [
            [
                'category_id' => 'c734f5c4-f620-4ae0-b34a-447cb3a1b9a5',
                'category_name' => 'بلاستكيات'
            ],
            [
                'category_id' => '458ab8f7-e6e1-4f2e-97ad-7c9a38642912',
                'category_name' => 'مواد الاولية'
            ]
        ];

        return view("general_restrictions.warehouse", ['categories'=>$categories]);
    }

    public function coolingRooms(Request $request): View
    {
        $categories = [
            [
                'category_id' => '4ddde221-9c9f-4e35-86a4-e169b499b34d',
                'category_name' => 'مواد المنتجة'
            ]
        ];

        return view("general_restrictions.coolingRooms", ['categories'=>$categories]);
    }



    // === with Ids
    public function whereHouseCheese(Request $request): View
    {
        $sub_category = "warehouse";
        $category = Category::find($request->id);

        $generalRestrictions = GeneralRestriction::where('sub_category_name', $sub_category)->where('category_id', $request->id)->get();

        return view("general_restrictions.w_cheese",['generalRestrictions' => $generalRestrictions, 'category' =>  $category]);
    }
    public function coolingRoomsCheese(Request $request): View
    {
        $sub_category = "coolingRooms";
        $category = Category::find($request->id);

        $generalRestrictions = GeneralRestriction::where('sub_category_name', $sub_category)->where('category_id', $request->id)->get();

        return view("general_restrictions.c_cheese",['generalRestrictions' => $generalRestrictions, 'category' =>  $category]);
    }


    // ----- Create Form for warehouse
    public function wcreate(Request $request): View
    {
        $category = Category::find($request->id);
        $main_category = 'warehouse';
        $products = Product::where('category_id', $request->id)
        ->get();

        return view("general_restrictions.w_create",['category'=>$category, 'main_category'=>$main_category, 'products' => $products]);
    } 


    // ------ Create Form for coolong rooms
    public function ccreate(Request $request): View
    {
        $category = Category::find($request->id);
        $main_category = 'coolingRooms';
        $products = Product::where('category_id', $request->id)
        ->get();

        return view("general_restrictions.c_create",['category'=>$category, 'main_category'=>$main_category, 'products' => $products]);
    } 




    public function wedit(GeneralRestriction $generalRestriction): View
    {
        $category = Category::find($generalRestriction->category_id);
        $main_category = $generalRestriction->sub_category_name;

        $products = Product::where('category_id', $generalRestriction->category_id)->get();
        $product = Product::where('id', $generalRestriction->product_id)->first();


        return view("general_restrictions.w_edit",['generalRestriction' => $generalRestriction, 'category'=>$category, 'main_category'=>$main_category, 'product' => $product, 'products' => $products]);
    } 


    // ==== store both warehouse and cooling rooms 
    public function w_store(Request $request): RedirectResponse
    {
        $request->validate([
            'id'    => 'required|string', // -- product id
            'in_stock' => 'required|string',
            'cost' => 'required|string'
        ]);

        $product = Product::find($request->id);
        $product->update([
            'category_id' => $request->category_id,
            'in_stock' => $request->in_stock,
            'cost' => $request->cost,
            'main_category' => $request->main_category
        ]);


        $generalRestriction = new GeneralRestriction();
        $generalRestriction->sub_category_name = $request->main_category;
        $generalRestriction->category_id = $request->category_id;
        $generalRestriction->product_id = $product->id;
        $generalRestriction->product_name = $product->name;
        $generalRestriction->gr_stock = $request->in_stock;
        $generalRestriction->gr_price = $request->cost;
        $generalRestriction->save();

        return Redirect::back()->with("success", __("Created"));
    }


    // ==== Removing both warehouse and cooling rooms 
    public function wdestroy(Product $product): RedirectResponse
    {
        $product = Product::find($product->id);
        $product->update([
            'main_category' => ""
        ]);
    
        return Redirect::back()->with("success", __("Deleted"));
    }

    
    // ==== Updating both warehouse and cooling rooms 
    public function update(Request $request, GeneralRestriction $generalRestriction): RedirectResponse
    {
        $request->validate([
            'id'    => 'required|string', // -- product id
            'in_stock' => 'required|string',
            'cost' => 'required|string'
        ]);

        $product = Product::find($request->id);
        $product->update([
            'category_id' => $request->category_id,
            'in_stock' => $request->in_stock,
            'cost' => $request->cost,
            'main_category' => $request->main_category
        ]);

        $generalRestriction->category_id = $request->category_id;
        $generalRestriction->product_id = $product->id;
        $generalRestriction->product_name = $product->name;
        $generalRestriction->gr_stock = $request->in_stock;
        $generalRestriction->gr_price = $request->cost;
        $generalRestriction->save();


        return Redirect::back()->with("success", __("Updated"));
    }
    
}
