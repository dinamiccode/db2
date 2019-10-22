<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class encuestaR extends Model
{
    public $timestamps = false;
    protected $fillable = [
        'ID_ENCUESTA_RESPONDIDA'
    ];
    protected $table = 'encuesta_respondida';
}
