<form action="{{route('milk_detail.update', $details)}}" method="POST" role="form">
    @csrf
    @isset($details)
        @method('PUT')
    @endisset
    <div class="row">
        <input name="day" type="hidden" value="{{$day}}" />
        <div class="col-md-12">
            <x-input label="Milk 1st Qty" name="1_qty" id="first_qty"
                value="{{ old('1_qty_'.$day, isset($details) ? $details['1_qty_'.$day] : '') }}" />
        </div>
        <div class="col-md-12">
            <x-input label="Milk 1st Temperature" name="1_temperature"
                value="{{ old('1_temperature_'.$day, isset($details) ? $details['1_temperature_'.$day] : '') }}" />
        </div>
        <div class="col-md-12">
            <x-input label="Milk 1st Water %" name="1_water" type="number"
                value="{{ old('1_water_'.$day, isset($details) ? $details['1_water_'.$day] : '') }}" />
        </div>

        <div class="col-md-12">
            <x-input label="Milk 2nd Qty" name="2_qty" id="second_qty"
                value="{{ old('2_qty_'.$day, isset($details) ? $details['2_qty_'.$day] : '') }}" />
        </div>
        <div class="col-md-12">
            <x-input label="Milk 2nd Temperature" name="2_temperature"
                value="{{ old('2_temperature_'.$day, isset($details) ? $details['2_temperature_'.$day] : '') }}" />
        </div>
        <div class="col-md-12">
            <x-input label="Milk 2nd Water %" name="2_water" type="number"
                value="{{ old('2_water_'.$day, isset($details) ? $details['2_water_'.$day] : '') }}" />
        </div>
    </div>

    <div class="mb-3">
        <x-save-btn>
            @lang('Update Milk Details')
        </x-save-btn>
    </div>
</form>
@push('script')
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const first_qtyInput = document.getElementById('first_qty');
            const second_qtyInput = document.getElementById('second_qty');

            function updateValues() {
                const first_qtyNum = parseFloat(first_qtyInput.value) || 0;
                const second_qtyNum = parseFloat(second_qtyInput.value) || 0;

                // Update total loss (example calculation)
                const totalLoss = first_qtyNum * 0.98;
                second_qtyInput.value = totalLoss;
            }

            first_qtyInput.addEventListener('input', updateValues);

            // Initial update
            updateValues();
        });
    </script>
@endpush
