<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class RichesUtang extends Model
{
    use HasFactory;

    protected $fillable = [
        'users_id',
        'utang',
        'rupiah'
    ];

    public function user()
    {
        return $this->belongsTo(User::class,'users_id','id');
    }
}
