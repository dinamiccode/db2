<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Model\ModelPersona;
use App\Model\tipocliente;
use App\Model\producto;
use App\Model\pregunta;
use App\Model\cliente;
use App\Model\encuesta;
use App\Model\encuestaR;
use App\Model\respuesta;
use App\Model\encuestaProducto;
use App\Model\detalleExpediente;
use App\Model\factura;
use App\Model\detalle_factura;
use App\Model\bitacora;


class PinturasController extends Controller
{
    public function ShowPersona(){
        return view('controlador.persona');
    }
    
    public function addPersona(Request $request){
        $query = DB::statement("BEGIN  PK_ADD_DATA.NewPerson('" .$request->nombre. "', '" .$request->apellido. "', '" .$request->telefono. "', '" .$request->nit. "');  END;");

        return response()->json($query, 200);
    }
    

    public function getPersona(){
        $responseData = ModelPersona::select('id_persona as code','nombre as name','apellido as lastname','telefono')->where('activo','=', 1)->get();
        return response()->json($responseData, 200);
        // return ModelPersona::all()->where('status','=','A')->get();
    }
    
    public function deletePersona(Request $request){
        $deleteById = DB::statement("BEGIN  PK_ADD_DATA.deletePerson('" .$request->id. "');  END;");
        return response()->json($deleteById, 200);
    }
    
    public function ShowtCliente(){
        return view('controlador.tipoCliente');
    }
    
    public function addTCliente(Request $request){
        $query = DB::statement("BEGIN  PK_ADD_DATA.NewClientType('" .$request->descripcion. "');  END;");
        return response()->json($query, 200);
    }
    
    public function getTCliente(){
        $responseData = tipocliente::select('id_tip_cliente as code','descripcion as name')->where('activo','=', 1)->get();
        return response()->json($responseData, 200);
        // return ModelPersona::all()->where('status','=','A')->get();
    }

    public function deleteTCliente(Request $request){
        $deleteById = DB::statement("BEGIN  PK_ADD_DATA.deleteCliente('" .$request->id. "');  END;");
        return response()->json($deleteById, 200);
    }

    public function ShowProducto(){
        return view('controlador.producto');
    }
    
    public function addProducto(Request $request){
        $query = DB::statement("BEGIN  PK_ADD_DATA.NewProduct('" .$request->nombre. "','" .$request->existencia. "','" .$request->precio. "');  END;");
        return response()->json($query, 200);
    }
    
    public function getProducto(){
        $responseData = producto::select('id_producto as code','nombre as name','existencia','precio as price')->where('activo','=', 1)->get();
        return response()->json($responseData, 200);
        // return ModelPersona::all()->where('status','=','A')->get();
    }

    public function deleteProducto(Request $request){
        $deleteById = DB::statement("BEGIN  PK_ADD_DATA.deleteProducto('" .$request->id. "');  END;");
        return response()->json($deleteById, 200);
    }

    public function ShowPregunta(){
        return view('controlador.pregunta');
    }
    
    public function addPregunta(Request $request){
        $query = DB::statement("BEGIN  PK_ADD_DATA.NewQuestion('" .$request->descripcion. "','" .$request->tipo. "');  END;");
        return response()->json($query, 200);
    }
    
    public function getPregunta(){
        $responseData = pregunta::select('id_pregunta as code','descripcion as name','tipo')->where('activo','=', 1)->get();
        return response()->json($responseData, 200);
        // return ModelPersona::all()->where('status','=','A')->get();
    }

    public function deletePregunta(Request $request){
        $deleteById = DB::statement("BEGIN  PK_ADD_DATA.deletePregunta('" .$request->id. "');  END;");
        return response()->json($deleteById, 200);
    }

    public function ShowCliente(){
        return view('controlador.cliente');
    }
    
    public function addCliente(Request $request){
        $query = DB::statement("BEGIN  PK_ADD_DATA.NewClient('" .$request->persona. "','" .$request->telefono. "','" .$request->expediente. "');  END;");
        return response()->json($query, 200);
    }
    
    public function getCliente(){
        $responseData = cliente::select('clientes.id_cliente as code','persona.nombre as name','clientes.telefono as telefono','clientes.numero_expediente as expediente')
                                ->join('persona','persona.id_persona','=','clientes.id_persona')    
                                ->where('clientes.activo','=', 1)->get();
        return response()->json($responseData, 200);
        // return ModelPersona::all()->where('status','=','A')->get();
    }

    public function deleteCliente(Request $request){
        $deleteById = DB::statement("BEGIN  PK_ADD_DATA.deletedataCliente('" .$request->id. "');  END;");
        return response()->json($deleteById, 200);
    }

    public function ShowEncuesta(){
        return view('controlador.encuesta');
    }
    
    public function addEncuesta(Request $request){
        $query = DB::statement("BEGIN  PK_ADD_DATA.NewSurvey('" .$request->pregunta. "','" .$request->titulo. "','" .$request->descripcion. "');  END;");
        return response()->json($query, 200);
    }
    
    public function getEncuesta(){
        $responseData = encuesta::select('encuesta.id_encuesta as code','pregunta.descripcion as name',
                                            'encuesta.titulo as titulo','encuesta.descripcion as descripcion')
                                ->join('pregunta','pregunta.id_pregunta','=','encuesta.id_pregunta')    
                                ->get();
        return response()->json($responseData, 200);
        // return ModelPersona::all()->where('status','=','A')->get();
    }

    public function deleteEncuesta(Request $request){
        $deleteById = DB::statement("BEGIN  PK_ADD_DATA.deletedataCliente('" .$request->id. "');  END;");
        return response()->json($deleteById, 200);
    }

    public function ShowEncuestaR(){
        return view('controlador.encuestaR');
    }
    
    public function addEncuestaR(Request $request){
        $query = DB::statement("BEGIN  PK_ADD_DATA.NewSurveyAnswered('" .$request->encuesta. "','" .$request->cliente. "','" .$request->correlativo. "');  END;");
        return response()->json($query, 200);
    }
    
    public function getEncuestaR(){
        $responseData = encuestaR::select('ENCUESTA_RESPONDIDA.id_encuesta_respondida as code','encuesta.titulo as name',
                                            'persona.nombre as cliente','ENCUESTA_RESPONDIDA.correlativo as correlativo')
                                ->join('encuesta','encuesta.id_encuesta','=','ENCUESTA_RESPONDIDA.id_encuesta_respondida')    
                                ->join('clientes','clientes.id_cliente','=','ENCUESTA_RESPONDIDA.id_cliente')
                                ->join('persona','persona.id_persona','=','clientes.id_persona')
                                ->get();
        return response()->json($responseData, 200);
        // return ModelPersona::all()->where('status','=','A')->get();
    }

    public function deleteEncuestaR(Request $request){
        $deleteById = DB::statement("BEGIN  PK_ADD_DATA.deletedataCliente('" .$request->id. "');  END;");
        return response()->json($deleteById, 200);
    }

    public function ShowRespuesta(){
        return view('controlador.Respuesta');
    }
    
    public function addRespuesta(Request $request){
        $query = DB::statement("BEGIN  PK_ADD_DATA.NewReply('" .$request->encuestaR. "','" .$request->pregunta. "','" .$request->respuesta. "');  END;");
        return response()->json($query, 200);
    }
    
    public function getRespuesta(){
        $responseData = respuesta::select('respuesta.id_respuesta as code','respuesta.respuesta as name')
                                ->get();
        return response()->json($responseData, 200);
        // return ModelPersona::all()->where('status','=','A')->get();
    }

    public function Showeproducto(){
        return view('controlador.encuesta_producto');
    }
    
    public function addeproducto(Request $request){
        $query = DB::statement("BEGIN  PK_ADD_DATA.NewSurveyProduct('" .$request->encuestaR. "','" .$request->producto. "');  END;");
        return response()->json($query, 200);
    }
    
    public function geteproducto(){
        $responseData = encuestaProducto::select('encuesta_producto.serie_encuesta as code','encuesta.titulo as name','producto.nombre as producto')
                                ->join('encuesta','encuesta.id_encuesta','=','encuesta_producto.id_encuesta')
                                ->join('producto','producto.id_producto','=','encuesta_producto.id_producto')
                                ->get();
        return response()->json($responseData, 200);
        // return ModelPersona::all()->where('status','=','A')->get();
    }

    public function Showdexpediente(){
        return view('controlador.detalle_expediente');
    }
    
    public function adddexpediente(Request $request){
        $query = DB::statement("BEGIN  PK_ADD_DATA.NewDetailCaseFile('" .$request->cliente. "','" .$request->tipocliente. "','" .$request->comentario. "');  END;");
        return response()->json($query, 200);
    }
    
    public function getdexpediente(){
        $responseData = detalleExpediente::select('ID_DETALLE_EXPEDIENTE as code','COMENTARIOS as name')
                                ->get();
        return response()->json($responseData, 200);
    }

    public function Showfactura(){
        return view('controlador.factura');
    }
    
    public function addfactura(Request $request){
        $query = DB::statement("BEGIN  PK_ADD_DATA.NewBill('" .$request->cliente. "','" .$request->tipocliente. "','" .$request->comentario. "','" .$request->serie. "','" .$request->factura. "');  END;");
        return response()->json($query, 200);
    }
    
    public function getfactura(){
        $responseData = factura::select('FACTURA.NO_FACTURA as code','FACTURA.NO_SERIE as serie','factura.nit as nit','factura.fehca as fecha','FACTURA.ID_FACTURA AS ID_FACTURA')
                                
                                ->get();
        return response()->json($responseData, 200);
    }

    public function ShowdFactura(){
        return view('controlador.Dfactura');
    }
    
    public function adddFactura(Request $request){
        $query = DB::statement("BEGIN  PK_ADD_DATA.NewinvoiceDetail('" .$request->cantidad. "','" .$request->precio. "','" .$request->total. "','" .$request->producto. "','" .$request->factura. "');  END;");
        return response()->json($query, 200);
    }
    
    
    public function getdFactura(){
        $responseData = detalle_factura::select('detalle_factura.id_detalle as code','factura.id_factura as factura','producto.nombre as producto','detalle_factura.cantidad as cantidad',
                                                'detalle_factura.precio as precio','detalle_factura.total as total')
                                ->join('producto','producto.id_producto','=','detalle_factura.id_producto')
                                ->join('factura','factura.id_factura','=','detalle_factura.id_factura')
                                ->get();
        return response()->json($responseData, 200);
    }
    
    public function Showbitacora(){
        return view('controlador.bitacora');
    }
    
    
    public function getbitacora(){
        $responseData = bitacora::all();
        return response()->json($responseData, 200);
    }

    public function getProductoChats(Request $request){
        $query = DB::select("select nombre, precio from producto group by nombre, precio");
        return response()->json($query, 200);
    }
    


}
