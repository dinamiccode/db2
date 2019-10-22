<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class cliente extends Model
{
    public $timestamps = false;
    protected $fillable = [
        'ID_CLIENTE'
    ];
    protected $table = 'clientes';
}
