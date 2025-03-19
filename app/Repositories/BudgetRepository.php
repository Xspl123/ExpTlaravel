<?php

namespace App\Repositories;

use App\Models\Budget;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Support\Collection;

class BudgetRepository implements BudgetRepositoryInterface
{
    public function create(array $data): Budget
    {
        return Budget::create($data);
    }

    public function getAll(int $userId, ?string $search = null, int $page = 1, int $limit = 10): array
    {
        $query = Budget::where('user_id', $userId);

        if ($search) {
            $query->where('budget_amount', 'LIKE', "%$search%");
        }

        $total = $query->count();
        $budgets = $query->paginate($limit, ['*'], 'page', $page);

        return [
            'data' => $budgets->items(),
            'total' => $total,
            'total_pages' => ceil($total / $limit),
            'current_page' => $page,
        ];
    }

    public function findById(int $userId, int $id): ?Budget
    {
        return Budget::where('user_id', $userId)->findOrFail($id);
    }

    public function update(int $userId, int $id, array $data): bool
    {
        $budget = Budget::where('user_id', $userId)->find($id);

        if (!$budget) {
            throw new ModelNotFoundException("Budget not found.");
        }

        return $budget->update($data);
    }

    public function delete(int $userId, int $id): bool
    {
        $budget = Budget::where('user_id', $userId)->find($id);

        if (!$budget) {
            throw new ModelNotFoundException("Budget not found.");
        }

        return $budget->delete();
    }
}
