<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class encuesta extends Model
{
    public $timestamps = false;
    protected $fillable = [
        'ID_ENCUESTA'
    ];
    protected $table = 'encuesta';
}
