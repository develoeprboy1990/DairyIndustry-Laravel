 <h1>Edit Expired Product</h1>
 <form action="{{ route('expired-products.update', $expiredProduct->id) }}" method="POST">
     @csrf
     @method('PUT')
     <div class="row">
         <div class="col-md-12 d-flex align-items-stretch">
             <x-card class="mb-3">

                 <div class="row mb-100 ">
                     <div class="col-md-6 d-flex align-items-stretch mb-4">
                         <h3> {{ optional($expiredProduct->product)->name ?? 'N/A' }}</h3>
                     </div>
                 </div>

                 <div class="row">
                     <div class="col-md-6 d-flex align-items-stretch">
                         <x-number-input label="Expired Stock" name="expired_stock"
                             value="{{ old('expired_stock', isset($expiredProduct) ? $expiredProduct->expired_stock : 10) }}" />
                     </div>
                     <div class="col-md-6 d-flex align-items-stretch">
                         <x-input type="date" label="Expired Date" name="expiry_date"
                             value="{{ old('expiry_date', optional($expiredProduct->expiry_date)->format('Y-m-d')) }}" />
                     </div>
                 </div>
             </x-card>
         </div>
     </div>
     <div class="row mb-100">
         <x-card class="mb-3">
             <x-save-btn>
                 @lang(isset($product) ? 'Update Item' : 'Save Item')
             </x-save-btn>
         </x-card>
     </div>
     <!-- <a href="{{ route('expired-products.index') }}">Cancel</a> -->
 </form>