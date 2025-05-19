<form action="{{ isset($car) ? route('cars.update', $car) : route('cars.store') }}" method="POST"
    enctype="multipart/form-data" role="form">
    @csrf
    @isset($car)
        @method('PUT')
    @endisset

    <div class="mb-3">
        <label for="car_type" class="form-label">@lang('Car Type')</label>
        <input type="text" name="car_type" class="form-control @error('car_type') is-invalid @enderror" id="car_type"
            value="{{ old('car_type', isset($car) ? $car->car_type : '') }}">
        @error('car_type')
            <div class="invalid-feedback">
                {{ $message }}
            </div>
        @enderror
    </div>

    <div class="mb-3">
        <label for="car_name" class="form-label">@lang('Car Name')</label>
        <input type="text" name="car_name" class="form-control @error('car_name') is-invalid @enderror"
            id="car_name" value="{{ old('car_name', isset($car) ? $car->car_name : '') }}">
        @error('car_name')
            <div class="invalid-feedback">
                {{ $message }}
            </div>
        @enderror
    </div>

    <div class="mb-3">
        <label for="car_driver_name" class="form-label">@lang('Driver Name')</label>
        <input type="text" name="car_driver_name" class="form-control @error('car_driver_name') is-invalid @enderror"
            id="car_driver_name" value="{{ old('car_driver_name', isset($car) ? $car->car_driver_name : '') }}">
        @error('car_driver_name')
            <div class="invalid-feedback">
                {{ $message }}
            </div>
        @enderror
    </div>

    <div class="mb-3">
        <label for="car_driver_phone" class="form-label">@lang('Driver Phone')</label>
        <input type="text" name="car_driver_phone"
            class="form-control @error('car_driver_phone') is-invalid @enderror" id="car_driver_phone"
            value="{{ old('car_driver_phone', isset($car) ? $car->car_driver_phone : '') }}">
        @error('car_driver_phone')
            <div class="invalid-feedback">
                {{ $message }}
            </div>
        @enderror
    </div>

    <div class=" table-responsive mb-3">
        <label for="" class="form-label">@lang('Select Poduct')</label>
        <table class="table table-bordered mb-1" id="table-items">
            <thead>
                <tr>
                    <th class=" text-center text-decoration-none fw-bold">@lang('Item')</th>
                    <th class=" text-center text-decoration-none fw-bold">@lang('Quantity')</th>
                    <th class=" text-center text-decoration-none fw-bold"></th>
                </tr>
            </thead>
            <tbody id="tbody">
                <tr>
                    <td>
                        <select label="Product Name" name="item[]" class="form-control">
                            <option value="" disabled selected>Select One</option>

                            @if ($coolingRoomProducts->isNotEmpty())
                                <optgroup label="Cooling Room Products">
                                    @foreach ($coolingRoomProducts as $product)
                                        <option value="{{ $product->id }}"
                                            {{ old('product_name', isset($car) ? $car->product_id : '') == $product->id ? 'selected' : '' }}>
                                            {{ $product->product_name }}
                                        </option>
                                    @endforeach
                                </optgroup>
                            @endif
                            @if ($cat_warehouseProducts->isNotEmpty())
                                <optgroup label="Plastics">
                                    @foreach ($cat_warehouseProducts as $product)
                                        <option value="{{ $product->id }}"
                                            {{ old('product_name', isset($car) ? $car->product_id : '') == $product->id ? 'selected' : '' }}>
                                            {{ $product->product_name }}
                                        </option>
                                    @endforeach
                                </optgroup>
                            @endif
                        </select>

                    </td>
                    <td>
                        <input type="text" class="form-control input-stock focus-select-text text-center"
                            name="quantity[]" required>
                    </td>
                    <td></td>
                </tr>
            </tbody>
        </table>
        <button type="button" class="btn btn-primary btn-xs" id="btn-new-item">+ @lang('Add New Item')</button>
    </div>

    <x-date-input label="Date" name="stock_date"
        value="{{ old('stock_date', isset($car) ? $car->stock_date : '') }}" />

    <div class="mb-3">
        <x-save-btn>
            @lang(isset($car) ? 'Update Car' : 'Save Car')
        </x-save-btn>
    </div>
</form>

@push('script')
    <script>
        var tbody = document.querySelector('#tbody');
        var newItemBtn = document.querySelector('#btn-new-item');
        newItemBtn.addEventListener('click', function() {
            tbody.insertAdjacentHTML(
                'beforeend',
                '<tr><td><select label="Product Name" name="item[]" class="form-control"><option value = "" disabled selected > Select One </option> @if ($coolingRoomProducts->isNotEmpty()) <optgroup label = "Cooling Room Products" > @foreach ($coolingRoomProducts as $product) <option value = "{{ $product->id }}" {{ old('product_name', isset($car) ? $car->product_id : '') == $product->id ? 'selected' : '' }} > {{ $product->product_name }} </option>@endforeach </optgroup>@endif @if ($cat_warehouseProducts->isNotEmpty()) <optgroup label = "Plastics" >@foreach ($cat_warehouseProducts as $product)<option value = "{{ $product->id }}" {{ old('product_name', isset($car) ? $car->product_id : '') == $product->id ? 'selected' : '' }}>{{ $product->product_name }} </option> @endforeach </optgroup>@endif </select></td>' +
                '<td><input type="text" class=" form-control input-stock focus-select-text text-center" name="quantity[]" required></td>' +
                '<td><button type="button" class="btn btn-link p-0 text-danger btn-remove"><svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="hero-icon-sm"><path stroke-linecap="round" stroke-linejoin="round" d="M15 12H9m12 0a9 9 0 11-18 0 9 9 0 0118 0z" /></svg></button></td></tr>'
            );

            var keys = '0123456789.';
            var checkInputNumber = function(e) {
                var key = typeof e.which == 'number' ? e.which : e.keyCode;
                var start = this.selectionStart,
                    end = this.selectionEnd;
                var filtered = this.value.split('').filter(filterInput);
                this.value = filtered.join('');
                var move = filterInput(String.fromCharCode(key)) || key == 0 || key == 8 ? 0 : 1;
                this.setSelectionRange(start - move, end - move);
            };
            var filterInput = function(val) {
                return keys.indexOf(val) > -1;
            };
            var formControlOnFocusList = [].slice.call(document.querySelectorAll('.focus-select-text'));
            formControlOnFocusList.map(function(formControlOnFocusElement) {
                formControlOnFocusElement.addEventListener('focus', () => {
                    formControlOnFocusElement.select();
                });
            });
            var numberInputList = [].slice.call(document.querySelectorAll('.input-number'));
            numberInputList.map(function(numberInputElement) {
                numberInputElement.addEventListener('input', checkInputNumber);
            });

            var stockKeys = '0123456789.-';
            var checkInputStock = function(e) {
                var key = typeof e.which == 'number' ? e.which : e.keyCode;
                var start = this.selectionStart,
                    end = this.selectionEnd;
                var filtered = this.value.split('').filter(filterInputStock);
                this.value = filtered.join('');
                var move = filterInputStock(String.fromCharCode(key)) || key == 0 || key == 8 ? 0 : 1;
                this.setSelectionRange(start - move, end - move);
            };
            var filterInputStock = function(val) {
                return stockKeys.indexOf(val) > -1;
            };

            var stockInputList = [].slice.call(document.querySelectorAll('.input-stock'));
            stockInputList.map(function(numberInputElement) {
                numberInputElement.addEventListener('input', checkInputStock);
            });
        });
        document.addEventListener('click', function(event) {
            if (event.target.matches('.btn-remove, .btn-remove *')) {
                event.target.closest('tr').remove();
            }
        }, false);
    </script>
@endpush
