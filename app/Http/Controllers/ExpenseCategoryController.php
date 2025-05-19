<?php

namespace App\Http\Controllers;

use App\Models\ExpenseCategory;
use App\Traits\Availability;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redirect;
use Illuminate\View\View;

class ExpenseCategoryController extends Controller
{
    use Availability;

    /**
     * Show resources.
     * 
     * @return \Illuminate\View\View
     */
    public function index(Request $request): View
    {
        return view("expense_categories.index");
    }

    /**
     * Show resources.
     * 
     * @return \Illuminate\View\View
     */
    public function products(Request $request, ExpenseCategory $expenseCategory): View
    {
        $products = $expenseCategory->products()->search($request->search_query)->latest()->paginate(20);

        return view("expense_categories.products", [
            'expenseCategory' => $expenseCategory,
            'products' => $products,
        ]);
    }

    /**
     * Show resources.
     * 
     * @return \Illuminate\View\View
     */
    public function create(): View
    {
        return view("expense_categories.create");
    }

    /**
     * Show resources.
     * 
     * @return \Illuminate\View\View
     */
    public function edit(ExpenseCategory $expenseCategory): View
    {
        return view("expense_categories.edit", [
            'expenseCategory' => $expenseCategory
        ]);
    }

    /**
     * Delete resources.
     * 
     * @return \Illuminate\Http\RedirectResponse
     */
    public function destroy(ExpenseCategory $expenseCategory): RedirectResponse
    {
        $expenseCategory->delete();
        return Redirect::back()->with("success", __("Deleted"));
    }

    /**
     * Delete resources.
     * 
     * @return \Illuminate\Http\RedirectResponse
     */
    public function imageDestroy(ExpenseCategory $expenseCategory): RedirectResponse
    {
        $expenseCategory->deleteImage();
        return Redirect::back()->with("success", __("Image Removed"));
    }

    /**
     * Store resources.
     * 
     * @return \Illuminate\Http\RedirectResponse
     */
    public function store(Request $request): RedirectResponse
    {
        $request->validate([
            'name' => ['required', 'string', 'max:100'],
            'sort_order' => ['nullable', 'integer', 'min:0'],
            'image' => ['nullable', 'mimes:jpeg,jpg,png', 'max:2024'],
            'status' => ['required', 'string'],
        ]);

        $expenseCategory = ExpenseCategory::create([
            'name' => $request->name,
            'sort_order' => $request->sort_order ?? 1,
            'is_active' => $request->status,
        ]);

        if ($request->has('image')) {
            $expenseCategory->updateImage($request->image);
        }
        return Redirect::back()->with("success", __("Created"));
    }

    /**
     * Update resources.
     * 
     * @return \Illuminate\Http\RedirectResponse
     */
    public function update(Request $request, ExpenseCategory $expenseCategory): RedirectResponse
    {
        $request->validate([
            'name' => ['required', 'string', 'max:100'],
            'sort_order' => ['required', 'numeric', 'min:0'],
            'image' => ['nullable', 'mimes:jpeg,jpg,png', 'max:2024'],
            'status' => ['required', 'string'],
        ]);

        $expenseCategory->update([
            'name' => $request->name,
            'sort_order' => $request->sort_order,
            'is_active' => $request->status,
        ]);

        if ($request->has('image')) {
            $expenseCategory->updateImage($request->image);
        }
        return Redirect::back()->with("success", __("Updated"));
    }
}
