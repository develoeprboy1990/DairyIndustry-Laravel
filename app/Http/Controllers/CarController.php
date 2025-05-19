<?php

namespace App\Http\Controllers;


use App\Models\Car;
use App\Models\Category;
use App\Models\Product;
use App\Models\GeneralRestriction;
use App\Models\CarDetail;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redirect;
use App\Http\Requests\CarRequest;
use Illuminate\View\View;
use Illuminate\Support\Facades\DB;

class CarController extends Controller
{
    /**
     * Show resources.
     * 
     * @return \Illuminate\View\View
     */
    public function index(Request $request): View
    {
        // $cars = Car::search($request->search_query)->orderBy('created_at', 'desc')->paginate(20);
        $cars = Car::orderBy('created_at', 'desc')->paginate(20);
            // dd($cars);

        return view('cars.index', [
            'cars' => $cars
        ]);
    }

    /**
     * Show resources.
     * 
     * @return \Illuminate\View\View
     */
    public function create(): View
    {
        $cat_coolingRoom = ['4ddde221-9c9f-4e35-86a4-e169b499b34d'];
        $cat_warehouse = ['c734f5c4-f620-4ae0-b34a-447cb3a1b9a5'];

        $coolingRoomProducts = DB::table('general_restrictions')
            ->where('category_id', $cat_coolingRoom)
            ->select('*')
            ->get();

        $cat_warehouseProducts = DB::table('general_restrictions')
            ->where('category_id', $cat_warehouse)
            ->select('*')
            ->get();


        $categories = Category::where('is_active', 1)->get();
        return view("cars.create",[
            'categories' => $categories,
            'coolingRoomProducts' => $coolingRoomProducts,
            'cat_warehouseProducts' => $cat_warehouseProducts
        ]);
    }

    /**
     * Show resources.
     * 
     * @return \Illuminate\View\View
     */
    public function show(Request $request, Car $car)
    {
        // $carDetails = CarDetail::where('car_id', $car->id)->get();

        $carDetails = CarDetail::where('car_id', $car->id)
            ->join('products', 'car_details.product_id', '=', 'products.id')
            ->select('car_details.*', 'products.name') // select columns as needed
            ->get();


        return view('cars.show', [
            'car' => $car,
            'carDetails' => $carDetails
        ]);
    }



    /**
     * Show resources.
     * 
     * @return \Illuminate\View\View
     */
    public function edit(Car $car): View
    {
        $cat_coolingRoom = ['4ddde221-9c9f-4e35-86a4-e169b499b34d'];
        $cat_warehouse = ['c734f5c4-f620-4ae0-b34a-447cb3a1b9a5'];

        $coolingRoomProducts = DB::table('products')
            ->where('category_id', $cat_coolingRoom)
            ->select('*')
            ->get();

        $cat_warehouseProducts = DB::table('products')
            ->where('category_id', $cat_warehouse)
            ->select('*')
            ->get();

        $carDetails = CarDetail::where('car_id', $car->id)->get();


        $categories = Category::where('is_active', 1)->get();
        return view("cars.edit", [
            'car' => $car,
            'carDetails' => $carDetails,
            'categories' => $categories,
            'coolingRoomProducts' => $coolingRoomProducts,
            'cat_warehouseProducts' => $cat_warehouseProducts
        ]);
    }
    /**
     * Delete resources.
     * 
     * @return \Illuminate\Http\RedirectResponse
     */
    public function destroy(Car $car): RedirectResponse
    {
        $car->delete();
        return Redirect::back()->with("success", __("Deleted"));
    }

    /**
     * Show resources.
     * 
     * @return \Illuminate\Http\RedirectResponse
     */
    public function store(CarRequest $request): RedirectResponse
    {
        $car = new Car();
        $car->car_type = $request->car_type;
        $car->car_name = $request->car_name;
        $car->car_driver_name = $request->car_driver_name;
        $car->car_driver_phone = $request->car_driver_phone;

        // $car->product_id = $request->product_id;
        // $car->product_stock = $request->product_stock;
        $car->stock_date = $request->stock_date;
        $car->save();

        $items = $request->item;
        if (!$items) {
            return back()->with('error', __('No item selected'));
        }

        $quantities = $request->quantity;
        for ($count = 0; $count < count($items); $count++) {
            $item = Product::find($items[$count]);
            if (!$item) return back()->with('error', __('Item Not Found'));

            $item->in_stock += $quantities[$count];
            $item->save();

            $general_restriction = GeneralRestriction::where('product_id', $item->id)->first();
            if($general_restriction) {
                $general_restriction->gr_stock +=  $quantities[$count];
                $general_restriction->save();
            }

            $carDetails = new CarDetail();
            $carDetails->car_id = $car->id;
            $carDetails->product_id = $item->id;
            $carDetails->stock = $quantities[$count];
            $carDetails->save();
        }


        return Redirect::back()->with("success", __("Created"));
    }

    /**
     * update resources.
     * 
     * @return \Illuminate\Http\RedirectResponse
     */
    public function update(CarRequest $request, Car $car): RedirectResponse
    {
        $car->car_type = $request->car_type;
        $car->car_name = $request->car_name;
        $car->car_driver_name = $request->car_driver_name;
        $car->car_driver_phone = $request->car_driver_phone;
        // $car->product_id = $request->product_id;
        // $car->product_stock = $request->product_stock;
        $car->stock_date = $request->stock_date;
        $car->save();


        $items = $request->item;
        if (!$items) {
            return back()->with('error', __('No item selected'));
        }
        $quantities = $request->quantity;
        for ($count = 0; $count < count($items); $count++) {
            $item = Product::find($items[$count]);
            if (!$item) return back()->with('error', __('Item Not Found'));

            
            $carDetail = CarDetail::where('car_id', $car->id)
                ->where('product_id', $item->id)
                ->first();

            $item->in_stock = ($item->in_stock - $carDetail->stock) + $quantities[$count];
            $item->save();

            $general_restriction = GeneralRestriction::where('product_id', $item->id)->first();
            if($general_restriction) {
                $general_restriction->gr_stock = ($general_restriction->gr_stock - $carDetail->stock) + $quantities[$count];
                $general_restriction->save();
            }

            $carDetail->stock = $quantities[$count];
            $carDetail->save();
        }

        return Redirect::back()->with("success", __("Updated"));
    }
}
