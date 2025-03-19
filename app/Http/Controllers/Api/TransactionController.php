<?php

namespace App\Http\Controllers\Api;

use App\Http\Requests\CreateTransactionRequest;
use App\Http\Requests\UpdateTransactionRequest;
use Illuminate\Http\Request;
use App\Services\TransactionService;
use App\Http\Controllers\Controller;

class TransactionController extends Controller
{
    protected $transactionService;

    public function __construct(TransactionService $transactionService)
    {
        $this->transactionService = $transactionService;
    }

    public function createTransaction(CreateTransactionRequest $request)
    {
        $validated = $request->validated();

        $result = $this->transactionService->createTransaction($validated);
        if (isset($result['error'])) {
            return response()->json(['error' => $result['error']], 400);
        }

        return response()->json(['message' => 'Transaction created successfully', 'transaction' => $result], 201);
    }

    public function getTransactions(Request $request)
    {
        $filters = [
            'search' => $request->query('search', ''),
            'page' => $request->query('page', 1),
            'limit' => $request->query('limit', 10),
        ];

        $transactions = $this->transactionService->getTransactions($filters);
        return response()->json([
            'message' => 'Transactions retrieved successfully',
            'transactions' => $transactions->items(),
            'total' => $transactions->total(),
            'totalPages' => $transactions->lastPage(),
            'currentPage' => $transactions->currentPage(),
        ], 200);
    }

    public function updateTransaction(UpdateTransactionRequest $request, $id)
    {
        $validated = $request->validated();

        $result = $this->transactionService->updateTransaction($id, $validated);
        if (isset($result['error'])) {
            return response()->json(['error' => $result['error']], 400);
        }

        return response()->json(['message' => 'Transaction updated successfully', 'transaction' => $result], 200);
    }

    public function deleteTransaction($id)
    {
        $result = $this->transactionService->deleteTransaction($id);
        if (isset($result['error'])) {
            return response()->json(['error' => $result['error']], 404);
        }

        return response()->json(['message' => 'Transaction deleted successfully'], 200);
    }
}