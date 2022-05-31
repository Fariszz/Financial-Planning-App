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

// Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
//     return $request->user();
// });

Route::prefix('v1')->group(function () {
    Route::post('/register', [AuthController::class, 'register']);
    Route::post('/login', [AuthController::class, 'login']);

    Route::middleware('auth:sanctum')->group(function () {
        Route::get('/user', [AuthController::class, 'fetch']);

        Route::get('/all-harta', [RichController::class, 'all']);
        Route::post('/harta',[RichController::class, 'harta']);
        Route::put('/harta/{id}',[RichController::class, 'updateHarta']);
        Route::delete('/harta/{id}',[RichController::class, 'deleteHarta']);
        Route::post('/hutang',[RichController::class, 'hutang']);
        Route::put('/hutang/{id}',[RichController::class, 'updateHutang']);
        Route::delete('/hutang/{id}',[RichController::class, 'deleteHutang']);
        Route::post('/total',[RichController::class, 'total']);
    });
});


