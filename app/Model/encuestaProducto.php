<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class encuestaProducto extends Model
{
    public $timestamps = false;
    protected $fillable = [
        'serie_encuesta'
        ];
    protected $table = 'encuesta_producto';
}
