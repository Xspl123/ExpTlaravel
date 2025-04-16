<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\Api\BudgetController;
use App\Http\Controllers\Api\TransactionController;
use App\Http\Controllers\Api\CategoryController;
use App\Http\Controllers\Api\AccountController;


Route::post('/register', [AuthController::class, 'register']);
Route::post('/login', [AuthController::class, 'login']);

Route::middleware('auth:sanctum')->group(function () {
    Route::get('/me', [AuthController::class, 'userProfile']);
    Route::get('/users/list', [AuthController::class, 'getAllUsers']);
    Route::post('/logout', [AuthController::class, 'logout']);
    Route::post('/password-reset', [AuthController::class, 'sendPasswordResetLink']);
    Route::post('/reset-password', [AuthController::class, 'resetPassword']);

    //Budgets routes
    Route::get('/budgets', [BudgetController::class, 'index']);
    Route::post('/budgets-create', [BudgetController::class, 'store']);
    Route::get('/budgets/{id}', [BudgetController::class, 'show']);
    Route::put('/budgets/{id}', [BudgetController::class, 'update']);
    Route::delete('/budgets/{id}', [BudgetController::class, 'destroy']);

    //Transactions routes
    Route::post('/transactions/create', [TransactionController::class, 'createTransaction']);
    Route::get('/transactions', [TransactionController::class, 'getTransactions']);
    Route::put('/transactions/{id}', [TransactionController::class, 'updateTransaction']);
    Route::delete('/transactions/{id}', [TransactionController::class, 'deleteTransaction']);
    Route::post('/upload-file', [TransactionController::class, 'uploadFile']);

    // Categories Routes
    Route::get('/categories', [CategoryController::class, 'index']);
    Route::post('/categories/create', [CategoryController::class, 'store']);
    Route::get('/categories/{id}', [CategoryController::class, 'show']);
    Route::put('/categories/{id}', [CategoryController::class, 'update']);
    Route::delete('/categories/{id}', [CategoryController::class, 'destroy']);

    // Accounts Routes
    Route::get('/accounts', [AccountController::class, 'index']);
    Route::post('/accounts/create', [AccountController::class, 'store']);
    Route::get('/accounts/{id}', [AccountController::class, 'show']);
    Route::put('/accounts/{id}', [AccountController::class, 'update']);
    Route::delete('/accounts/{id}', [AccountController::class, 'destroy']);

});
