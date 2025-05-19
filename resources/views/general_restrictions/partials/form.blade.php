<form
    action="{{ isset($generalRestriction) ? route('generalRestrictions.update', $generalRestriction) : route('generalRestrictions.wstore') }}"
    method="POST" enctype="multipart/form-data" role="form">
    @csrf
    @isset($generalRestriction)
        @method('PUT')
    @endisset

    <input type="hidden" value="{{ $main_category }}" name="main_category">
    <input type="hidden" value="{{ $category?->id ?? '' }}" name="category_id">

    <!-- Type of Cheese -->
    <div class="mb-3">
        <x-select label="Product" name="id" :searchable="true">
            @isset($product)
                @foreach ($products as $nproduct)
                    <option value="{{ $nproduct->id }}" {{ $nproduct->id == $product->id ? 'selected' : '' }}>
                        {{ $nproduct->name }}
                    </option>
                @endforeach
            @else
                @foreach ($products as $nproduct)
                    <option value="{{ $nproduct->id }}">
                        {{ $nproduct->name }}
                    </option>
                @endforeach
            @endisset
        </x-select>
    </div>


    <!-- Quantity of Swedish Powder -->
    <div class="mb-3">
        <label for="in_stock" class="form-label">@lang('Stock')</label>
        <input type="text" name="in_stock" class="form-control @error('gr_stock') is-invalid @enderror"
            id="in_stock"
            value="{{ old('gr_stock', isset($generalRestriction) ? $generalRestriction->gr_stock : '') }}">
        @error('in_stock')
            <div class="invalid-feedback">
                {{ $message }}
            </div>
        @enderror
    </div>

    <!-- Quantity of ACC Butter -->
    <div class="mb-3">
        <label for="cost" class="form-label">@lang('Price')</label>
        <input type="text" name="cost" class="form-control @error('gr_price') is-invalid @enderror" id="cost"
            value="{{ old('gr_price', isset($generalRestriction) ? $generalRestriction->gr_price : '') }}">
        @error('cost')
            <div class="invalid-feedback">
                {{ $message }}
            </div>
        @enderror
    </div>



    <!-- Submit Button -->
    <div class="mb-3">
        <button type="submit" id="submit_btn" class="btn btn-primary">
            @lang(isset($generalRestriction) ? 'Update' : 'Save')
        </button>
    </div>
</form>
