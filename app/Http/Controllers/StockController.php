<?php

namespace App\Http\Controllers;

use App\Models\Product;
use App\Models\PlasticBucket;
use App\Models\GeneralRestriction;
use App\Models\Ingredient;
use App\Models\Purchase;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redirect;
use Illuminate\View\View;
use Illuminate\Support\Facades\DB;

class StockController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(): view
    {
        return view('stocks.index');
    }
    
    public function plastic(): view
    {
        $plsticBuckets = PlasticBucket::all();
        return view('stocks.plastic', [
            'plsticBuckets' => $plsticBuckets,
        ]);
    }
    
    
    public function general(): view
    {

        $warehouse = GeneralRestriction::where('sub_category_name', 'warehouse')->get();
        $coolingRooms = GeneralRestriction::where('sub_category_name', 'coolingRooms')->get();

        $cars = DB::table('cars')
            ->join('products', 'cars.product_id', '=', 'products.id')
            ->select('cars.*', 'products.name as product_name')
            ->orderBy('created_at', 'desc')->paginate(20);


        return view('stocks.general', [
            'warehouse' => $warehouse,
            'coolingRooms' => $coolingRooms,
            'cars' => $cars,
        ]);
    }

    public function ingredients(): view
    {
        $ingredient = Ingredient::first();

        return view('stocks.ingredient', [
            'ingredient' => $ingredient,
        ]);
    }

    public function items(): view
    {
        $products = Product::all();
        return view('stocks.items', [
            'products' => $products,
        ]);
    }

    // salesman stock
    public function salesman(): view
    {
        $salesman = DB::table('salesmen')
            ->select('salesmen.*')
            ->orderBy('created_at', 'desc')->paginate(20);

        return view('stocks.salesman', [
            'salesman' => $salesman,
        ]);
    }

    // purchase stock
    public function purchase(Request $request): view
    {
        $purchases = Purchase::search(trim($request->search_query))->with(['supplier' => function($query) use ($request) {
            $query->where('name',  'LIKE', "%{$request->supplier_name}%");
        }])
            ->where('date',  'LIKE', "%{$request->date}%")
            ->where('number',  'LIKE', "%{$request->purchase_number}%")
            ->orderBy('date', 'DESC')->paginate(20);

        return view('stocks.purchase', [
            'purchases' => $purchases,
        ]);
    }
}
