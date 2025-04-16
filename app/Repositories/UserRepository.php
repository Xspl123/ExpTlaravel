<?php

namespace App\Repositories;

use App\Models\User;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Password;
use Illuminate\Auth\Events\PasswordReset;
use App\Repositories\Interfaces\UserRepositoryInterface;

class UserRepository implements UserRepositoryInterface
{
    public function register(array $data)
    {
        return User::create([
            'name' => $data['name'],
            'email' => $data['email'],
            'password' => Hash::make($data['password']),
        ]);
    }

    public function findByEmail(string $email)
    {
        return User::where('email', $email)->first();
    }

    public function logout(User $user)
    {
        $user->tokens()->delete();
    }

    public function getUserById(int $id)
    {
        return User::findOrFail($id);
    }

    public function resetPassword(array $credentials)
    {
        // Email ke basis par user fetch karein
        $user = User::where('email', $credentials['email'])->first();

        if (!$user) {
            return 'user_not_found';
        }

        // Password update karein
        $user->password = Hash::make($credentials['password']);
        $user->save();

        return 'password_reset_success';
    }

    public function getAllUsers()
    {
        return User::all();
    }
    
}
