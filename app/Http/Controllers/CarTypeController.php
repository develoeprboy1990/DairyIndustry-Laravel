<?php

namespace App\Http\Controllers;

use App\Models\CarType;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redirect;
use Illuminate\View\View;

class CarTypeController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\View\View
     */
    public function index(Request $request): View
    {
        $carTypes = CarType::search($request->search_query)
                          ->orderBy('created_at', 'desc')
                          ->paginate(20);

        return view('car_types.index', [
            'carTypes' => $carTypes
        ]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\View\View
     */
    public function create(): View
    {
        return view('car_types.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\RedirectResponse
     */
    public function store(Request $request): RedirectResponse
    {
        $validatedData = $request->validate([
            'name' => ['required', 'string', 'max:255'],
            'plate_number' => ['required', 'string', 'max:20', 'unique:car_types,plate_number'],
            'model' => ['nullable', 'string', 'max:255'],
            'status' => ['required', 'in:available,unavailable'],
            'description' => ['nullable', 'string', 'max:1000'],
        ]);

        CarType::create($validatedData);

        return Redirect::route('car-types.index')->with('success', __('Car Type created successfully.'));
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\CarType  $carType
     * @return \Illuminate\View\View
     */
    public function show(CarType $carType): View
    {
        return view('car_types.show', [
            'carType' => $carType
        ]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\CarType  $carType
     * @return \Illuminate\View\View
     */
    public function edit(CarType $carType): View
    {
        return view('car_types.edit', [
            'carType' => $carType
        ]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\CarType  $carType
     * @return \Illuminate\Http\RedirectResponse
     */
    public function update(Request $request, CarType $carType): RedirectResponse
    {
        $validatedData = $request->validate([
            'name' => ['required', 'string', 'max:255'],
            'plate_number' => ['required', 'string', 'max:20', 'unique:car_types,plate_number,' . $carType->id],
            'model' => ['nullable', 'string', 'max:255'],
            'status' => ['required', 'in:available,unavailable'],
            'description' => ['nullable', 'string', 'max:1000'],
        ]);

        $carType->update($validatedData);

        return Redirect::route('car-types.index')->with('success', __('Car Type updated successfully.'));
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\CarType  $carType
     * @return \Illuminate\Http\RedirectResponse
     */
    public function destroy(CarType $carType): RedirectResponse
    {
        $carType->delete();

        return Redirect::back()->with('success', __('Car Type deleted successfully.'));
    }
}