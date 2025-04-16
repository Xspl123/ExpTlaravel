<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Transaction extends Model
{
    use HasFactory;

    protected $fillable = [
        'user_id',
        'category_id',
        'account_id',
        'amount',
        'file',
        'type',
        'description',
        'transaction_date',
    ];

    /**
     * Define relationship with User model
     */
    public function user()
    {
        return $this->belongsTo(User::class);
    }

    /**
     * Define relationship with Category model
     */
    public function category()
    {
        return $this->belongsTo(Category::class);
    }

    /**
     * Define relationship with Account model
     */
    public function account()
    {
        return $this->belongsTo(Account::class);
    }
}
