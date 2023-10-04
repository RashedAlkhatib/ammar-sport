<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Auth::routes();

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
Route::any('/service/{id}', [App\Http\Controllers\HomeController::class, 'service'])->name('service');

Auth::routes();

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');

Route::any('/sendOtp', [App\Http\Controllers\Auth\LoginController::class, 'sendOtp'])->name('sendOTP');
Route::any('/subs', [App\Http\Controllers\Auth\LoginController::class, 'subs'])->name('subs');
Route::any('/subscribe', [App\Http\Controllers\Auth\LoginController::class, 'subscribe'])->name('subscribe');
//Route::group(['middleware' => 'auth'], function () {
//
//
//});
