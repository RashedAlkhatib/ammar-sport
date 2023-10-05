<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class CheckStatus
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure(\Illuminate\Http\Request): (\Illuminate\Http\Response|\Illuminate\Http\RedirectResponse)  $next
     * @return \Illuminate\Http\Response|\Illuminate\Http\RedirectResponse
     */
    public function handle(Request $request, Closure $next)
    {



        if (Auth::check() && strtotime(Auth::User()->chargingDate) <= strtotime(date('Y-m-d H:i:s'))) {

            Auth::logout();
            return redirect()->to('/login')->with('warning', 'Your session has expired because your status change.');
        }

        return $next($request);
    }
}
