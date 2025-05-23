<form
    action="{{ isset($driver) ? route('drivers.update', $driver) : route('drivers.store') }}"
    method="POST" role="form">
    @csrf
    @isset($driver)
        @method('PUT')
    @endisset

    <!-- Driver Name -->
    <div class="mb-3">
        <label for="name" class="form-label">@lang('Driver Name') (*)</label>
        <input type="text" name="name" class="form-control @error('name') is-invalid @enderror"
            id="name" value="{{ old('name', isset($driver) ? $driver->name : '') }}" required>
        @error('name')
            <div class="invalid-feedback">
                {{ $message }}
            </div>
        @enderror
    </div>

    <!-- Phone -->
    <div class="mb-3">
        <label for="phone" class="form-label">@lang('Phone')</label>
        <input type="text" name="phone" class="form-control @error('phone') is-invalid @enderror"
            id="phone" value="{{ old('phone', isset($driver) ? $driver->phone : '') }}">
        @error('phone')
            <div class="invalid-feedback">
                {{ $message }}
            </div>
        @enderror
    </div>

    <!-- License Number -->
    <div class="mb-3">
        <label for="license_number" class="form-label">@lang('License Number')</label>
        <input type="text" name="license_number" class="form-control @error('license_number') is-invalid @enderror"
            id="license_number" value="{{ old('license_number', isset($driver) ? $driver->license_number : '') }}">
        @error('license_number')
            <div class="invalid-feedback">
                {{ $message }}
            </div>
        @enderror
    </div>

    <!-- Status -->
    <div class="mb-3">
        <label for="status" class="form-label">@lang('Status_1') (*)</label>
        <select class="form-select @error('status') is-invalid @enderror" id="status" name="status" required>
            @isset($driver)
                <option value="active" @if($driver->status == 'active') selected @endif>@lang('Active')</option>
                <option value="inactive" @if($driver->status == 'inactive') selected @endif>@lang('Inactive')</option>
            @else
                <option value="active" {{ old('status') == 'active' ? 'selected' : '' }}>@lang('Active')</option>
                <option value="inactive" {{ old('status') == 'inactive' ? 'selected' : '' }}>@lang('Inactive')</option>
            @endisset
        </select>
        @error('status')
            <div class="invalid-feedback">
                {{ $message }}
            </div>
        @enderror
    </div>

    <!-- Notes -->
    <div class="mb-3">
        <label for="notes" class="form-label">@lang('Notes')</label>
        <textarea name="notes" class="form-control @error('notes') is-invalid @enderror" id="notes" rows="3">{{ old('notes', isset($driver) ? $driver->notes : '') }}</textarea>
        @error('notes')
            <div class="invalid-feedback">
                {{ $message }}
            </div>
        @enderror
    </div>

    <!-- Submit Button -->
    <div class="mb-3">
        <button type="submit" class="btn btn-primary">
            @lang(isset($driver) ? 'Update Driver' : 'Save Driver')
        </button>
    </div>
</form>