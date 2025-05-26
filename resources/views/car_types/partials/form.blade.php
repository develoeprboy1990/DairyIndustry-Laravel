<form
    action="{{ isset($carType) ? route('car-types.update', $carType) : route('car-types.store') }}"
    method="POST" role="form">
    @csrf
    @isset($carType)
        @method('PUT')
    @endisset

    <!-- Car Name -->
    <div class="mb-3">
        <label for="name" class="form-label">@lang('Car Name') (*)</label>
        <input type="text" name="name" class="form-control @error('name') is-invalid @enderror"
            id="name" value="{{ old('name', isset($carType) ? $carType->name : '') }}" required>
        @error('name')
            <div class="invalid-feedback">
                {{ $message }}
            </div>
        @enderror
    </div>

    <!-- Plate Number -->
    <div class="mb-3">
        <label for="plate_number" class="form-label">@lang('Plate Number') (*)</label>
        <input type="text" name="plate_number" class="form-control @error('plate_number') is-invalid @enderror"
            id="plate_number" value="{{ old('plate_number', isset($carType) ? $carType->plate_number : '') }}" required>
        @error('plate_number')
            <div class="invalid-feedback">
                {{ $message }}
            </div>
        @enderror
    </div>

    <!-- Model -->
    <div class="mb-3">
        <label for="model" class="form-label">@lang('Model')</label>
        <input type="text" name="model" class="form-control @error('model') is-invalid @enderror"
            id="model" value="{{ old('model', isset($carType) ? $carType->model : '') }}">
        @error('model')
            <div class="invalid-feedback">
                {{ $message }}
            </div>
        @enderror
    </div>

    <!-- Status -->
    <div class="mb-3">
        <label for="status" class="form-label">@lang('Status_1') (*)</label>
        <select class="form-select @error('status') is-invalid @enderror" id="status" name="status" required>
            @isset($carType)
                <option value="available" @if($carType->status == 'available') selected @endif>@lang('Available')</option>
                <option value="unavailable" @if($carType->status == 'unavailable') selected @endif>@lang('Unavailable')</option>
            @else
                <option value="available" {{ old('status') == 'available' ? 'selected' : '' }}>@lang('Available')</option>
                <option value="unavailable" {{ old('status') == 'unavailable' ? 'selected' : '' }}>@lang('Unavailable')</option>
            @endisset
        </select>
        @error('status')
            <div class="invalid-feedback">
                {{ $message }}
            </div>
        @enderror
    </div>

    <!-- Description -->
    <div class="mb-3">
        <label for="description" class="form-label">@lang('Description')</label>
        <textarea name="description" class="form-control @error('description') is-invalid @enderror" id="description" rows="3">{{ old('description', isset($carType) ? $carType->description : '') }}</textarea>
        @error('description')
            <div class="invalid-feedback">
                {{ $message }}
            </div>
        @enderror
    </div>

    <!-- Submit Button -->
    <div class="mb-3">
        <button type="submit" class="btn btn-primary">
            @lang(isset($carType) ? 'Update Car Type' : 'Save Car Type')
        </button>
    </div>
</form>