<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class UpdateMounehIndustryRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
        // return auth()->user() && auth()->user()->is_admin; // Example condition
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\Rule|array|string>
     */
    public function rules(): array
    {
        return [
            'type_of_mouneh' => 'required|string|max:255',
            'quantity_of_fruit_vegetable' => 'nullable|string|max:255',
            'quantity_of_sugar_salt' => 'nullable|string|max:255',
            'quantity_of_acid' => 'nullable|string|max:255',
            'glass_used' => 'nullable|boolean',
            'final_quantity' => 'nullable|string|max:50',
        ];
    }
}
