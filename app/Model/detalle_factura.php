<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class detalle_factura extends Model
{
    public $timestamps = false;
    protected $fillable = [
        'ID_DETALLE'
    ];
    protected $table = 'DETALLE_FACTURA';
}
