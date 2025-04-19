<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;
use Illuminate\Support\Facades\Auth;

class CreateTransactionRequest extends FormRequest
{
    
    public function authorize()
    {
        return true;
    }


    public function rules()
    {
        return [
            'amount' => 'required|numeric|min:1',
            'transaction_date' => 'required|date',
            'description' => 'required|string|max:255',
            'category_id' => [
                'required',
                Rule::exists('categories', 'id')->where(function ($query) {
                    return $query->where('user_id', Auth::id());
                }),
            ],
            'account_id' => [
                'required',
                Rule::exists('accounts', 'id')->where(function ($query) {
                    return $query->where('user_id', Auth::id());
                }),
            ],
        ];
    }
}