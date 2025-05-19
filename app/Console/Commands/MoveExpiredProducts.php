<?php

    namespace App\Console\Commands;
    
    use Illuminate\Console\Command;
    use App\Models\Product;
    use App\Models\ExpiredProduct;
    use Carbon\Carbon;
    
    class MoveExpiredProducts extends Command
    {
        /**
         * The name and signature of the console command.
         *
         * @var string
         */
        protected $signature = 'app:move-expired-products';
    
        /**
         * The console command description.
         *
         * @var string
         */
        protected $description = 'Move expired products to the expired_products table';
    
        /**
         * Execute the console command.
         *
         * @return int
         */
        public function handle()
        {
            // Fetch all expired products not yet marked as expired
            $expiredProducts = Product::where('expiry_date', '<', Carbon::now())
                ->where('expired', false)
                ->get();
    
            if ($expiredProducts->isEmpty()) {
                $this->info('No expired products found.');
                return 0;
            }
    
            foreach ($expiredProducts as $product) {
                // Insert into the expired_products table
                 $currentStock = $product->in_stock;
                
                $expired = ExpiredProduct::create([
                    'product_id' => $product->id,
                    'expired_stock' => $product->in_stock,
                    'expiry_date' => $product->expiry_date,
                    'trash' => false,                     
                    'reproduce' => false,                  
                ]);
                    
                // Update the product as expired
                $product->update([
                    'expired_stock' => $currentStock,
                    'in_stock' => 0,
                    'expired' => true,
                    'expired_product_id' => $expired->id,
                ]);
            }
    
            $this->info(count($expiredProducts) . ' expired products moved successfully!');
            return 0;
        }
    }
