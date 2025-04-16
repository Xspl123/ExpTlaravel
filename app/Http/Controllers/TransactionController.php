<?php

namespace App\Http\Controllers;

use App\Services\TransactionService;
use Illuminate\Http\Request;

class TransactionController extends Controller
{
    protected $transactionService;

    public function __construct(TransactionService $transactionService)
    {
        $this->transactionService = $transactionService;
    }

    public function uploadFile(Request $request)
    {
        $request->validate([
            'file' => 'required|file|mimes:csv,txt,xlsx|max:2048',
        ]);

        $fileData = ['file' => $request->file('file')];
        $success = $this->transactionService->uploadFile($fileData);

        if ($success) {
            return response()->json(['message' => 'File uploaded successfully.'], 200);
        }

        return response()->json(['message' => 'File upload failed.'], 500);
    }
}