<?php

namespace App\Services;

use App\Repositories\Interfaces\TransactionRepositoryInterface;
use Illuminate\Support\Facades\Auth;

class TransactionService
{
    protected $transactionRepository;

    public function __construct(TransactionRepositoryInterface $transactionRepository)
    {
        $this->transactionRepository = $transactionRepository;
    }

    public function createTransaction(array $data)
    {
        $data['user_id'] = Auth::id();

        $budget = $this->transactionRepository->findBudgetByCategory($data['category_id']);

        if (!$budget) {
            // Agar budget exist nahi karta, to naya budget entry karein
            $budget = $this->transactionRepository->createBudget([
                'category_id'   => $data['category_id'],
                'user_id'       => $data['user_id'],
                'budget_amount' => 0, // Default budget_amount
                'total_amount'  => 0  // Default total_amount
            ]);
        }

        $newTotalAmount = ($budget->total_amount ?? 0) + $data['amount'];

        if ($budget->budget_amount > 0 && $newTotalAmount > $budget->budget_amount) {
            return ['error' => 'Budget exceeded for this category!'];
        }

        $transaction = $this->transactionRepository->create($data);

        if ($budget) {
            $this->transactionRepository->updateBudget($budget, $newTotalAmount);
        }

        return $transaction;
    }


    public function getTransactions($filters)
    {
        return $this->transactionRepository->getAllTransactions($filters);
    }

    public function updateTransaction($id, array $data)
    {
        $transaction = $this->transactionRepository->findById($id);
        if (!$transaction) return ['error' => 'Transaction not found'];

        return $this->transactionRepository->update($id, $data);
    }

    public function deleteTransaction($id)
    {
        $transaction = $this->transactionRepository->findById($id);
        if (!$transaction) return ['error' => 'Transaction not found'];

        $budget = $this->transactionRepository->findBudgetByCategory($transaction->category_id);
        if ($budget) {
            $newTotalAmount = $budget->total_amount - $transaction->amount;
            $this->transactionRepository->updateBudget($budget, $newTotalAmount);
        }

        return $this->transactionRepository->delete($id);
    }
}
