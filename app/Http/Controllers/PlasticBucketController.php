<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\PlasticBucket;
use App\Http\Requests\PlasticBucketRequest;
use Illuminate\View\View;
use Illuminate\Http\RedirectResponse;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Http\JsonResponse;

class PlasticBucketController extends Controller
{

    public function getBuckets() :JsonResponse
    {

        $plasticBucket = PlasticBucket::all();

        return $this->jsonResponse(['data' => $plasticBucket]);
        
    }


    public function index():view 
    {
        $plsticBuckets = PlasticBucket::all();

        return view('plasticBuckets.index', [
            'plsticBuckets' => $plsticBuckets,
        ]);
    }


    public function create(): View
    {
        return view("plasticBuckets.create");
    }

     /**
     * Create resources.
     * 
     * * @return \Illuminate\Http\Request\PlasticBucketRequest $request
     * @return \Illuminate\Http\RedirectResponse
     */
    public function store(PlasticBucketRequest $request): RedirectResponse
    {
        $plasticBucket = new PlasticBucket();
        $plasticBucket->category_name = $request->category_name;
        $plasticBucket->stock = $request->stock;
        $plasticBucket->save();

        return Redirect::back()->with("success", __("Created"));
    }


    public function edit(PlasticBucket $plasticBucket): View
    {
        return view("plasticBuckets.edit", [
            'plasticBucket' => $plasticBucket
        ]);
    }

     /**
     * Create resources.
     * 
     * * @return \Illuminate\Http\Request\PlasticBucketRequest $request
     * @return \Illuminate\Http\RedirectResponse
     */
    public function update(PlasticBucketRequest $request, PlasticBucket $plasticBucket): RedirectResponse
    {
        $plasticBucket->category_name = $request->category_name;
        $plasticBucket->stock = $request->stock;

        $plasticBucket->save();

        return Redirect::back()->with("success", __("Created"));
    }

    /**
     * Delete resources.
     * 
     * @return \Illuminate\Http\RedirectResponse
     */
    public function destroy(PlasticBucket $plasticBucket): RedirectResponse
    {
        $plasticBucket->delete();
        return Redirect::back()->with("success", __("Deleted"));
    }
}
