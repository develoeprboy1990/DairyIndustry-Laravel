<?php

namespace App\Http\Controllers\API\V1;

use App\Http\Controllers\Controller;
use App\Models\ExpenseCategory;
use Illuminate\Http\Request;

class ExpenseCategoryController extends Controller
{
    public function index(Request $request)
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

        // Total records count
        $totalRecords = ExpenseCategory::count();
        $iTotalDisplayRecords = ExpenseCategory::where(function ($query) use ($searchValue) {
            if ($searchValue) {
                $query->where('name', 'LIKE', "%$searchValue%")
                      ->orWhere('sort_order', 'LIKE', "%$searchValue%");
            }
        })->count();

        // Fetch records
        $records = ExpenseCategory::where(function ($query) use ($searchValue) {
            if ($searchValue) {
                $query->where('name', 'LIKE', "%$searchValue%")
                      ->orWhere('sort_order', 'LIKE', "%$searchValue%");
            }
        })
            ->orderBy($columnName == 'sort_order' ? 'sort_order' : $columnName, $columnSortOrder)
            ->skip($start)
            ->take($length)
            ->get();

        // Prepare data for response
        $aaData = [];
        foreach ($records as $record) {
            $aaData[] = [
                "id" => $record->id,
                "name" => $record->name,
                "sort_order" => $record->sort_order,
                "is_active" => $record->is_active,
                "status" => $record->status,
                "status_badge_bg_color" => $record->status_badge_bg_color,
                "created_at" => $record->created_at,
            ];
        }

        // Response structure
        $response = [
            "draw" => intval($draw),
            "iTotalRecords" => $totalRecords,
            "iTotalDisplayRecords" => $iTotalDisplayRecords,
            "aaData" => $aaData,
        ];

        return response()->json($response);
    }
}
