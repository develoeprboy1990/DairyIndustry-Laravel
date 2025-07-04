@php
    $isCashier = Auth::user()->is_cashier;

    $items = [
        [
            'name' => __('Dashboard'),
            'route' => route('home'),
            'icon' =>
                '<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="hero-icon-sm me-3 text-gray-400"><path stroke-linecap="round" stroke-linejoin="round" d="M3.75 6A2.25 2.25 0 016 3.75h2.25A2.25 2.25 0 0110.5 6v2.25a2.25 2.25 0 01-2.25 2.25H6a2.25 2.25 0 01-2.25-2.25V6zM3.75 15.75A2.25 2.25 0 016 13.5h2.25a2.25 2.25 0 012.25 2.25V18a2.25 2.25 0 01-2.25 2.25H6A2.25 2.25 0 013.75 18v-2.25zM13.5 6a2.25 2.25 0 012.25-2.25H18A2.25 2.25 0 0120.25 6v2.25A2.25 2.25 0 0118 10.5h-2.25a2.25 2.25 0 01-2.25-2.25V6zM13.5 15.75a2.25 2.25 0 012.25-2.25H18a2.25 2.25 0 012.25 2.25V18A2.25 2.25 0 0118 20.25h-2.25A2.25 2.25 0 0113.5 18v-2.25z" /></svg>',
            'img' => 'dashboard.webp',
            'active' => Route::is('home'),
            'is_blank' => false,
            'is_active' => true,
            'disabled' => false,
        ],
        [
            'name' => __('Point Of Sale'),
            'route' => route('pos.show'),
            'icon' =>
                '  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" stroke="currentColor" stroke-width="1.5" fill="none" class="hero-icon-sm me-3 text-gray-400"> <line stroke-linecap="round" stroke-linejoin="round" x1="4.8593" y1="19.2301" x2="19.1407" y2="19.2301" /> <line stroke-linecap="round" stroke-linejoin="round" x1="7.3414" y1="10.2397" x2="8.1836" y2="10.2397" /> <line stroke-linecap="round" stroke-linejoin="round" x1="7.3377" y1="12.1332" x2="8.1799" y2="12.1332" /> <line stroke-linecap="round" stroke-linejoin="round" x1="7.3377" y1="13.9987" x2="8.1799" y2="13.9987" /> <line stroke-linecap="round" stroke-linejoin="round" x1="9.9996" y1="10.2537" x2="10.8418" y2="10.2537" /> <line stroke-linecap="round" stroke-linejoin="round" x1="9.9959" y1="12.1471" x2="10.8381" y2="12.1471" /> <line stroke-linecap="round" stroke-linejoin="round" x1="9.9959" y1="14.0127" x2="10.8381" y2="14.0127" /> <line stroke-linecap="round" stroke-linejoin="round" x1="14.3382" y1="5.4724" x2="14.3382" y2="7.9405" /> <line stroke-linecap="round" stroke-linejoin="round" x1="17.1117" y1="5.4724" x2="17.1117" y2="7.9405" /> <rect stroke-linecap="round" stroke-linejoin="round" x="2.3168" y="16.8812" width="19.3663" height="4.6978" rx="1.4456" /> <path stroke-linecap="round" stroke-linejoin="round" d="M6.312,8.0891h11.38a1.4491,1.4491,0,0,1,1.4491,1.4491v7.3306a.0124.0124,0,0,1-.0124.0124H4.8716a.0124.0124,0,0,1-.0124-.0124V9.5419A1.4528,1.4528,0,0,1,6.312,8.0891Z" /> <rect stroke-linecap="round" stroke-linejoin="round" x="14.2842" y="9.8426" width="3.0654" height="2.4681" rx="0.8759" /> <path stroke-linecap="round" stroke-linejoin="round" d="M8.7938,5.4724h.1606a1.4524,1.4524,0,0,1,1.4524,1.4524V7.9405a0,0,0,0,1,0,0H7.3414a0,0,0,0,1,0,0V6.9248A1.4524,1.4524,0,0,1,8.7938,5.4724Z" /> <rect stroke-linecap="round" stroke-linejoin="round" x="12.9621" y="3.0043" width="5.7097" height="2.4681" rx="0.983" /> </svg>',
            'img' => 'cashier.webp',
            'active' => Route::is('pos.show'),
            'is_blank' => false,
            'is_active' => true,
            'disabled' => false,
        ],
        // ====== GPS tracker ========
        [
            'name' => __('GPS Tracker'),
            'route' => route('gps_trackers.index'),
            'icon' =>
                '  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" stroke="currentColor" stroke-width="1.5" fill="none" class="hero-icon-sm me-3 text-gray-400"> <line stroke-linecap="round" stroke-linejoin="round" x1="4.8593" y1="19.2301" x2="19.1407" y2="19.2301" /> <line stroke-linecap="round" stroke-linejoin="round" x1="7.3414" y1="10.2397" x2="8.1836" y2="10.2397" /> <line stroke-linecap="round" stroke-linejoin="round" x1="7.3377" y1="12.1332" x2="8.1799" y2="12.1332" /> <line stroke-linecap="round" stroke-linejoin="round" x1="7.3377" y1="13.9987" x2="8.1799" y2="13.9987" /> <line stroke-linecap="round" stroke-linejoin="round" x1="9.9996" y1="10.2537" x2="10.8418" y2="10.2537" /> <line stroke-linecap="round" stroke-linejoin="round" x1="9.9959" y1="12.1471" x2="10.8381" y2="12.1471" /> <line stroke-linecap="round" stroke-linejoin="round" x1="9.9959" y1="14.0127" x2="10.8381" y2="14.0127" /> <line stroke-linecap="round" stroke-linejoin="round" x1="14.3382" y1="5.4724" x2="14.3382" y2="7.9405" /> <line stroke-linecap="round" stroke-linejoin="round" x1="17.1117" y1="5.4724" x2="17.1117" y2="7.9405" /> <rect stroke-linecap="round" stroke-linejoin="round" x="2.3168" y="16.8812" width="19.3663" height="4.6978" rx="1.4456" /> <path stroke-linecap="round" stroke-linejoin="round" d="M6.312,8.0891h11.38a1.4491,1.4491,0,0,1,1.4491,1.4491v7.3306a.0124.0124,0,0,1-.0124.0124H4.8716a.0124.0124,0,0,1-.0124-.0124V9.5419A1.4528,1.4528,0,0,1,6.312,8.0891Z" /> <rect stroke-linecap="round" stroke-linejoin="round" x="14.2842" y="9.8426" width="3.0654" height="2.4681" rx="0.8759" /> <path stroke-linecap="round" stroke-linejoin="round" d="M8.7938,5.4724h.1606a1.4524,1.4524,0,0,1,1.4524,1.4524V7.9405a0,0,0,0,1,0,0H7.3414a0,0,0,0,1,0,0V6.9248A1.4524,1.4524,0,0,1,8.7938,5.4724Z" /> <rect stroke-linecap="round" stroke-linejoin="round" x="12.9621" y="3.0043" width="5.7097" height="2.4681" rx="0.983" /> </svg>',
            'img' => 'cashier.webp',
            'active' => Route::is('gps_trackers.index'),
            'is_blank' => false,
            'is_active' => true,
            'disabled' => false,
        ],
        [
            'name' => __('All Stocks'),
            'route' => route('stocks.index'),
            'icon' =>
                '  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" stroke="currentColor" stroke-width="1.5" fill="none" class="hero-icon-sm me-3 text-gray-400"> <line stroke-linecap="round" stroke-linejoin="round" x1="4.8593" y1="19.2301" x2="19.1407" y2="19.2301" /> <line stroke-linecap="round" stroke-linejoin="round" x1="7.3414" y1="10.2397" x2="8.1836" y2="10.2397" /> <line stroke-linecap="round" stroke-linejoin="round" x1="7.3377" y1="12.1332" x2="8.1799" y2="12.1332" /> <line stroke-linecap="round" stroke-linejoin="round" x1="7.3377" y1="13.9987" x2="8.1799" y2="13.9987" /> <line stroke-linecap="round" stroke-linejoin="round" x1="9.9996" y1="10.2537" x2="10.8418" y2="10.2537" /> <line stroke-linecap="round" stroke-linejoin="round" x1="9.9959" y1="12.1471" x2="10.8381" y2="12.1471" /> <line stroke-linecap="round" stroke-linejoin="round" x1="9.9959" y1="14.0127" x2="10.8381" y2="14.0127" /> <line stroke-linecap="round" stroke-linejoin="round" x1="14.3382" y1="5.4724" x2="14.3382" y2="7.9405" /> <line stroke-linecap="round" stroke-linejoin="round" x1="17.1117" y1="5.4724" x2="17.1117" y2="7.9405" /> <rect stroke-linecap="round" stroke-linejoin="round" x="2.3168" y="16.8812" width="19.3663" height="4.6978" rx="1.4456" /> <path stroke-linecap="round" stroke-linejoin="round" d="M6.312,8.0891h11.38a1.4491,1.4491,0,0,1,1.4491,1.4491v7.3306a.0124.0124,0,0,1-.0124.0124H4.8716a.0124.0124,0,0,1-.0124-.0124V9.5419A1.4528,1.4528,0,0,1,6.312,8.0891Z" /> <rect stroke-linecap="round" stroke-linejoin="round" x="14.2842" y="9.8426" width="3.0654" height="2.4681" rx="0.8759" /> <path stroke-linecap="round" stroke-linejoin="round" d="M8.7938,5.4724h.1606a1.4524,1.4524,0,0,1,1.4524,1.4524V7.9405a0,0,0,0,1,0,0H7.3414a0,0,0,0,1,0,0V6.9248A1.4524,1.4524,0,0,1,8.7938,5.4724Z" /> <rect stroke-linecap="round" stroke-linejoin="round" x="12.9621" y="3.0043" width="5.7097" height="2.4681" rx="0.983" /> </svg>',
            'img' => 'cashier.webp',
            'active' => Route::is('stocks.*'),
            'is_blank' => false,
            'is_active' => true,
            'disabled' => false,
        ],
        [
            'name' => __('Plastic Buckets'),
            'route' => route('plasticBuckets.index'),
            'icon' =>
                '  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" stroke="currentColor" stroke-width="1.5" fill="none" class="hero-icon-sm me-3 text-gray-400"> <line stroke-linecap="round" stroke-linejoin="round" x1="4.8593" y1="19.2301" x2="19.1407" y2="19.2301" /> <line stroke-linecap="round" stroke-linejoin="round" x1="7.3414" y1="10.2397" x2="8.1836" y2="10.2397" /> <line stroke-linecap="round" stroke-linejoin="round" x1="7.3377" y1="12.1332" x2="8.1799" y2="12.1332" /> <line stroke-linecap="round" stroke-linejoin="round" x1="7.3377" y1="13.9987" x2="8.1799" y2="13.9987" /> <line stroke-linecap="round" stroke-linejoin="round" x1="9.9996" y1="10.2537" x2="10.8418" y2="10.2537" /> <line stroke-linecap="round" stroke-linejoin="round" x1="9.9959" y1="12.1471" x2="10.8381" y2="12.1471" /> <line stroke-linecap="round" stroke-linejoin="round" x1="9.9959" y1="14.0127" x2="10.8381" y2="14.0127" /> <line stroke-linecap="round" stroke-linejoin="round" x1="14.3382" y1="5.4724" x2="14.3382" y2="7.9405" /> <line stroke-linecap="round" stroke-linejoin="round" x1="17.1117" y1="5.4724" x2="17.1117" y2="7.9405" /> <rect stroke-linecap="round" stroke-linejoin="round" x="2.3168" y="16.8812" width="19.3663" height="4.6978" rx="1.4456" /> <path stroke-linecap="round" stroke-linejoin="round" d="M6.312,8.0891h11.38a1.4491,1.4491,0,0,1,1.4491,1.4491v7.3306a.0124.0124,0,0,1-.0124.0124H4.8716a.0124.0124,0,0,1-.0124-.0124V9.5419A1.4528,1.4528,0,0,1,6.312,8.0891Z" /> <rect stroke-linecap="round" stroke-linejoin="round" x="14.2842" y="9.8426" width="3.0654" height="2.4681" rx="0.8759" /> <path stroke-linecap="round" stroke-linejoin="round" d="M8.7938,5.4724h.1606a1.4524,1.4524,0,0,1,1.4524,1.4524V7.9405a0,0,0,0,1,0,0H7.3414a0,0,0,0,1,0,0V6.9248A1.4524,1.4524,0,0,1,8.7938,5.4724Z" /> <rect stroke-linecap="round" stroke-linejoin="round" x="12.9621" y="3.0043" width="5.7097" height="2.4681" rx="0.983" /> </svg>',
            'img' => 'cashier.webp',
            'active' => Route::is('plasticBuckets.index'),
            'is_blank' => false,
            'is_active' => true,
            'disabled' => false,
        ],
        [
            'name' => __('General Restrictions'),
            'route' => route('generalRestrictions.index'),
            'icon' =>
                '  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" stroke="currentColor" stroke-width="1.5" fill="none" class="hero-icon-sm me-3 text-gray-400"> <line stroke-linecap="round" stroke-linejoin="round" x1="4.8593" y1="19.2301" x2="19.1407" y2="19.2301" /> <line stroke-linecap="round" stroke-linejoin="round" x1="7.3414" y1="10.2397" x2="8.1836" y2="10.2397" /> <line stroke-linecap="round" stroke-linejoin="round" x1="7.3377" y1="12.1332" x2="8.1799" y2="12.1332" /> <line stroke-linecap="round" stroke-linejoin="round" x1="7.3377" y1="13.9987" x2="8.1799" y2="13.9987" /> <line stroke-linecap="round" stroke-linejoin="round" x1="9.9996" y1="10.2537" x2="10.8418" y2="10.2537" /> <line stroke-linecap="round" stroke-linejoin="round" x1="9.9959" y1="12.1471" x2="10.8381" y2="12.1471" /> <line stroke-linecap="round" stroke-linejoin="round" x1="9.9959" y1="14.0127" x2="10.8381" y2="14.0127" /> <line stroke-linecap="round" stroke-linejoin="round" x1="14.3382" y1="5.4724" x2="14.3382" y2="7.9405" /> <line stroke-linecap="round" stroke-linejoin="round" x1="17.1117" y1="5.4724" x2="17.1117" y2="7.9405" /> <rect stroke-linecap="round" stroke-linejoin="round" x="2.3168" y="16.8812" width="19.3663" height="4.6978" rx="1.4456" /> <path stroke-linecap="round" stroke-linejoin="round" d="M6.312,8.0891h11.38a1.4491,1.4491,0,0,1,1.4491,1.4491v7.3306a.0124.0124,0,0,1-.0124.0124H4.8716a.0124.0124,0,0,1-.0124-.0124V9.5419A1.4528,1.4528,0,0,1,6.312,8.0891Z" /> <rect stroke-linecap="round" stroke-linejoin="round" x="14.2842" y="9.8426" width="3.0654" height="2.4681" rx="0.8759" /> <path stroke-linecap="round" stroke-linejoin="round" d="M8.7938,5.4724h.1606a1.4524,1.4524,0,0,1,1.4524,1.4524V7.9405a0,0,0,0,1,0,0H7.3414a0,0,0,0,1,0,0V6.9248A1.4524,1.4524,0,0,1,8.7938,5.4724Z" /> <rect stroke-linecap="round" stroke-linejoin="round" x="12.9621" y="3.0043" width="5.7097" height="2.4681" rx="0.983" /> </svg>',
            'img' => 'cashier.webp',
            'active' => Route::is('generalRestrictions.index'),
            'is_blank' => false,
            'is_active' => true,
            'disabled' => false,
        ],
        // ====== GPS tracker ========
        [
            'name' => __('Invoices'),
            'route' => $isCashier ? '#' : route('orders.index'),
            'icon' =>
                '<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="hero-icon-sm me-3 text-gray-400"><path stroke-linecap="round" stroke-linejoin="round" d="M9 3.75H6.912a2.25 2.25 0 00-2.15 1.588L2.35 13.177a2.25 2.25 0 00-.1.661V18a2.25 2.25 0 002.25 2.25h15A2.25 2.25 0 0021.75 18v-4.162c0-.224-.034-.447-.1-.661L19.24 5.338a2.25 2.25 0 00-2.15-1.588H15M2.25 13.5h3.86a2.25 2.25 0 012.012 1.244l.256.512a2.25 2.25 0 002.013 1.244h3.218a2.25 2.25 0 002.013-1.244l.256-.512a2.25 2.25 0 012.013-1.244h3.859M12 3v8.25m0 0l-3-3m3 3l3-3" /></svg>',
            'img' => 'inbox.webp',
            'active' => Route::is('orders.*'),
            'is_blank' => false,
            'is_active' => true,
            'disabled' => $isCashier,
        ],
        [
            'name' => __('Sales Man'),
            'route' => $isCashier ? '#' : route('salesmen.index'),
            'icon' =>
                '<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="hero-icon-sm me-3 text-gray-400"><path stroke-linecap="round" stroke-linejoin="round" d="M13.5 21v-7.5a.75.75 0 01.75-.75h3a.75.75 0 01.75.75V21m-4.5 0H2.36m11.14 0H18m0 0h3.64m-1.39 0V9.349m-16.5 11.65V9.35m0 0a3.001 3.001 0 003.75-.615A2.993 2.993 0 009.75 9.75c.896 0 1.7-.393 2.25-1.016a2.993 2.993 0 002.25 1.016c.896 0 1.7-.393 2.25-1.016a3.001 3.001 0 003.75.614m-16.5 0a3.004 3.004 0 01-.621-4.72L4.318 3.44A1.5 1.5 0 015.378 3h13.243a1.5 1.5 0 011.06.44l1.19 1.189a3 3 0 01-.621 4.72m-13.5 8.65h3.75a.75.75 0 00.75-.75V13.5a.75.75 0 00-.75-.75H6.75a.75.75 0 00-.75.75v3.75c0 .415.336.75.75.75z" /></svg>',
            'img' => 'inbox.webp',
            'active' => Route::is('salesman.*'),
            'is_blank' => false,
            'is_active' => true,
            'disabled' => $isCashier,
        ],
        [
            'name' => __('Roots'),
            'route' => $isCashier ? '#' : route('roots.index'),
            'icon' =>
                '<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="hero-icon-sm me-3 text-gray-400"><path stroke-linecap="round" stroke-linejoin="round" d="M13.5 21v-7.5a.75.75 0 01.75-.75h3a.75.75 0 01.75.75V21m-4.5 0H2.36m11.14 0H18m0 0h3.64m-1.39 0V9.349m-16.5 11.65V9.35m0 0a3.001 3.001 0 003.75-.615A2.993 2.993 0 009.75 9.75c.896 0 1.7-.393 2.25-1.016a2.993 2.993 0 002.25 1.016c.896 0 1.7-.393 2.25-1.016a3.001 3.001 0 003.75.614m-16.5 0a3.004 3.004 0 01-.621-4.72L4.318 3.44A1.5 1.5 0 015.378 3h13.243a1.5 1.5 0 011.06.44l1.19 1.189a3 3 0 01-.621 4.72m-13.5 8.65h3.75a.75.75 0 00.75-.75V13.5a.75.75 0 00-.75-.75H6.75a.75.75 0 00-.75.75v3.75c0 .415.336.75.75.75z" /></svg>',
            'img' => 'inbox.webp',
            'active' => Route::is('roots.*'),
            'is_blank' => false,
            'is_active' => true,
            'disabled' => $isCashier,
        ],
        [
            'name' => __('Lines'),
            'route' => $isCashier ? '#' : route('lines.index'),
            'icon' =>
                '<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="hero-icon-sm me-3 text-gray-400"><path stroke-linecap="round" stroke-linejoin="round" d="M13.5 21v-7.5a.75.75 0 01.75-.75h3a.75.75 0 01.75.75V21m-4.5 0H2.36m11.14 0H18m0 0h3.64m-1.39 0V9.349m-16.5 11.65V9.35m0 0a3.001 3.001 0 003.75-.615A2.993 2.993 0 009.75 9.75c.896 0 1.7-.393 2.25-1.016a2.993 2.993 0 002.25 1.016c.896 0 1.7-.393 2.25-1.016a3.001 3.001 0 003.75.614m-16.5 0a3.004 3.004 0 01-.621-4.72L4.318 3.44A1.5 1.5 0 015.378 3h13.243a1.5 1.5 0 011.06.44l1.19 1.189a3 3 0 01-.621 4.72m-13.5 8.65h3.75a.75.75 0 00.75-.75V13.5a.75.75 0 00-.75-.75H6.75a.75.75 0 00-.75.75v3.75c0 .415.336.75.75.75z" /></svg>',
            'img' => 'inbox.webp',
            'active' => Route::is('lines.*'),
            'is_blank' => false,
            'is_active' => true,
            'disabled' => $isCashier,
        ],
        // [
        //     'name' => __('Cow Farm'),
        //     'route' => $isCashier ? '#' : route('cowfarms.index'),
        //     'icon' => '<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="hero-icon-sm me-3 text-gray-400"><path stroke-linecap="round" stroke-linejoin="round" d="M2.25 18.75a60.07 60.07 0 0115.797 2.101c.727.198 1.453-.342 1.453-1.096V18.75M3.75 4.5v.75A.75.75 0 013 6h-.75m0 0v-.375c0-.621.504-1.125 1.125-1.125H20.25M2.25 6v9m18-10.5v.75c0 .414.336.75.75.75h.75m-1.5-1.5h.375c.621 0 1.125.504 1.125 1.125v9.75c0 .621-.504 1.125-1.125 1.125h-.375m1.5-1.5H21a.75.75 0 00-.75.75v.75m0 0H3.75m0 0h-.375a1.125 1.125 0 01-1.125-1.125V15m1.5 1.5v-.75A.75.75 0 003 15h-.75M15 10.5a3 3 0 11-6 0 3 3 0 016 0zm3 0h.008v.008H18V10.5zm-12 0h.008v.008H6V10.5z" /></svg>',
        //     'img' => 'inbox.webp',
        //     'active' => Route::is('cowfarms.*'),
        //     'is_blank' => false,
        //     'is_active' => true,
        //     'disabled' => $isCashier,
        // ],
        /*
        [
            'name' => __('Manufacturing and packaging'),
            'route' => $isCashier ? '#' : route('manupack.index'),
            'icon' => '<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="hero-icon-sm me-3 text-gray-400"><path stroke-linecap="round" stroke-linejoin="round" d="M2.25 18.75a60.07 60.07 0 0115.797 2.101c.727.198 1.453-.342 1.453-1.096V18.75M3.75 4.5v.75A.75.75 0 013 6h-.75m0 0v-.375c0-.621.504-1.125 1.125-1.125H20.25M2.25 6v9m18-10.5v.75c0 .414.336.75.75.75h.75m-1.5-1.5h.375c.621 0 1.125.504 1.125 1.125v9.75c0 .621-.504 1.125-1.125 1.125h-.375m1.5-1.5H21a.75.75 0 00-.75.75v.75m0 0H3.75m0 0h-.375a1.125 1.125 0 01-1.125-1.125V15m1.5 1.5v-.75A.75.75 0 003 15h-.75M15 10.5a3 3 0 11-6 0 3 3 0 016 0zm3 0h.008v.008H18V10.5zm-12 0h.008v.008H6V10.5z" /></svg>',
            'img' => 'inbox.webp',
            'active' => Route::is('manupack.*'),
            'is_blank' => false,
            'is_active' => true,
            'disabled' => $isCashier,
        ],
        */
        [
            'name' => __('Quotations'),
            'route' => $isCashier ? '#' : route('quotations.index'),
            'icon' =>
                '<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="hero-icon-sm me-3 text-gray-400"><path stroke-linecap="round" stroke-linejoin="round" d="M9 3.75H6.912a2.25 2.25 0 00-2.15 1.588L2.35 13.177a2.25 2.25 0 00-.1.661V18a2.25 2.25 0 002.25 2.25h15A2.25 2.25 0 0021.75 18v-4.162c0-.224-.034-.447-.1-.661L19.24 5.338a2.25 2.25 0 00-2.15-1.588H15M2.25 13.5h3.86a2.25 2.25 0 012.012 1.244l.256.512a2.25 2.25 0 002.013 1.244h3.218a2.25 2.25 0 002.013-1.244l.256-.512a2.25 2.25 0 012.013-1.244h3.859M12 3v8.25m0 0l-3-3m3 3l3-3" /></svg>',
            'img' => 'inbox.webp',
            'active' => Route::is('quotations.*'),
            'is_blank' => false,
            'is_active' => true,
            'disabled' => $isCashier,
        ],
        [
            'name' => __('Categories'),
            'route' => route('categories.index'),
            'icon' =>
                '<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="hero-icon-sm me-3 text-gray-400"><path stroke-linecap="round" stroke-linejoin="round" d="M9.568 3H5.25A2.25 2.25 0 003 5.25v4.318c0 .597.237 1.17.659 1.591l9.581 9.581c.699.699 1.78.872 2.607.33a18.095 18.095 0 005.223-5.223c.542-.827.369-1.908-.33-2.607L11.16 3.66A2.25 2.25 0 009.568 3z" /><path stroke-linecap="round" stroke-linejoin="round" d="M6 6h.008v.008H6V6z" /></svg>',
            'img' => 'square.webp',
            'active' => Route::is('categories.*'),
            'is_blank' => false,
            'is_active' => true,
            'disabled' => false,
        ],
        [
            'name' => __('Expense Categories'),
            'route' => route('expense-categories.index'),
            'icon' =>
                '<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="hero-icon-sm me-3 text-gray-400"><path stroke-linecap="round" stroke-linejoin="round" d="M9.568 3H5.25A2.25 2.25 0 003 5.25v4.318c0 .597.237 1.17.659 1.591l9.581 9.581c.699.699 1.78.872 2.607.33a18.095 18.095 0 005.223-5.223c.542-.827.369-1.908-.33-2.607L11.16 3.66A2.25 2.25 0 009.568 3z" /><path stroke-linecap="round" stroke-linejoin="round" d="M6 6h.008v.008H6V6z" /></svg>',
            'img' => 'square.webp',
            'active' => Route::is('expense-categories.*'),
            'is_blank' => false,
            'is_active' => true,
            'disabled' => false,
        ],
        [
            'name' => __('Items'),
            'route' => route('products.index'),
            'icon' =>
                '<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="hero-icon-sm me-3 text-gray-400"><path stroke-linecap="round" stroke-linejoin="round" d="M20.25 7.5l-.625 10.632a2.25 2.25 0 01-2.247 2.118H6.622a2.25 2.25 0 01-2.247-2.118L3.75 7.5M10 11.25h4M3.375 7.5h17.25c.621 0 1.125-.504 1.125-1.125v-1.5c0-.621-.504-1.125-1.125-1.125H3.375c-.621 0-1.125.504-1.125 1.125v1.5c0 .621.504 1.125 1.125 1.125z" /></svg>',
            'img' => 'box.webp',
            'active' => Route::is('products.*'),
            'is_blank' => false,
            'is_active' => true,
            'disabled' => false,
        ],
        [
            'name' => __('Expired Items'),
            'route' => route('expired-products.index'),
            'icon' =>
                '<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="hero-icon-sm me-3 text-gray-400"><path stroke-linecap="round" stroke-linejoin="round" d="M4.75 7.5l.625 10.632a2.25 2.25 0 002.247 2.118h10.506a2.25 2.25 0 002.247-2.118L19.25 7.5M14 11.25h4M3.375 7.5h17.25c.621 0 1.125-.504 1.125-1.125v-1.5c0-.621-.504-1.125-1.125-1.125H3.375c-.621 0-1.125.504-1.125 1.125v1.5c0 .621.504 1.125 1.125 1.125z" /></svg>',
            'img' => 'expired-box.webp', // Adjust the image as needed
            'active' => Route::is('expired-products.*'),
            'is_blank' => false,
            'is_active' => true,
            'disabled' => false,
        ],
        [
            'name' => __('Ingredient Stock'),
            'route' => route('ingredients.index'),
            'icon' =>
                '<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="hero-icon-sm me-3 text-gray-400"><path stroke-linecap="round" stroke-linejoin="round" d="M9.75 3.104v5.714a2.25 2.25 0 0 1-.659 1.591L5 14.5M9.75 3.104c-.251.023-.501.05-.75.082m.75-.082a24.301 24.301 0 0 1 4.5 0m0 0v5.714c0 .597.237 1.17.659 1.591L19.8 15.3M14.25 3.104c.251.023.501.05.75.082M19.8 15.3l-1.57.393A9.065 9.065 0 0 1 12 15a9.065 9.065 0 0 0-6.23-.693L5 14.5m14.8.8 1.402 1.402c1.232 1.232.65 3.318-1.067 3.611A48.309 48.309 0 0 1 12 21c-2.773 0-5.491-.235-8.135-.687-1.718-.293-2.3-2.379-1.067-3.61L5 14.5" /></svg>',
            'img' => 'box.webp',
            'active' => Route::is('ingredients.*'),
            'is_blank' => false,
            'is_active' => true,
            'disabled' => false,
        ],
        [
            'name' => __('Dairy Industry'),
            'route' => route('industry'),
            'icon' =>
                '<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="hero-icon-sm me-3 text-gray-400"><path stroke-linecap="round" stroke-linejoin="round" d="M20.25 7.5l-.625 10.632a2.25 2.25 0 01-2.247 2.118H6.622a2.25 2.25 0 01-2.247-2.118L3.75 7.5M10 11.25h4M3.375 7.5h17.25c.621 0 1.125-.504 1.125-1.125v-1.5c0-.621-.504-1.125-1.125-1.125H3.375c-.621 0-1.125.504-1.125 1.125v1.5c0 .621.504 1.125 1.125 1.125z" /></svg>',
            'img' => 'group.webp',
            'active' =>
                Route::is('industry') ||
                Route::is('cheeses.*') ||
                Route::is('mouneh-industries.*') ||
                Route::is('milk_details.*') ||
                Route::is('dairy_industry.*') ||
                Route::is('cheese_process.*') ||
                Route::is('gouda_regular.*') ||
                Route::is('kishek.*') ||
                Route::is('laban_process.*') ||
                Route::is('labneh_process.*') ||
                Route::is('comte.*') ||
                Route::is('raclette.*') ||
                Route::is('serum.*') ||
                Route::is('shankleesh.*') ||
                Route::is('tomme.*'),
            'is_blank' => false,
            'is_active' => true,
            'disabled' => false,
        ],
        [
            'name' => __('Inventories'),
            'route' => route('inventory.index'),
            'icon' =>
                '<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="hero-icon-sm me-3 text-gray-400"><path stroke-linecap="round" stroke-linejoin="round" d="M11.25 11.25l.041-.02a.75.75 0 011.063.852l-.708 2.836a.75.75 0 001.063.853l.041-.021M21 12a9 9 0 11-18 0 9 9 0 0118 0zm-9-3.75h.008v.008H12V8.25z" /></svg>',
            'img' => 'info.webp',
            'active' => Route::is('inventory.*'),
            'is_blank' => false,
            'is_active' => true,
            'disabled' => false,
        ],
        [
            'name' => __('Staffs'),
            'route' => route('staffs.index'),
            'icon' =>
                '<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="hero-icon-sm me-3 text-gray-400"><path stroke-linecap="round" stroke-linejoin="round" d="M18 18.72a9.094 9.094 0 003.741-.479 3 3 0 00-4.682-2.72m.94 3.198l.001.031c0 .225-.012.447-.037.666A11.944 11.944 0 0112 21c-2.17 0-4.207-.576-5.963-1.584A6.062 6.062 0 016 18.719m12 0a5.971 5.971 0 00-.941-3.197m0 0A5.995 5.995 0 0012 12.75a5.995 5.995 0 00-5.058 2.772m0 0a3 3 0 00-4.681 2.72 8.986 8.986 0 003.74.477m.94-3.197a5.971 5.971 0 00-.94 3.197M15 6.75a3 3 0 11-6 0 3 3 0 016 0zm6 3a2.25 2.25 0 11-4.5 0 2.25 2.25 0 014.5 0zm-13.5 0a2.25 2.25 0 11-4.5 0 2.25 2.25 0 014.5 0z" /></svg>',
            'img' => 'group.webp',
            'active' => Route::is('staffs.*'),
            'is_blank' => false,
            'is_active' => true,
            'disabled' => false,
        ],
        [
            'name' => __('Attendances'),
            'route' => route('attendances.index'),
            'icon' =>
                '<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="hero-icon-sm me-3 text-gray-400"><path stroke-linecap="round" stroke-linejoin="round" d="M18 18.72a9.094 9.094 0 003.741-.479 3 3 0 00-4.682-2.72m.94 3.198l.001.031c0 .225-.012.447-.037.666A11.944 11.944 0 0112 21c-2.17 0-4.207-.576-5.963-1.584A6.062 6.062 0 016 18.719m12 0a5.971 5.971 0 00-.941-3.197m0 0A5.995 5.995 0 0012 12.75a5.995 5.995 0 00-5.058 2.772m0 0a3 3 0 00-4.681 2.72 8.986 8.986 0 003.74.477m.94-3.197a5.971 5.971 0 00-.94 3.197M15 6.75a3 3 0 11-6 0 3 3 0 016 0zm6 3a2.25 2.25 0 11-4.5 0 2.25 2.25 0 014.5 0zm-13.5 0a2.25 2.25 0 11-4.5 0 2.25 2.25 0 014.5 0z" /></svg>',
            'img' => 'group.webp',
            'active' => Route::is('attendances.*'),
            'is_blank' => false,
            'is_active' => true,
            'disabled' => false,
        ],
        [
            'name' => __('Customers'),
            'route' => route('customers.index'),
            'icon' =>
                '<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="hero-icon-sm me-3 text-gray-400"><path stroke-linecap="round" stroke-linejoin="round" d="M18 18.72a9.094 9.094 0 003.741-.479 3 3 0 00-4.682-2.72m.94 3.198l.001.031c0 .225-.012.447-.037.666A11.944 11.944 0 0112 21c-2.17 0-4.207-.576-5.963-1.584A6.062 6.062 0 016 18.719m12 0a5.971 5.971 0 00-.941-3.197m0 0A5.995 5.995 0 0012 12.75a5.995 5.995 0 00-5.058 2.772m0 0a3 3 0 00-4.681 2.72 8.986 8.986 0 003.74.477m.94-3.197a5.971 5.971 0 00-.94 3.197M15 6.75a3 3 0 11-6 0 3 3 0 016 0zm6 3a2.25 2.25 0 11-4.5 0 2.25 2.25 0 014.5 0zm-13.5 0a2.25 2.25 0 11-4.5 0 2.25 2.25 0 014.5 0z" /></svg>',
            'img' => 'group.webp',
            'active' => Route::is('customers.*'),
            'is_blank' => false,
            'is_active' => true,
            'disabled' => false,
        ],
        [
            'name' => __('Employees'),
            'route' => route('employees.index'),
            'icon' =>
                '<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="hero-icon-sm me-3 text-gray-400"><path stroke-linecap="round" stroke-linejoin="round" d="M18 18.72a9.094 9.094 0 003.741-.479 3 3 0 00-4.682-2.72m.94 3.198l.001.031c0 .225-.012.447-.037.666A11.944 11.944 0 0112 21c-2.17 0-4.207-.576-5.963-1.584A6.062 6.062 0 016 18.719m12 0a5.971 5.971 0 00-.941-3.197m0 0A5.995 5.995 0 0012 12.75a5.995 5.995 0 00-5.058 2.772m0 0a3 3 0 00-4.681 2.72 8.986 8.986 0 003.74.477m.94-3.197a5.971 5.971 0 00-.94 3.197M15 6.75a3 3 0 11-6 0 3 3 0 016 0zm6 3a2.25 2.25 0 11-4.5 0 2.25 2.25 0 014.5 0zm-13.5 0a2.25 2.25 0 11-4.5 0 2.25 2.25 0 014.5 0z" /></svg>',
            'img' => 'group.webp',
            'active' => Route::is('employees.*'),
            'is_blank' => false,
            'is_active' => true,
            'disabled' => false,
        ],
        [
            'name' => __('Drivers'),
            'route' => route('drivers.index'),
            'icon' =>
                '<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="hero-icon-sm me-3 text-gray-400"><path stroke-linecap="round" stroke-linejoin="round" d="M18 18.72a9.094 9.094 0 003.741-.479 3 3 0 00-4.682-2.72m.94 3.198l.001.031c0 .225-.012.447-.037.666A11.944 11.944 0 0112 21c-2.17 0-4.207-.576-5.963-1.584A6.062 6.062 0 016 18.719m12 0a5.971 5.971 0 00-.941-3.197m0 0A5.995 5.995 0 0012 12.75a5.995 5.995 0 00-5.058 2.772m0 0a3 3 0 00-4.681 2.72 8.986 8.986 0 003.74.477m.94-3.197a5.971 5.971 0 00-.94 3.197M15 6.75a3 3 0 11-6 0 3 3 0 016 0zm6 3a2.25 2.25 0 11-4.5 0 2.25 2.25 0 014.5 0zm-13.5 0a2.25 2.25 0 11-4.5 0 2.25 2.25 0 014.5 0z" /></svg>',
            'img' => 'group.webp',
            'active' => Route::is('drivers.*'),
            'is_blank' => false,
            'is_active' => true,
            'disabled' => false,
        ],
        [
            'name' => __('Car Types'),
            'route' => route('car-types.index'),
            'icon' =>
                '<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="hero-icon-sm me-3 text-gray-400"><path stroke-linecap="round" stroke-linejoin="round" d="M18 18.72a9.094 9.094 0 003.741-.479 3 3 0 00-4.682-2.72m.94 3.198l.001.031c0 .225-.012.447-.037.666A11.944 11.944 0 0112 21c-2.17 0-4.207-.576-5.963-1.584A6.062 6.062 0 016 18.719m12 0a5.971 5.971 0 00-.941-3.197m0 0A5.995 5.995 0 0012 12.75a5.995 5.995 0 00-5.058 2.772m0 0a3 3 0 00-4.681 2.72 8.986 8.986 0 003.74.477m.94-3.197a5.971 5.971 0 00-.94 3.197M15 6.75a3 3 0 11-6 0 3 3 0 016 0zm6 3a2.25 2.25 0 11-4.5 0 2.25 2.25 0 014.5 0zm-13.5 0a2.25 2.25 0 11-4.5 0 2.25 2.25 0 014.5 0z" /></svg>',
            'img' => 'group.webp',
            'active' => Route::is('car-types.*'),
            'is_blank' => false,
            'is_active' => true,
            'disabled' => false,
        ],
        [
            'name' => __('Cash Drawer'),
            'route' => $isCashier ? '#' : route('drawer.show'),
            'icon' =>
                '<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="hero-icon-sm me-3 text-gray-400"><path stroke-linecap="round" stroke-linejoin="round" d="M2.25 18.75a60.07 60.07 0 0115.797 2.101c.727.198 1.453-.342 1.453-1.096V18.75M3.75 4.5v.75A.75.75 0 013 6h-.75m0 0v-.375c0-.621.504-1.125 1.125-1.125H20.25M2.25 6v9m18-10.5v.75c0 .414.336.75.75.75h.75m-1.5-1.5h.375c.621 0 1.125.504 1.125 1.125v9.75c0 .621-.504 1.125-1.125 1.125h-.375m1.5-1.5H21a.75.75 0 00-.75.75v.75m0 0H3.75m0 0h-.375a1.125 1.125 0 01-1.125-1.125V15m1.5 1.5v-.75A.75.75 0 003 15h-.75M15 10.5a3 3 0 11-6 0 3 3 0 016 0zm3 0h.008v.008H18V10.5zm-12 0h.008v.008H6V10.5z" /></svg>',
            'img' => 'cash.webp',
            'active' => Route::is('drawer.*'),
            'is_blank' => false,
            'is_active' => $settings->enableCashDrawer,
            'disabled' => $isCashier,
        ],
        [
            'name' => __('Suppliers'),
            'route' => route('suppliers.index'),
            'icon' =>
                '<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="hero-icon-sm me-3 text-gray-400"><path stroke-linecap="round" stroke-linejoin="round" d="M13.5 21v-7.5a.75.75 0 01.75-.75h3a.75.75 0 01.75.75V21m-4.5 0H2.36m11.14 0H18m0 0h3.64m-1.39 0V9.349m-16.5 11.65V9.35m0 0a3.001 3.001 0 003.75-.615A2.993 2.993 0 009.75 9.75c.896 0 1.7-.393 2.25-1.016a2.993 2.993 0 002.25 1.016c.896 0 1.7-.393 2.25-1.016a3.001 3.001 0 003.75.614m-16.5 0a3.004 3.004 0 01-.621-4.72L4.318 3.44A1.5 1.5 0 015.378 3h13.243a1.5 1.5 0 011.06.44l1.19 1.189a3 3 0 01-.621 4.72m-13.5 8.65h3.75a.75.75 0 00.75-.75V13.5a.75.75 0 00-.75-.75H6.75a.75.75 0 00-.75.75v3.75c0 .415.336.75.75.75z" /></svg>',
            'img' => 'cash.webp',
            'active' => Route::is('suppliers.*'),
            'is_blank' => false,
            'is_active' => true,
            'disabled' => false,
        ],
        [
            'name' => __('Purchases'),
            'route' => route('purchases.index'),
            'icon' =>
                '<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="hero-icon-sm me-3 text-gray-400"><path stroke-linecap="round" stroke-linejoin="round" d="M15.75 10.5V6a3.75 3.75 0 10-7.5 0v4.5m11.356-1.993l1.263 12c.07.665-.45 1.243-1.119 1.243H4.25a1.125 1.125 0 01-1.12-1.243l1.264-12A1.125 1.125 0 015.513 7.5h12.974c.576 0 1.059.435 1.119 1.007zM8.625 10.5a.375.375 0 11-.75 0 .375.375 0 01.75 0zm7.5 0a.375.375 0 11-.75 0 .375.375 0 01.75 0z" /></svg>',
            'img' => 'cash.webp',
            'active' => Route::is('purchases.*'),
            'is_blank' => false,
            'is_active' => true,
            'disabled' => false,
        ],
        [
            'name' => __('Payments'),
            'route' => route('payments.index'),
            'icon' =>
                '<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="hero-icon-sm me-3 text-gray-400"><path stroke-linecap="round" stroke-linejoin="round" d="M2.25 8.25h19.5M2.25 9h19.5m-16.5 5.25h6m-6 2.25h3m-3.75 3h15a2.25 2.25 0 002.25-2.25V6.75A2.25 2.25 0 0019.5 4.5h-15a2.25 2.25 0 00-2.25 2.25v10.5A2.25 2.25 0 004.5 19.5z" /></svg>',
            'img' => 'cash.webp',
            'active' => Route::is('payments.*'),
            'is_blank' => false,
            'is_active' => true,
            'disabled' => false,
        ],
        [
            'name' => __('Supplier Payments'),
            'route' => route('supplier-payments.index'),
            'icon' =>
                '<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="hero-icon-sm me-3 text-gray-400"><path stroke-linecap="round" stroke-linejoin="round" d="M2.25 8.25h19.5M2.25 9h19.5m-16.5 5.25h6m-6 2.25h3m-3.75 3h15a2.25 2.25 0 002.25-2.25V6.75A2.25 2.25 0 0019.5 4.5h-15a2.25 2.25 0 00-2.25 2.25v10.5A2.25 2.25 0 004.5 19.5z" /></svg>',
            'img' => 'cash.webp',
            'active' => Route::is('supplier-payments.*'),
            'is_blank' => false,
            'is_active' => true,
            'disabled' => false,
        ],
        [
            'name' => __('Expenses'),
            'route' => route('expenses.index'),
            'icon' =>
                '<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="hero-icon-sm me-3 text-gray-400"><path stroke-linecap="round" stroke-linejoin="round" d="M15.75 15.75V18m-7.5-6.75h.008v.008H8.25v-.008zm0 2.25h.008v.008H8.25V13.5zm0 2.25h.008v.008H8.25v-.008zm0 2.25h.008v.008H8.25V18zm2.498-6.75h.007v.008h-.007v-.008zm0 2.25h.007v.008h-.007V13.5zm0 2.25h.007v.008h-.007v-.008zm0 2.25h.007v.008h-.007V18zm2.504-6.75h.008v.008h-.008v-.008zm0 2.25h.008v.008h-.008V13.5zm0 2.25h.008v.008h-.008v-.008zm0 2.25h.008v.008h-.008V18zm2.498-6.75h.008v.008h-.008v-.008zm0 2.25h.008v.008h-.008V13.5zM8.25 6h7.5v2.25h-7.5V6zM12 2.25c-1.892 0-3.758.11-5.593.322C5.307 2.7 4.5 3.65 4.5 4.757V19.5a2.25 2.25 0 002.25 2.25h10.5a2.25 2.25 0 002.25-2.25V4.757c0-1.108-.806-2.057-1.907-2.185A48.507 48.507 0 0012 2.25z" /></svg>',
            'img' => 'cash.webp',
            'active' => Route::is('expenses.*'),
            'is_blank' => false,
            'is_active' => true,
            'disabled' => false,
        ],
        [
            'name' => __('User Manager'),
            'route' => $isCashier ? '#' : route('users.index'),
            'icon' =>
                '<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="hero-icon-sm me-3 text-gray-400"><path stroke-linecap="round" stroke-linejoin="round" d="M15 19.128a9.38 9.38 0 002.625.372 9.337 9.337 0 004.121-.952 4.125 4.125 0 00-7.533-2.493M15 19.128v-.003c0-1.113-.285-2.16-.786-3.07M15 19.128v.106A12.318 12.318 0 018.624 21c-2.331 0-4.512-.645-6.374-1.766l-.001-.109a6.375 6.375 0 0111.964-3.07M12 6.375a3.375 3.375 0 11-6.75 0 3.375 3.375 0 016.75 0zm8.25 2.25a2.625 2.625 0 11-5.25 0 2.625 2.625 0 015.25 0z" /></svg>',
            'img' => 'profile.webp',
            'active' => Route::is('users.*'),
            'is_blank' => false,
            'is_active' => true,
            'disabled' => $isCashier,
        ],
        [
            'name' => __('Settings'),
            'route' => $isCashier ? '#' : route('settings.show'),
            'icon' =>
                '<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="hero-icon-sm me-3 text-gray-400"><path stroke-linecap="round" stroke-linejoin="round" d="M4.5 12a7.5 7.5 0 0015 0m-15 0a7.5 7.5 0 1115 0m-15 0H3m16.5 0H21m-1.5 0H12m-8.457 3.077l1.41-.513m14.095-5.13l1.41-.513M5.106 17.785l1.15-.964m11.49-9.642l1.149-.964M7.501 19.795l.75-1.3m7.5-12.99l.75-1.3m-6.063 16.658l.26-1.477m2.605-14.772l.26-1.477m0 17.726l-.26-1.477M10.698 4.614l-.26-1.477M16.5 19.794l-.75-1.299M7.5 4.205L12 12m6.894 5.785l-1.149-.964M6.256 7.178l-1.15-.964m15.352 8.864l-1.41-.513M4.954 9.435l-1.41-.514M12.002 12l-3.75 6.495" /></svg>',
            'img' => 'gear.webp',
            'active' => Route::is('settings.*'),
            'is_blank' => false,
            'is_active' => true,
            'disabled' => $isCashier,
        ],
        [
            'name' => __('About'),
            'route' => route('about'),
            'icon' =>
                '<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="hero-icon-sm me-3 text-gray-400"><path stroke-linecap="round" stroke-linejoin="round" d="M11.25 11.25l.041-.02a.75.75 0 011.063.852l-.708 2.836a.75.75 0 001.063.853l.041-.021M21 12a9 9 0 11-18 0 9 9 0 0118 0zm-9-3.75h.008v.008H12V8.25z" /></svg>',
            'img' => 'info.webp',
            'active' => Route::is('about'),
            'is_blank' => false,
            'is_active' => true,
            'disabled' => false,
        ],
    ];
@endphp
@include('layouts.sidebar')
