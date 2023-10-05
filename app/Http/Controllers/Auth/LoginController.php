<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Models\User;
use App\Providers\RouteServiceProvider;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Http;
use Seshac\Otp\Otp;

class LoginController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Login Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles authenticating users for the application and
    | redirecting them to your home screen. The controller uses a trait
    | to conveniently provide its functionality to your applications.
    |
    */

    use AuthenticatesUsers;

    /**
     * Where to redirect users after login.
     *
     * @var string
     */
    protected $redirectTo = RouteServiceProvider::HOME;

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest')->except('logout');
    }


    public function login(Request $request)
    {

        $request->validate([
            'msisdn' => 'required',
            'otp' => 'required'
        ]);
        $verify = false;

        if ($request->otp == $request->session()->get('OTP')) {
            $verify = true;
        }



        if ($request->isMethod('post') ) {

            if (substr($request->msisdn, 0, 1) == '0'){

                $_phoneNumber = "967" . substr($request->msisdn, 1);
            }else{
                $_phoneNumber = $request->msisdn;
            }

        }

        $request->session()->forget('OTP');
        $_user = User::where('msisdn', $_phoneNumber)->first();

        if (empty($_user)) {


            $_user = User::create(
                [
                    'name' => 'المستخدم',
                    'chargingDate' => '0',
                    'sub_type' => '0',
                    'msisdn' => $_phoneNumber
                ]
            );
        }


        if (!empty($_user) && $verify) {
            //Auth::login($_user);

            return redirect()->route('subs',['id'=>$_user->id])->with(['id'=>$request->id]);
        } else {

            return redirect("login");
        }

    }

    public function sendOtp(Request $request)
    {
        /**
         * check if there is phone number in headers
         */
        $_phoneNumber = $request->header('msisdn');

        if ($_phoneNumber != null ) {
            if (substr($_phoneNumber, 0, 1) == '0'){

                $_phoneNumber = "967" . substr($_phoneNumber, 1);
            }

        }

        if ($request->isMethod('post') ) {

            if (substr($request->msisdn, 0, 1) == '0'){

                $_phoneNumber = "967" . substr($request->msisdn, 1);
            }else{
                $_phoneNumber = $request->msisdn;
            }
        }

        $_user = User::where('msisdn', $_phoneNumber)->first();

        if (!empty($_user) ) {

            if (strtotime($_user->chargingDate) >= strtotime(date('Y-m-d H:i:s'))){
                Auth::login($_user);
                return redirect()->route('home');
            }else{
                return redirect()->route('subs',['id'=>$_user->id])->with(['id'=>$request->id]);
            }

        }

        $response =
            Http::get((env('OTP_API'))."?msisdn=" . urlencode($_phoneNumber) . "&serid=" . urlencode(env('SENDER_ID')) . "&senderName=" . env('SENDER_NAME') . "&text=" . urlencode("Your Secret Code is:"));

        $_otp = explode('-', $response->body())[0];
        $request->session()->put('OTP', $_otp);


        return view('auth.otp')->with(['otp' => $_otp, 'msisdn' => $request->msisdn]);
    }



    public function showLoginForm(Request $request)
    {


        $_phoneNumber = $request->header('msisdn');

        if ($_phoneNumber != null ) {
            if (substr($_phoneNumber, 0, 1) == '0'){

                $_phoneNumber = "967" . substr($_phoneNumber, 1);
            }

        }
//

        $_user = User::where('msisdn', $_phoneNumber)->first();

        if ( $request->header('msisdn') != null) {

            if (!empty($_user) && strtotime($_user->chargingDate) >= strtotime(date('Y-m-d H:i:s'))) {
                Auth::login($_user);
                return redirect()->route('home');
            } else {
                /*
               * create user if user not found
               */
                if (!empty($_user)){
                    return redirect()->route('subs',['id'=>$_user->id])->with(['id'=>$request->id]);

                }

                if (empty($_user)){
                    $_user = User::create(
                        [
                            'name' => 'المستخدم',
                            'chargingDate' => '0',
                            'sub_type' => '0',
                            'msisdn' => $_phoneNumber
                        ]
                    );

                    return redirect()->route('subs',['id'=>$_user->id])->with(['id'=>$request->id]);
                }
            }
        }

        return view('auth.login');
    }

    public function subs(Request $request)
    {
        return view('auth.subs')->with(['id'=>$request->id]);
    }
    public function subscribe(Request $request)
    {

        $request->validate([
            'sub_type' => 'required',
        ]);

        $userId = $request->id;

        $user = User::findOrFail($userId);

        $Timestamp = strtotime(date('Y-m-d H:i:s'));

        if ($request->sub_type == '1') {
            $TotalTimeStamp = strtotime('+ 2 days', $Timestamp);
            $_validTill = date('Y-m-d H:i:s', $TotalTimeStamp);
            $user->fill([
                'sub_type' => $request->sub_type,
                'chargingDate' => $_validTill
            ]);
            $_subId = env('SERVICE_D_PRODUCT');
            $_senderId = env('SERVICE_D_ID');


        } elseif ($request->sub_type == '2') {
            $TotalTimeStamp = strtotime('+ 8 days', $Timestamp);
            $_validTill = date('Y-m-d H:i:s', $TotalTimeStamp);
            $user->fill([
                'sub_type' => $request->sub_type,
                'chargingDate' => $_validTill,
                'subDate'=>date('Y-m-d'),
                'subTime'=>date('H:i:s')
            ]);
            $_subId = env('SERVICE_W_PRODUCT');
            $_senderId = env('SERVICE_W_ID');
        }
        $apiUrl = env('SUB_API') . '?msisdn=' . urlencode($user->msisdn) . '&serid='.urlencode($_senderId).'&subkey=1&productId=' . urlencode($_subId);

        if ($user->save()){
            $response =
                Http::get($apiUrl);
            Auth::login($user);
            return redirect()->route('home');

        }

    }

}
