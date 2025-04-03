<?php

namespace App\Services;

use App\Repositories\Interfaces\TransactionRepositoryInterface;
use App\Repositories\Interfaces\AccountRepositoryInterface;
use App\Repositories\Interfaces\CategoryRepositoryInterface;

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use App\Models\Transaction;
use App\Models\Budget;
use App\Models\Account;


class TransactionService
{
    protected $transactionRepository;
    protected $accountRepository;
    protected $categoryRepository;

    public function __construct(TransactionRepositoryInterface $transactionRepository, AccountRepositoryInterface $accountRepository, CategoryRepositoryInterface $categoryRepository)
    {
        $this->transactionRepository = $transactionRepository;
        $this->accountRepository = $accountRepository;
        $this->categoryRepository = $categoryRepository;
    }

    // public function createTransaction(array $data)
    // {
    //     $data['user_id'] = Auth::id();

    //     $budget = $this->transactionRepository->findBudgetByCategory($data['category_id']);

    //     if (!$budget) {
    //         // Agar budget exist nahi karta, to naya budget entry karein
    //         $budget = $this->transactionRepository->createBudget([
    //             'category_id'   => $data['category_id'],
    //             'user_id'       => $data['user_id'],
    //             'budget_amount' => 0, // Default budget_amount
    //             'total_amount'  => 0  // Default total_amount
    //         ]);
    //     }

    //     $newTotalAmount = ($budget->total_amount ?? 0) + $data['amount'];

    //     if ($budget->budget_amount > 0 && $newTotalAmount > $budget->budget_amount) {
    //         return ['error' => 'Budget exceeded for this category!'];
    //     }

    //     $transaction = $this->transactionRepository->create($data);

    //     if ($budget) {
    //         $this->transactionRepository->updateBudget($budget, $newTotalAmount);
    //     }

    //     return $transaction;
    // }

    public function createTransaction(array $data)
    {
        $data['user_id'] = Auth::id();

        // ✅ Find the account
        $account = $this->accountRepository->findById($data['user_id'], $data['account_id']);
        if (!$account) {
            return ['error' => 'Invalid account!'];
        }

        // ✅ Find the category
        $category = $this->categoryRepository->findById(Auth::id(), $data['category_id']);
        if (!$category) {
            return ['error' => 'Invalid category!'];
        }

        // ✅ Find or create budget entry
        $budget = $this->transactionRepository->findBudgetByCategory($data['category_id']);
        $newTotalAmount = ($budget->total_amount ?? 0) + $data['amount'];

        if ($budget && $budget->budget_amount > 0 && $newTotalAmount > $budget->budget_amount) {
            return ['error' => 'Budget exceeded for this category!'];
        }

        // ✅ Check & update account balance based on transaction type
        if ($category->type === 'Expense') {
            if ($account->account_balance < $data['amount']) {
                return ['error' => 'Insufficient balance in account!'];
            }
            $account->account_balance -= $data['amount']; // Deduct for expense
        } else {
            $account->account_balance += $data['amount']; // Add for income
        }

        // ✅ Save updated account balance
        $account->save();

        // ✅ Create transaction
        $transaction = $this->transactionRepository->create($data);

        // ✅ Update budget
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
