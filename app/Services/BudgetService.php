<?php

namespace App\Services;

use App\Repositories\BudgetRepositoryInterface;
use App\Models\Budget;
use Illuminate\Support\Collection;

class BudgetService
{
    private BudgetRepositoryInterface $budgetRepository;

    public function __construct(BudgetRepositoryInterface $budgetRepository)
    {
        $this->budgetRepository = $budgetRepository;
    }

    public function createBudget(array $data): Budget
    {
        return $this->budgetRepository->create($data);
    }

    public function getUserBudgets(int $userId, ?string $search = null, int $page = 1, int $limit = 10): array
    {
        return $this->budgetRepository->getAll($userId, $search, $page, $limit);
    }

    public function getBudgetById(int $userId, int $id): ?Budget
    {
        return $this->budgetRepository->findById($userId, $id);
    }

    public function updateBudget(int $userId, int $id, array $data): bool
    {
        return $this->budgetRepository->update($userId, $id, $data);
    }

    public function deleteBudget(int $userId, int $id): bool
    {
        return $this->budgetRepository->delete($userId, $id);
    }
}
