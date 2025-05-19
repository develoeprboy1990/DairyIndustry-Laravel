<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class CzechCheeseRequest extends FormRequest
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
            'type_of_cheese' => 'required|string|max:255',
            'quantity_of_milk' => 'nullable|string|max:50',
            'quantity_of_swedish_powder' => 'nullable|string|max:50',
            'quantity_of_tamara_ghee' => 'nullable|string|max:50',
            'quantity_of_starch' => 'nullable|string|max:50',
            'quantity_of_stabilizer' => 'nullable|string|max:50',
            'obj_TC3' => 'nullable|string|max:50',
            'obj_704' => 'nullable|string|max:50',
            'quantity_of_salt' => 'nullable|string|max:50',
            'quantity_of_cheese' => 'nullable|string|max:50',
            'quantity_of_water' => 'nullable|string|max:50'
        ];
    }
}
