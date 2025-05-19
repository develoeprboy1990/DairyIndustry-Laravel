<form
    action="{{ isset($plasticBucket) ? route('plasticBuckets.update', $plasticBucket) : route('plasticBuckets.store') }}"
    method="POST" enctype="multipart/form-data" role="form">
    @csrf
    @isset($plasticBucket)
        @method('PUT')
    @endisset

    <div class="mb-3">
        <label for="category_name" class="form-label">@lang('Category Name')</label>
        <input type="text" name="category_name" class="form-control @error('category_name') is-invalid @enderror"
            id="category_name"
            value="{{ old('category_name', isset($plasticBucket) ? $plasticBucket->category_name : '') }}">
        @error('category_name')
            <div class="invalid-feedback">
                {{ $message }}
            </div>
        @enderror
    </div>

    <div class="mb-3">
        <label for="stock" class="form-label">@lang('Stock')</label>
        <input type="text" name="stock" class="form-control @error('stock') is-invalid @enderror" id="stock"
            value="{{ old('stock', isset($plasticBucket) ? $plasticBucket->stock : '') }}">
        @error('stock')
            <div class="invalid-feedback">
                {{ $message }}
            </div>
        @enderror
    </div>

    <div class="mb-3">
        <x-save-btn>
            @lang(isset($plasticBucket) ? 'Update Category' : 'Save Category')
        </x-save-btn>
    </div>
</form>
