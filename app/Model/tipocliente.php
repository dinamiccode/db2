<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class tipocliente extends Model
{
    public $timestamps = false;
    protected $fillable = [
        'id_tip_cliente'
    ];
    protected $table = 'tipo_cliente';
}
