<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Riches extends Model
{
    use HasFactory;

    protected $fillable = [
        'users_id',
        'total_harta',
        'total_utang',
        'total_kekayaan_bersih',
        'sisa_penghasilan',
        'status'
    ];

    public function user()
    {
        return $this->belongsTo(User::class,'users_id','id');
    }

}
