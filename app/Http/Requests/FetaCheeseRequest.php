<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class FetaCheeseRequest extends FormRequest
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
            'quantity_milk' => 'nullable|string|max:50',
            'quantity_swedish_powder' => 'nullable|string|max:50',
            'quantity_ACC_ghee' => 'nullable|string|max:50',
            'quantity_protein' => 'nullable|string|max:50',
            'quantity_stabilizer' => 'nullable|string|max:50',
            'quantity_GBL' => 'nullable|string|max:50',
            'quantity_cheese' => 'nullable|string|max:50',
            'quantity_water' => 'nullable|string|max:50',
            'quantity_produced' => 'nullable|string|max:50'
        ];
    }
}
