<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\User;
use Attribute;
use Illuminate\Http\Request;

use function Laravel\Prompts\confirm;

class AuthController extends Controller
{
//     public function register(Request $request) 
//     {
//         $request->validate(rules:[
//             'name'=>'required|string|max:255',
//             'email'=>'required|string|max:255',
//             'password'=>'required|string|min:8|confirmed'
//         ]);
//         $user =User::create([
//             'name'=>$request->name,
//             'email'=>$request->email,
//             'password'=>bcrypt(value:$request->password),
//         ]);
//         $token=$user->createToken(name:'api-token')->plainTextToken;
//     }
}
