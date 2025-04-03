<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class AccountRequest extends FormRequest
{
    public function authorize(): bool
    {
        return true;
    }

    public function rules(): array
    {
        return [
           'account_name' => 'required|string|max:255|unique:accounts,account_name',
            'account_balance' => 'nullable',
        ];
    }
}
