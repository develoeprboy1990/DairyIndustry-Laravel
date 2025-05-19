<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;
use App\Models\GpsTracker;
use Illuminate\Http\Request;
use Illuminate\Http\RedirectResponse;
use Illuminate\Support\Facades\Redirect;
use Illuminate\View\View;
class GpsTrackerController extends Controller
{
    /**
     * Show GPS tracker page.
     * 
     * @return \Illuminate\View\View
     */
    public function index(): View
    {
        $gpsTracker = GpsTracker::where('id', '1')->first();
        return view("gps_trackers.index", ['gpsTracker' => $gpsTracker]);
    }

    /**
     * Show vehiclespage.
     * 
     * @return \Illuminate\View\View
     */
    public function vehicles(): View
    {
        $gpsTracker = GpsTracker::where('id', '1')->first();
        return view("gps_trackers.vehicles", ['gpsTracker' => $gpsTracker]);
    }

    /**
     * Show vehiclespage.
     * 
     * @return \Illuminate\View\View
     */
    public function status(): View
    {
        $gpsTracker = GpsTracker::where('id', '1')->first();
        return view("gps_trackers.status", ['gpsTracker' => $gpsTracker]);
    }

    /**
     * Show Update Login details.
     * 
     * @return \Illuminate\View\View
     */
    public function updateDetails(Request $request): RedirectResponse
    {
        $request->validate([
            'email'    => 'required|email',
            'password' => 'required|min:8',
            'url' => 'required|string',
            'google_map_api_key' => 'required|string'
        ]);
        // dd($request);
        $gpsTracker = GpsTracker::find(1);
        $gpsTracker->update([
            'email'  => $request->email,
            'password' => $request->password,
            'url' => $request->url,
            'google_map_api_key' => $request->google_map_api_key,
        ]);

        return back()->with('success', __('Updated'));
    }

    public function updateUserHash(Request $request): RedirectResponse
    {
        $request->validate([
            'user_api_hash'    => 'required|string',
        ]);
        // dd($request);
        $gpsTracker = GpsTracker::find(1);
        $gpsTracker->update([
            'user_api_hash'  => $request->user_api_hash,
            'login_active' => 1
        ]);

        return back()->with('success', __('Updated'));
    }

}
