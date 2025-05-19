<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class WhiteCheeseRequest extends FormRequest
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
            'quantity_of_cylinder_powder' => 'nullable|string|max:50',
            'quantity_of_ACC_ghee' => 'nullable|string|max:50',
            'quantity_of_starch' => 'nullable|string|max:50',
            'quantity_of_stabilizer' => 'nullable|string|max:50',
            'quantity_of_protein' => 'nullable|string|max:50',
            'quantity_of_calcium' => 'nullable|string|max:50',
            'quantity_of_water' => 'nullable|string|max:50',
            'quantity_of_salt' => 'nullable|string|max:50'
        ];
    }
}
