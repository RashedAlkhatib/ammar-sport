<?php

namespace App\Http\Controllers;

use App\Models\ScServices;
use App\Models\ScServicesContent;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Http;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware(['auth','checkStatus']);
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        $_getServices = ScServices::all();
        return view('home')->with(['services' => $_getServices]);
    }

    public function service($id)
    {
        $_getServices = ScServices::all();
        $_getContent = ScServicesContent::where('service_Id',$id)->get();
        return view('auth.service')->with(['services' => $_getServices,'content'=>$_getContent]);
    }



}
