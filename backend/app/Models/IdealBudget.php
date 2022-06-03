<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class IdealBudget extends Model
{
    use HasFactory;

    protected $fillable = [
        'total_penghasilan',
        'agama',
        'tabungan',
        'asuransi',
        'cicilan',
        'investasi',
        'rumah_tangga',
        'anak',
        'hiburan',
        'users_id'
    ];

    public function user()
    {
        return $this->belongsTo(User::class,'users_id','id');
    }
}
