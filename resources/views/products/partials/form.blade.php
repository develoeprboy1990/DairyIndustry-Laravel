<form class="min-h-fit flex-grow overflow-visible" action="{{ isset($product) ? route('products.update', $product) : route('products.store') }}" method="POST"
    enctype="multipart/form-data" role="form" onkeydown="return event.key != 'Enter';">
    @csrf
    @isset($product)
        @method('PUT')
    @endisset
    <div class="row">
        <div class="col-md-6 d-flex align-items-stretch mb-3">
            <x-card>

                <div class="row mb-3">
                    <div class="col-md-6">
                        <label for="category" class="form-label">@lang('Category')</label>
                        <select class="form-select @error('category') is-invalid @enderror" id="category"
                            name="category">
                            @isset($product)
                                @foreach ($categories as $category)
                                    <option value="{{ $category->id }}" @selected($product->category_id == $category->id)>
                                        {{ $category->name }}
                                    </option>
                                @endforeach
                            @else
                                @foreach ($categories as $category)
                                    <option value="{{ $category->id }}"
                                        {{ old('category') == $category->id ? 'selected' : '' }}>
                                        {{ $category->name }}
                                    </option>
                                @endforeach
                            @endisset
                        </select>
                        @error('category')
                            <div class="invalid-feedback">
                                {{ $message }}
                            </div>
                        @enderror
                    </div>
                    <div class="col-md-6">
                        <label for="main_category" class="form-label">@lang('Main Category')</label>
                        <select class="form-select @error('main_category') is-invalid @enderror" id="main_category"
                            name="main_category">
                            @isset($product)
                                <option value="">Select any one</option>
                                <option value="warehouse" @if ($product->main_category === 'warehouse') selected @endif>Wirehouse
                                </option>
                                <option value="coolingRooms" @if ($product->main_category === 'coolingRooms') selected @endif>Cooling Rooms
                                </option>
                            @else
                                <option value="">Select any one</option>
                                <option value="warehouse">Wirehouse</option>
                                <option value="coolingRooms">Cooling Rooms</option>
                            @endisset
                        </select>
                        @error('main_category')
                            <div class="invalid-feedback">
                                {{ $message }}
                            </div>
                        @enderror
                    </div>
                </div>


                <x-input label="Item Name" name="name"
                    value="{{ old('name', isset($product) ? $product->name : '') }}" />


                <x-textarea label="Description" name="description" id="description"
                    value="{{ old('description', isset($product) ? $product->description : null) }}" />
            </x-card>
        </div>
        <div class="col-md-6 d-flex align-items-stretch mb-3">
            <x-card>
                <x-select label="status.text" name="status">
                    @isset($product)
                        <option value="available" @if ($product->is_active) selected @endif>
                            @lang('For Sale')
                        </option>
                        <option value="unavailable" @if (!$product->is_active) selected @endif>
                            @lang('Hidden')
                        </option>
                    @else
                        <option value="available">@lang('For Sale')</option>
                        <option value="unavailable">@lang('Hidden')</option>
                    @endisset
                </x-select>
                <x-number-input label="Sort Order" name="sort_order"
                    value="{{ old('sort_order', isset($product) ? $product->sort_order : '') }}" />
                <x-date-input label="Expiry Date" name="expiry_date"
                    value="{{ old('expiry_date', isset($product) ? $product->expiry_date : '') }}" />
            </x-card>
        </div>
    </div>
    <div class="row">

        <div class="mb-3">
            <x-card>
                <div class="mb-2"><label for="packet_type" class="form-label">@lang('Packet Types')</label></div>
                <div class="row">
                    @foreach ($plasticBuckets as $bucket)
                        <div class="form-group col-md-3">
                            <label for="bucket_{{ $bucket->id }}">{{ $bucket->category_name }}</label>
                            <input type="number" name="plastic_bucket_stock[{{ $bucket->id }}]"
                                id="bucket_{{ $bucket->id }}" class="form-control"
                                value="{{ old('stock', isset($plasticBucketStock) ? $plasticBucketStock[$bucket->id] : '') }}"
                                min="0">
                        </div>
                    @endforeach
                </div>
            </x-card>
        </div>

    </div>
    <div class="row">
        <div class="col-md-6 d-flex align-items-stretch">
            <x-card class="mb-3">
                <div class="card-title h4 text-muted">@lang('Pricing')</div>

                <x-currency-input label="Cost" name="cost"
                    value="{{ old('cost', isset($product) ? $product->cost : '') }}" />
                <!--
                <x-currency-input label="Sale Price" name="sale_price"
                    value="{{ old('sale_price', isset($product) ? $product->sale_price : '') }}" /> -->

                {{-- <x-currency-input label="Retailsale Price" name="retailsale_price"
                    value="{{ old('retailsale_price', isset($product) ? $product->retailsale_price : '') }}" />

                <x-currency-input label="Wholesale Price" name="wholesale_price"
                    value="{{ old('wholesale_price', isset($product) ? $product->wholesale_price : '') }}" /> --}}
                <x-currency-input label="Unit Price" name="unit_price"
                    value="{{ old('unit_price', isset($product) ? $product->unit_price : '') }}" />

                <x-input label="Cost Unit" name="cost_unit"
                    value="{{ old('cost_unit', isset($product) ? $product->cost_unit : '') }}" />

                <x-currency-input label="Box Price" name="box_price"
                    value="{{ old('box_price', isset($product) ? $product->box_price : '') }}" />

                <x-number-input label="Box Per Count" name="count_per_box"
                    value="{{ old('count_per_box', isset($product) ? $product->count_per_box : 10) }}" />

                <x-input label="Box Unit" name="box_unit"
                    value="{{ old('box_unit', isset($product) ? $product->box_unit : '') }}" />

                <x-currency-input label="Wholesale Price" name="wholesale_price"
                    value="{{ old('wholesale_price', isset($product) ? $product->wholesale_price : '') }}" />

                <x-input label="Weight" name="weight"
                    value="{{ old('weight', isset($product) ? $product->weight : '') }}" />

                {{-- <x-currency-input label="Price per Gram" name="price_per_gram"
                    value="{{ old('price_per_gram', isset($product) ? $product->price_per_gram : '') }}" />
                <x-currency-input label="Price per Kilogram" name="price_per_kilogram"
                    value="{{ old('price_per_kilogram', isset($product) ? $product->price_per_kilogram : '') }}" /> --}}
            </x-card>
        </div>
        <div class="col-md-6 d-flex align-items-stretch">
            <x-card class="mb-3">
                <div class="card-title h4 text-muted">@lang('Stock Management')</div>

                <x-stock-input label="In Stock" name="in_stock"
                    value="{{ old('in_stock', isset($product) ? $product->in_stock : '') }}" />

                <x-checkbox label="Track Stock" name="track_stock"
                    checked="{{ isset($product) ? $product->track_stock : true }}" />



                <x-checkbox label="Keep selling when out of stock" name="continue_selling_when_out_of_stock"
                    checked="{{ isset($product) ? $product->continue_selling_when_out_of_stock : true }}" />

                <x-input label="Minimum Stock" name="minimum_stock"
                    value="{{ old('minimum_stock', isset($product) ? $product->minimum_stock : '') }}"
                    formText="If the stock reach this quantity, Stop selling" />

                <!-- <div class="row">
                    <div class="col-md-6">
                        <x-input label="Barcode" name="barcode"
                            value="{{ old('barcode', isset($product) ? $product->barcode : '') }}"
                            formText="You can also use a scanner" />
                    </div>
                    <div class="col-md-6">
                        <x-input label="SKU" name="sku"
                            value="{{ old('sku', isset($product) ? $product->sku : '') }}" />
                    </div>
                </div> -->

                {{-- <div class="row">
                    <div class="col-md-6">
                        <x-input label="Retail Barcode" name="retail_barcode"
                            value="{{ old('retail_barcode', isset($product) ? $product->retail_barcode : '') }}"
                            formText="You can also use a scanner" />
                    </div>
                    <div class="col-md-6">
                        <x-input label="Retail SKU" name="retail_sku"
                            value="{{ old('retail_sku', isset($product) ? $product->retail_sku : '') }}" />
                    </div>
                </div> --}}

                <div class="row">
                    <div class="col-md-6">
                        <x-input label="Unit Barcode" name="unit_barcode"
                            value="{{ old('unit_barcode', isset($product) ? $product->unit_barcode : '') }}"
                            formText="You can also use a scanner" />
                    </div>
                    <div class="col-md-6">
                        <x-input label="Unit SKU" name="unit_sku"
                            value="{{ old('unit_sku', isset($product) ? $product->unit_sku : '') }}" />
                    </div>
                </div>


                {{-- <div class="row">
                    <div class="col-md-6">
                        <x-input label="Wholesale Barcode" name="wholesale_barcode"
                            value="{{ old('wholesale_barcode', isset($product) ? $product->wholesale_barcode : '') }}"
                            formText="You can also use a scanner" />
                    </div>
                    <div class="col-md-6">
                        <x-input label="Wholesale SKU" name="wholesale_sku"
                            value="{{ old('wholesale_sku', isset($product) ? $product->wholesale_sku : '') }}" />
                    </div>
                </div> --}}
                <div class="row">
                    <div class="col-md-6">
                        <x-input label="Box Barcode" name="box_barcode"
                            value="{{ old('box_barcode', isset($product) ? $product->box_barcode : '') }}"
                            formText="You can also use a scanner" />
                    </div>
                    <div class="col-md-6">
                        <x-input label="Box SKU" name="box_sku"
                            value="{{ old('box_sku', isset($product) ? $product->box_sku : '') }}" />
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <x-input label="Super Dealer Barcode" name="superdealer_barcode"
                            value="{{ old('superdealer_barcode', isset($product) ? $product->superdealer_barcode : '') }}"
                            formText="You can also use a scanner" />
                    </div>
                    <div class="col-md-6">
                        <x-input label="Super Dealer SKU" name="superdealer_sku"
                            value="{{ old('superdealer_sku', isset($product) ? $product->superdealer_sku : '') }}" />
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <x-input label="Wholesale Barcode" name="wholesale_barcode"
                            value="{{ old('wholesale_barcode', isset($product) ? $product->wholesale_barcode : '') }}"
                            formText="You can also use a scanner" />
                    </div>
                    <div class="col-md-6">
                        <x-input label="Wholesale SKU" name="wholesale_sku"
                            value="{{ old('wholesale_sku', isset($product) ? $product->wholesale_sku : '') }}" />
                    </div>
                </div>
                {{-- <div class="row">
                    <div class="col-md-6">
                        <x-input label="Price per Gram Barcode" name="pricepergram_barcode"
                            value="{{ old('pricepergram_barcode', isset($product) ? $product->pricepergram_barcode : '') }}"
                            formText="You can also use a scanner" />
                    </div>
                    <div class="col-md-6">
                        <x-input label="Price per Gram SKU" name="pricepergram_sku"
                            value="{{ old('pricepergram_sku', isset($product) ? $product->pricepergram_sku : '') }}" />
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <x-input label="Price per kilogram Barcode" name="priceperkilogram_barcode"
                            value="{{ old('priceperkilogram_barcode', isset($product) ? $product->priceperkilogram_barcode : '') }}"
                            formText="You can also use a scanner" />
                    </div>
                    <div class="col-md-6">
                        <x-input label="Price per kilogram Barcode" name="priceperkilogram_sku"
                            value="{{ old('priceperkilogram_sku', isset($product) ? $product->priceperkilogram_sku : '') }}" />
                    </div>
                </div> --}}
                {{-- add bar code print button --}}
                <div class="row">
                    <div class="col-md-6">
                        <button type="button"
                            class="btn btn-primary btn-block d-flex align-items-center mx-3 mt-3 w-75 h-12"
                            onclick="printBarCode('unit_barcode')">
                            @lang('Unit Barcode Print')
                        </button>
                    </div>
                    <div class="col-md-6">
                        <button type="button"
                            class="btn btn-primary btn-block d-flex align-items-center mx-3 mt-3 w-75 h-12"
                            onclick="printBarCode('box_barcode')">
                            @lang('Box Barcode Print')
                        </button>
                    </div>
                    <div class="col-md-6">
                        <button type="button"
                            class="btn btn-primary btn-block d-flex align-items-center mx-3 mt-3 w-75 h-12"
                            onclick="printBarCode('superdealer_barcode')">
                            @lang('Super Dealer Barcode Print')
                        </button>
                    </div>
                    <div class="col-md-6">
                        <button type="button"
                            class="btn btn-primary btn-block d-flex align-items-center mx-3 mt-3 w-75 h-12"
                            onclick="printBarCode('wholesale_barcode')">
                            @lang('WholeSale Barcode Print')
                        </button>
                    </div>
                    {{-- <div class="col-md-6">
                        <button type="button" class="btn btn-primary px-4 d-flex align-items-center mx-3 mt-3 w-full h-12"
                            onclick="printBarCode('pricepergram_barcode')">
                            @lang('Price per Gram Barcode Print')
                        </button>
                    </div>
                    <div class="col-md-6">
                        <button type="button" class="btn btn-primary px-4 d-flex align-items-center mx-3 mt-3 w-full h-12"
                            onclick="printBarCode('priceperkilogram_sku')">
                            @lang('Price per Kilogram Barcode Print')
                        </button>
                    </div> --}}
                </div>
            </x-card>
        </div>
    </div>
    
    <div class="row">
        <x-card class="mb-3">
            <div class="mb-5">
                <label for="image" class="form-label">@lang('Image')</label>
                <input class="form-control @error('image') is-invalid @enderror" name="image" type="file"
                    id="image-input" accept="image/png, image/jpeg">
                @error('image')
                    <div class="invalid-feedback">
                        {{ $message }}
                    </div>
                @else
                    <div id="imageHelp" class="form-text">@lang('Choose an image')</div>
                @enderror
            </div>
            <div class="mb-5 text-center">
                <div class="mb-3">
                    @isset($product)
                        <img src="{{ $product->image_url }}" height="250"
                            class="object-fit-cover border rounded  @if (!$product->image_path) d-none @endif"
                            alt="{{ $product->name }}" id="image-preview">
                    @else
                        <img src="#" height="250" class="object-fit-cover border rounded  d-none" alt="image"
                            id="image-preview">
                    @endisset
                </div>
                @isset($product)
                    @if ($product->image_path)
                        <div class="mb-3">
                            <button type="button" class="btn btn-danger btn-sm" data-bs-toggle="modal"
                                data-bs-target="#removeCategoryImageModal">
                                @lang('Remove Image')
                            </button>
                        </div>
                    @endif
                @endisset
            </div>
        </x-card>
    </div>
    
    <div class="row mb-100">
        <x-card class="mb-3">
            <x-save-btn>
                @lang(isset($product) ? 'Update Item' : 'Save Item')
            </x-save-btn>
        </x-card>
    </div>
</form>

@isset($product)
    <div class="modal" id="removeCategoryImageModal" tabindex="-1" aria-labelledby="removeCategoryImageModalLabel"
        aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header border-0">
                    <h5 class="modal-title" id="removeCategoryImageModalLabel">@lang('Are you sure?')</h5>
                    <button type="button" class="btn-close m-0" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form action="{{ route('products.image.destroy', $product) }}" method="POST" role="form">
                    <div class="modal-body">
                        @csrf
                        @method('DELETE')
                        @lang('You cannot undo this action!')
                    </div>
                    <div class="row p-0 m-0 border-top">
                        <div class="col-6 p-0">
                            <button type="button"
                                class="btn btn-link w-100 m-0 text-danger btn-lg text-decoration-none rounded-0 border-end"
                                data-bs-dismiss="modal">@lang('Cancel')</button>
                        </div>
                        <div class="col-6 p-0">
                            <button type="submit"
                                class="btn btn-link w-100 m-0 text-black btn-lg text-decoration-none rounded-0 border-start">
                                @lang('Remove Image')
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
@endisset
@push('script')
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            document.getElementById("image-input").onchange = function() {
                previewImage(this, document.getElementById("image-preview"))
            };
        });

        function printBarCode(value) {
            value = $(`Input[name=${value}]`).val();
            let product_name = $('Input[name=name]').val();
            let weight = $('Input[name=weight]').val();

            let htmlContent = ''
            htmlContent += `
                @if ($settings->logo)
                    <div style="text-align: center; padding-right: 1rem;padding-left: 1rem;margin-bottom: 0.5rem;">
                        {!! $settings->logo !!}
                    </div>
                @else
                    @if ($settings->storeName)
                        <div style="font-size: 1.50rem;">{{ $settings->storeName }}</div>
                    @endif
                @endif
                <div style="text-align: center; padding-right: 1rem;padding-left: 1rem;margin-bottom: 0.5rem;">
                    ${product_name}
                </div>
                <div style="text-align: center; padding-right: 1rem;padding-left: 1rem;margin-bottom: 0.5rem;">
                    ${weight}
                </div>
                <image 
                loading="lazy"
                src="https://barcode.orcascan.com/?type=code128&format=png&data=${value}" 
                width="100%"
                height="150px"
                />
                <h2 style="text-align: center;">${value}</h2>
                <div style="text-align: center; padding-right: 1rem;padding-left: 1rem;margin-bottom: 0.5rem;">
                    {{ isset($product) ? $product->expiry_date_view : '' }}
                </div>
                <div style="text-align: center; padding-right: 1rem;padding-left: 1rem;margin-bottom: 0.5rem;">
                    {{ isset($product) ? $product->description : '' }}
                </div>
                <br style="page-break-after: always;" />
            `
            let myWindow = window.open("", "BarCodeWindow2", "width=600px; height=800px;");
            myWindow.document.write(htmlContent);
        }

        // ==================
        const min_stock = $("input[name='minimum_stock']");
        let __id = $("select[name='category']").val();

        if (min_stock.val() == '') {
            $.ajax({
                url: "{{ route('categories.getMinimumStock', ':id') }}".replace(':id', __id),
                type: 'GET',
                success: function(response) {
                    // console.log(response.data.minimum_stock);
                    min_stock.val(response.data.minimum_stock);
                },
                error: function(xhr) {
                    // Handle errors
                    console.log('error');
                }
            });
        }


        // ------- onselect category -----
        $("select[name='category']").change(function() {
            let _id = $(this).val();

            $.ajax({
                url: "{{ route('categories.getMinimumStock', ':id') }}".replace(':id', _id),
                type: 'GET',
                success: function(response) {
                    // Handle the response
                    console.log(response.data.minimum_stock);
                    min_stock.val(response.data.minimum_stock);
                },
                error: function(xhr) {
                    // Handle errors
                    console.log('error');
                }
            });
        });
    </script>
@endpush
