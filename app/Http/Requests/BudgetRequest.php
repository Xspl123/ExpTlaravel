<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class BudgetRequest extends FormRequest
{
    public function authorize(): bool
    {
        return true; // Change this if you need authorization logic
    }

    public function rules(): array
    {
        return [
            'category_id'   => 'required|exists:categories,id',
            'total_amount'  => 'required|numeric|min:0',
            'budget_amount' => 'nullable|numeric|min:0',
        ];
    }
}
