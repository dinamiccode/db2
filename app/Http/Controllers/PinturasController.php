<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class PinturasController extends Controller
{
    public function ShowPersona(){
        return view('controlador.persona');
    }

    public function addPersona(Request $request){
        $query = DB::statement("BEGIN  PK_ADD_DATA.NewPerson('" .$request->nombre. "', '" .$request->apellido. "', '" .$request->telefono. "', '" .$request->nit. "');  END;");

        return response()->json($query, 200);
    }
}
