<div class="row">
    {{-- <div class="col-md-12 mb-2 text-muted small">@lang('Other Info')</div> --}}

    {{-- <div class="col-md-12 mb-3">
        <label for="available_buckets" class="form-label">@lang('Number of Buckets')</label>
        <input type="text" name="available_buckets"
            class="form-control @error('available_buckets') is-invalid @enderror" id="available_buckets"
            value="{{ old('available_buckets', isset($customer) ? $customer->available_buckets : '') }}">
        @error('available_buckets')
            <div class="invalid-feedback">
                {{ $message }}
            </div>
        @enderror
    </div> --}}

    <div class="col-md-12 mb-3">
        <div class="mb-2"><label for="packet_type" class="form-label">@lang('Packet Types')</label></div>
        <div class="row">
            @foreach ($plasticBuckets as $bucket)
                <div class="form-group col-md-3">
                    <label for="bucket_{{ $bucket->id }}">{{ $bucket->category_name }}</label>
                    <input type="number" name="plastic_bucket_stock[{{ $bucket->id }}]" id="bucket_{{ $bucket->id }}"
                        class="form-control"
                        value="{{ old('stock', isset($plasticBucketStock) ? $plasticBucketStock[$bucket->id] : '') }}"
                        min="0">
                </div>
            @endforeach
        </div>
    </div>


    <div class="col-md-12 mb-3">
        <label for="tax_identification_number" class="form-label">@lang('Tax ID Number')</label>
        <input type="text" name="tax_identification_number"
            class="form-control @error('tax_identification_number') is-invalid @enderror" id="tax_identification_number"
            value="{{ old('tax_identification_number', isset($customer) ? $customer->tax_identification_number : '') }}">
        @error('tax_identification_number')
            <div class="invalid-feedback">
                {{ $message }}
            </div>
        @enderror
    </div>
    <div class="col-md-12 mb-3">
        <label for="notes" class="form-label">@lang('Notes')</label>
        <textarea name="notes" id="notes" class="form-control @error('notes') is-invalid @enderror" rows="3">{{ old('notes', isset($customer) ? $customer->notes : '') }}</textarea>

        @error('notes')
            <div class="invalid-feedback">
                {{ $message }}
            </div>
        @enderror
    </div>
</div>
