<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class ModelPersona extends Model
{
    public $timestamps = false;
    protected $fillable = [
        'id_persona','nombre'
    ];
    protected $table = 'persona';
}
