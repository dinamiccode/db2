<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class detalleExpediente extends Model
{
    public $timestamps = false;
    protected $fillable = [
        'ID_DETALLE_EXPEDIENTE'
    ];
    protected $table = 'detalle_expediente';
}
