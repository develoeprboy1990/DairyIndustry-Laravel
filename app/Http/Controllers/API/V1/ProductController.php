<?php

namespace App\Http\Controllers\API\V1;

use App\Http\Controllers\Controller;
use App\Models\Product;
use App\Models\ExpiredProduct;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ProductController extends Controller
{
    public function apiExpiredIndex(Request $request)
    {
        // Read value
        $draw = $request->get('draw');
        $start = $request->get("start");
        $length = $request->get("length"); // Rows display per page
    
        $order = $request->get('order');
        $columns = $request->get('columns');
        $search = $request->get('search');
    
        $columnIndex = $order[0]['column']; // Column index
        $columnName = $columns[$columnIndex]['data']; // Column name
        $columnSortOrder = $order[0]['dir']; // asc or desc
        $searchValue = $search['value']; // Search value
    
        // Determine column for ordering
        if (in_array($columnName, ['name', 'description'])) {
            $orderByColumn = 'products.' . $columnName;
        } elseif ($columnName === 'category') {
            $orderByColumn = 'categories.name';
        } else {
            $orderByColumn = 'expired_products.' . $columnName;
        }

    
        // Total records
        $totalRecords = ExpiredProduct::where('reproduce', 0)->count();
        
        // Filtered record count
        $iTotalDisplayRecords = ExpiredProduct::join('products', 'expired_products.product_id', '=', 'products.id')
            ->leftJoin('categories', 'products.category_id', '=', 'categories.id')
            ->where('expired_products.reproduce', 0) // Add this condition
            ->where(function ($query) use ($searchValue) {
                if (!empty($searchValue)) {
                    $query->where('products.name', 'LIKE', "%$searchValue%")
                          ->orWhere('products.description', 'LIKE', "%$searchValue%")
                          ->orWhere('categories.name', 'LIKE', "%$searchValue%");
                }
            })
            ->count();
        
        // Fetch records
        $records = ExpiredProduct::join('products', 'expired_products.product_id', '=', 'products.id')
            ->leftJoin('categories', 'products.category_id', '=', 'categories.id')
            ->where('expired_products.reproduce', 0) // Add this condition
            ->where(function ($query) use ($searchValue) {
                if (!empty($searchValue)) {
                    $query->where('products.name', 'LIKE', "%$searchValue%")
                          ->orWhere('products.description', 'LIKE', "%$searchValue%")
                          ->orWhere('categories.name', 'LIKE', "%$searchValue%");
                }
            })
            ->orderBy($orderByColumn, $columnSortOrder)
            ->skip($start)
            ->take($length)
            ->get([
                'expired_products.*',
                'products.id as product_id',
                'products.image_path',
                'products.name as product_name',
                'products.description as product_description',
                'products.cost',
                'products.unit_price',
                'products.track_stock',
                'products.in_stock',
                'products.cost_unit',
                'products.is_active',
                'categories.name as category_name',
            ]);
            
        // Format records for response
        $aaData = [];
        foreach ($records as $record) {
            $aaData[] = [
                "id" => $record->id,
                "product_id" => $record->product_id,
                "image" => $record->image_path,
                "name" => $record->product_name,
                "description" => $record->product_description,
                "category" => $record->category_name ?? 'N/A',
                "cost" => $record->cost,
                "unit_price" => $record->unit_price,
                "expiry_date" => $record->expiry_date,
                "is_active" => $record->is_active,
                "status" => $record->status,
                "status_badge_bg_color" => $record->status_badge_bg_color,
                "in_stock" => $record->track_stock ? $record->in_stock . ' ' . $record->cost_unit : 'N/A',
                "created_at" => $record->created_at,
            ];
        }
    
        $response = [
            "draw" => intval($draw),
            "iTotalRecords" => $totalRecords,
            "iTotalDisplayRecords" => $iTotalDisplayRecords,
            "aaData" => $aaData,
        ];
    
        return response()->json($response);
    }

    
    
    
    
    
    
    public function index(Request $request)
    {

        ## Read value
        $draw = $request->get('draw');
        $start = $request->get("start");
        $length = $request->get("length"); // Rows display per page

        $order = $request->get('order');
        $columns = $request->get('columns');
        $search = $request->get('search');
        //dd($request->get('category'));
        $columnIndex = $order[0]['column']; // Column index
        $columnName = $columns[$columnIndex]['data']; // Column name
        $columnSortOrder = $order[0]['dir']; // asc or desc
        $searchValue = $search['value']; // Search value

        $totalRecords = Product::select('count(*) as allcount')->count();   // Total records
        $iTotalDisplayRecords = Product::select('count(*) as allcount')->search($searchValue)->count();

        // Fetch records
        $records = Product::with('category')
                    ->search($searchValue)
                    ->orderBy('created_at', 'desc') // First, order by the most recent products
                    ->orderBy($columnName, $columnSortOrder) // Then, apply the previous orderBy condition
                    ->skip($start)
                    ->take($length)
                    ->get();


        $aaData = array();
        foreach ($records as $record) {
            $aaData[] = array(
                "id" => $record->id,
                "image" => $record->image_url,
                "name" => $record->full_name,
                'packet_type' => $record->packet_type,
                "description" => $record->description,
                "main_category" =>  $record->main_category,
                "category" => $record->category->name,
                "cost" => $record->table_view_cost,
                // "expiry_date" => Carbon::parse($record->expiry_date)->format($dateFormat),
                "expiry_date" => $record->expiry_date_view,
                "whole_cost" => $record->whole_cost,
                // "sale_price" => $record->table_view_price,
                // "retailsale_price" => $record->table_view_price,
                // "sales_price" => $record->table_sales_view_price,
                // "wholesale_price" => $record->table_wholesale_view_price,
                "unit_price" => $record->view_price,
                "wholeunit_price" => $record->view_wholeprice,
                "box_price" => $record->table_box_view_price,
                "wholebox_price" => $record->table_box_view_wholeprice,
                "wholesale_price" => $record->table_wholesale_view_price,
                // "price_per_gram" => $record->table_price_per_gram,
                // "price_per_kilogram" => $record->table_price_per_kilogram,
                // "price_per_kilogram" => $record->table_price_per_kilogram,
                "in_stock" => $record->track_stock ? $record->in_stock.' '.$record->cost_unit : 'N/A',
                "is_active" => $record->is_active,
                "status" => $record->status,
                "status_badge_bg_color" => $record->status_badge_bg_color,
                "created_at" => $record->created_at,
                
                "cost_plain" => $record->cost,
            );
        }

        $response = array(
            "draw" => intval($draw),
            "iTotalRecords" => $totalRecords,
            "iTotalDisplayRecords" => $iTotalDisplayRecords,
            "data" => $aaData
        );
        
        return response()->json($response);
    }
}