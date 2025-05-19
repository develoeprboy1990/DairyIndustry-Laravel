<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class MyCountryLabnehRequest extends FormRequest
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
            'type_of_labneh' => 'required|string|max:255',
            'quantity_of_LP_powder' => 'nullable|string|max:50',
            'quantity_of_ACC_ghee' => 'nullable|string|max:50',
            'quantity_of_stabilizer' => 'nullable|string|max:50',
            'quantity_of_protein' => 'nullable|string|max:50',
            'quantity_of_anti_mold' => 'nullable|string|max:50',
            'quantity_of_qarqam' => 'nullable|string|max:50',
            'quantity_of_water' => 'nullable|string|max:50'
        ];
    }
}
