<?php

namespace App\Http\Controllers\Api;

use App\Services\BudgetService;
use Illuminate\Http\Request;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Response;
use App\Http\Requests\BudgetRequest;
use Illuminate\Support\Facades\Auth;


class BudgetController extends Controller
{
    private BudgetService $budgetService;

    public function __construct(BudgetService $budgetService)
    {
        $this->budgetService = $budgetService;
    }

    /**
     * Create a new budget entry
     */
    public function store(BudgetRequest $request): JsonResponse
    {
        $data = $request->validated();
        $data['user_id'] = auth()->id;
        $budget = $this->budgetService->createBudget($data);

        return response()->json([
            'message' => 'Budget created successfully',
            'data' => $budget
        ], Response::HTTP_CREATED);
    }

    /**
     * Fetch all budgets for the authenticated user
     */
    public function index(Request $request): JsonResponse
    {
        $userId =Auth::user()->id;
        $search = $request->query('search', null);
        $page = $request->query('page', 1);
        $limit = $request->query('limit', 10);

        $budgets = $this->budgetService->getUserBudgets($userId, $search, $page, $limit);

        return response()->json([
            'message' => 'Budgets retrieved successfully',
            'data' => $budgets
        ], Response::HTTP_OK);
    }

    /**
     * Fetch a specific budget entry
     */
    public function show($id): JsonResponse
    {
        $userId =Auth::user()->id;
        $budget = $this->budgetService->getBudgetById($userId, $id);

        if (!$budget) {
            return response()->json(['message' => 'Budget not found'], Response::HTTP_NOT_FOUND);
        }

        return response()->json([
            'message' => 'Budget retrieved successfully',
            'data' => $budget
        ], Response::HTTP_OK);
    }

    /**
     * Update an existing budget entry
     */
    public function update(BudgetRequest $request, $id): JsonResponse
    {
        $userId =Auth::user()->id;
        $data = $request->validated();

        $updated = $this->budgetService->updateBudget($userId, $id, $data);

        if (!$updated) {
            return response()->json(['message' => 'Budget update failed'], Response::HTTP_BAD_REQUEST);
        }

        return response()->json([
            'message' => 'Budget updated successfully'
        ], Response::HTTP_OK);
    }

    /**
     * Delete a budget entry
     */
    public function destroy($id): JsonResponse
    {
        $userId =Auth::user()->id;
        $deleted = $this->budgetService->deleteBudget($userId, $id);

        if (!$deleted) {
            return response()->json(['message' => 'Budget deletion failed'], Response::HTTP_BAD_REQUEST);
        }

        return response()->json([
            'message' => 'Budget deleted successfully'
        ], Response::HTTP_OK);
    }

    
}
