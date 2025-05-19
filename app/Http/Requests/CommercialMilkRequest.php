<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class CommercialMilkRequest extends FormRequest
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
            'quantity_of_LP_powder' => 'required|string|max:50',
            'quantity_of_ACC_ghee' => 'required|string|max:50',
            'quantity_of_starch' => 'required|string|max:50',
            'quantity_of_stabilizer' => 'required|string|max:50',
            'quantity_of_sorbate' => 'required|string|max:50',
            'quantity_of_protin' => 'required|string|max:50',
            'quantity_of_anti_mold' => 'required|string|max:50',
            'quantity_of_water' => 'required|string|max:50',
            'final_quantity' => 'required|string|max:50',
        ];
    }
}
