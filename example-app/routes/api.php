<?php
use App\Http\Controllers\ProdController;
use App\Http\Controllers\API\AuthController;
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

Route::resource('product',ProdController::class);
//Route::get('/product',[ProdController::class,'index']);
//Route::post('/product',[ProdController::class,'store']);

Route::post('register',[AuthController::class,'register']);
Route::post('login',[AuthController::class,'checkLogin']);
Route::post('edituser',[AuthController::class,'edituser']);

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});
