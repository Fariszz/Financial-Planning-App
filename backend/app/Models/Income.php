<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Income extends Model
{
    use HasFactory;

    protected $fillable = [
        'users_id',
        'penghasilan',
        'rupiah',
    ];

    public function users()
    {
        return $this->belongsTo(User::class);
    }
}
