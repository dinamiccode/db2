<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class pregunta extends Model
{
    public $timestamps = false;
    protected $fillable = [
        'id_pregunta'
    ];
    protected $table = 'pregunta';
}
