<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Auth::routes();
/* CoreUI templates */

Route::middleware('auth')->group(function() {
	Route::view('/', 'samples.charts');
	// Section CoreUI elements
	Route::view('/sample/dashboard','samples.dashboard');
	Route::view('/sample/buttons','samples.buttons');
	Route::view('/sample/social','samples.social');
	Route::view('/sample/cards','samples.cards');
	Route::view('/sample/forms','samples.forms');
	Route::view('/sample/modals','samples.modals');
	Route::view('/sample/switches','samples.switches');
	Route::view('/sample/tables','samples.tables');
	Route::view('/sample/tabs','samples.tabs');
	Route::view('/sample/icons-font-awesome', 'samples.font-awesome-icons');
	Route::view('/sample/icons-simple-line', 'samples.simple-line-icons');
	Route::view('/sample/widgets','samples.widgets');
	Route::view('/sample/charts','samples.charts');



	// Persona
	Route::get('Persona','PinturasController@ShowPersona');
	Route::post('addPersona','PinturasController@addPersona');
	Route::get('getPersona','PinturasController@getPersona');
	Route::put('deletePersona','PinturasController@deletePersona');

	// Tipo Cliente
	Route::get('tcliente','PinturasController@ShowtCliente');
	Route::post('addTCliente','PinturasController@addTCliente');
	Route::get('getTCliente','PinturasController@getTCliente');
	Route::put('deleteTCliente','PinturasController@deleteTCliente');
	
	// Producto
	Route::get('producto','PinturasController@ShowProducto');
	Route::post('addProducto','PinturasController@addProducto');
	Route::get('getProducto','PinturasController@getProducto');
	Route::put('deleteProducto','PinturasController@deleteProducto');
	
	// Pregunta
	Route::get('pregunta','PinturasController@ShowPregunta');
	Route::post('addPregunta','PinturasController@addPregunta');
	Route::get('getPregunta','PinturasController@getPregunta');
	Route::put('deletePregunta','PinturasController@deletePregunta');
	
	// Clientes
	Route::get('cliente','PinturasController@ShowCliente');
	Route::post('addCliente','PinturasController@addCliente');
	Route::get('getCliente','PinturasController@getCliente');
	Route::put('deleteCliente','PinturasController@deleteCliente');
	
	// Encuesta
	Route::get('encuesta','PinturasController@ShowEncuesta');
	Route::post('addEncuesta','PinturasController@addEncuesta');
	Route::get('getEncuesta','PinturasController@getEncuesta');
	Route::put('deleteEncuesta','PinturasController@deleteEncuesta');
	
	// Encuesta Respondida
	Route::get('encuestaR','PinturasController@ShowEncuestaR');
	Route::post('addEncuestaR','PinturasController@addEncuestaR');
	Route::get('getEncuestaR','PinturasController@getEncuestaR');
	Route::put('deleteEncuestaR','PinturasController@deleteEncuestaR');
	
	// Respuestas
	Route::get('respuesta','PinturasController@ShowRespuesta');
	Route::post('addRespuesta','PinturasController@addRespuesta');
	Route::get('getRespuesta','PinturasController@getRespuesta');
	Route::put('deleteRespuesta','PinturasController@deleteRespuesta');
	
	// Encuesta Producto
	Route::get('eproducto','PinturasController@Showeproducto');
	Route::post('addeproducto','PinturasController@addeproducto');
	Route::get('geteproducto','PinturasController@geteproducto');
	Route::put('deleteeproducto','PinturasController@deleteeproducto');
	
	// Detalle Expediente
	Route::get('dexpediente','PinturasController@Showdexpediente');
	Route::post('adddexpediente','PinturasController@adddexpediente');
	Route::get('getdexpediente','PinturasController@getdexpediente');
	
	// facturas
	Route::get('factura','PinturasController@Showfactura');
	Route::post('addfactura','PinturasController@addfactura');
	Route::get('getfactura','PinturasController@getfactura');
	
	// Detalle Factura
	Route::get('dFactura','PinturasController@ShowdFactura');
	Route::post('adddFactura','PinturasController@adddFactura');
	Route::get('getdFactura','PinturasController@getdFactura');
	
	// Bitácora
	Route::get('bitacora','PinturasController@Showbitacora');
	Route::get('getbitacora','PinturasController@getbitacora');

	Route::get('getProductoChats','PinturasController@getProductoChats');


	//------------------------------------------------------------
});
// Section Pages
Route::view('/sample/error404','errors.404')->name('error404');
Route::view('/sample/error500','errors.500')->name('error500');