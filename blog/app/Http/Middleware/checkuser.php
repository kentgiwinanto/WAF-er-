<?php

namespace App\Http\Middleware;

use Closure;

class checkuser
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        if($request->session()->get('UserProfileID') === null ){
          return redirect('Login');
        }
        return $next($request);
    }

    public function username()
    {
        return 'Username';
    }

    public function jobpos()
    {
        return 'UserJobName';
    }
}
