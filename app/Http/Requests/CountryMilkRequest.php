<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class CountryMilkRequest extends FormRequest
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
            'type_of_milk' => 'required|string|max:255',
            'qty_lp_powder' => 'nullable|string|max:50',
            'qty_natural_milk' => 'nullable|string|max:50',
            'qty_ACC_ghee' => 'nullable|string|max:50',
            'qty_stabilizer' => 'nullable|string|max:50',
            'qty_protein' => 'nullable|string|max:50',
            'qty_anti_mold' => 'nullable|string|max:50',
            'qty_water' => 'nullable|string|max:50'
        ];
    }
}
