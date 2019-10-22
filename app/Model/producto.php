<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class producto extends Model
{
    public $timestamps = false;
    protected $fillable = [
        'id_producto'
    ];
    protected $table = 'producto';
}
