<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class factura extends Model
{
    public $timestamps = false;
    protected $fillable = [
        'ID_FACTURA'
    ];
    protected $table = 'factura';
}
