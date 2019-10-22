<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class bitacora extends Model
{
    public $timestamps = false;
    protected $fillable = [
        'ID_BITACORA'
    ];
    protected $table = 'bitacora';
}
