<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class respuesta extends Model
{
    public $timestamps = false;
    protected $fillable = [
        'ID_RESPUESTA'
    ];
    protected $table = 'respuesta';
}
