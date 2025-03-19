<?php

namespace App\Repositories\Interfaces;

use App\Models\Budget;

interface BudgetRepositoryInterface
{
    public function create(array $data): Budget;
    public function getAll(int $userId, ?string $search = null, int $page = 1, int $limit = 10): array;
    public function findById(int $userId, int $id): ?Budget;
    public function update(int $userId, int $id, array $data): bool;
    public function delete(int $userId, int $id): bool;
}
