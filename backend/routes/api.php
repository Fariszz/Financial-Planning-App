<?php

use App\Http\Controllers\API\AuthController;
use App\Http\Controllers\API\RichController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::prefix('v1')->group(function () {
    Route::post('/register', [AuthController::class, 'register']);
    Route::post('/login', [AuthController::class, 'login']);

    Route::middleware('auth:sanctum')->group(function () {
        Route::get('/user', [AuthController::class, 'fetch']);

        Route::get('/total', [RichController::class,'getTotal']);
        Route::post('/total',[RichController::class, 'total']);

        Route::post('/ideal-budget',[RichController::class, 'idealBudget']);
        Route::get('/ideal-budget',[RichController::class, 'getIdealBudget']);

        Route::get('/harta', [RichController::class, 'harta']);
        Route::post('/harta',[RichController::class, 'postHarta']);
        Route::put('/harta/{id}',[RichController::class, 'updateHarta']);
        Route::delete('/harta/{id}',[RichController::class, 'deleteHarta']);

        Route::get('/hutang', [RichController::class, 'hutang']);
        Route::post('/hutang',[RichController::class, 'postHutang']);
        Route::put('/hutang/{id}',[RichController::class, 'updateHutang']);
        Route::delete('/hutang/{id}',[RichController::class, 'deleteHutang']);

        Route::get('/income',[RichController::class, 'income']);
        Route::post('/income',[RichController::class, 'postIncome']);
        Route::put('/income/{id}',[RichController::class, 'updateIncome']);
        Route::delete('/income/{id}',[RichController::class, 'deleteIncome']);

        Route::get('/expenditure',[RichController::class, 'expenditure']);
        Route::post('/expenditure',[RichController::class, 'postExpenditure']);
        Route::put('/expenditure/{id}',[RichController::class, 'updateExpenditure']);
        Route::delete('/expenditure/{id}',[RichController::class, 'deleteExpenditure']);
    });
});


