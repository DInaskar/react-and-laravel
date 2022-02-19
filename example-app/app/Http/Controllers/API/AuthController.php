<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class AuthController extends Controller
{
    public function register(Request $request)
    {
        //validating the inputs with validator property
        $validator = Validator::make($request->all(),[
            'name'=>'required|max:191',
            'email'=>'required|email|max:191|unique:users,email',
            'password'=>'required|min:8',
        ]);

        if($validator->fails())
        {
            //error handling 
            return response()->json([
                'validate_error'=>$validator->messages(),
            ]);
        }
        else
        {
            //insertion to database
            $user=User::create([
                'name'=>$request->name,
                'email'=>$request->email,
                'password'=>Hash::make($request->password),
            ]);

            //tokenization 
            $token = $user->createToken($user->email.'_Token')->plainTextToken;

            //response Initialtion
            return response()->json([
                'status'=>200,
                'username'=>$user->name,
                'token'=>$token,
                'message'=>'Registed Successfully',
            ]);
        }
    }
    public function checkLogin(Request $request)
    {

        $validator = Validator::make($request->all(),[
            'email'=>'required|max:191',
            'password'=>'required|min:8',
        ]);

        if($validator->fails())
        {   //error handling 
            return response()->json([
                'validate_error'=>$validator->messages(),
            ],422);
        }

        //Retrivting data from the database
        $Userinfor = User::Where('email',$request->email)->first();
        
        //checking if the password is correct if not dispaly error message
        if(!$Userinfor || !Hash::check($request->password,$Userinfor->password))
        {
            return response()->json([
                'message'=>'Invalide',
                'errors'=>[
                    'password'=> 'The password does not match'
                ]
            ],422);
        }
        else{

           //tokenization 
           $token = $Userinfor->createToken($Userinfor->email.'_Token')->plainTextToken;

                //response Initialtion
                return response()->json([
                    'status'=>200,
                    'id'=>$Userinfor->id,
                    'data'=> $Userinfor,
                    'email'=>$Userinfor->email,
                    'usernamess'=>$Userinfor->name,
                    'password'=>$request->password,
                    'token'=>$token,
                    'message'=>'Logged in Successfully',
                ]);
            }
    }

    public function checklogout(Request $request)
    {
        $token = $user->createToken($user->email.'_Token')->plainTextToken; 
        $request->user()->currentAccessToken()->delete();
        return response()->json([
            'messages'=>'User are successfully Logged out',      
        ],200);
    }
    public function edituser($id)
    {
        $user=User::find($id);
        $request->user()->currentAccessToken()->delete();
        return response()->json([
            'status'=>200,
            'userData'=>$user, 
        ]);
    }
}
