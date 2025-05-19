<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class CarRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\Rule|array|string>
     */
    public function rules(): array
    {
        return [
            'car_type' => 'required|string|max:250',
            'car_name' => 'required|string|max:250',
            'car_driver_name' => 'required|string|max:250',
            'car_driver_phone' => 'required|string|max:50',

            // 'product_id' => 'required|string|max:150',
            // 'product_stock' => 'required|string|max:50',
            'item.*' => ['required', 'string'],
            'quantity.*' => ['nullable', 'numeric', 'min:0'],


            'stock_date' => 'required|date',
        ];
    }
}
