<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\usuarios;
use DB;

class usuarioController extends Controller
{
    public function getUsuarios(){
        $usuario = DB::select("exec sp_listar_usuario");

        return response()->json($usuario,200);
    }
    public function getUsuariosxId($id){
        
        $usuario = DB::select("exec sp_listar_usuario $id");
        return response()->json($usuario,200);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $user = new usuarios;
        $user->usuario = $request->usuario;
        $user->primerNombre = $request->primerNombre;
        $user->segundoNombre = $request->segundoNombre;
        $user->primerApellido = $request->primerApellido;
        $user->segundoApellido = $request->segundoApellido;
        $user->idDepartamento = $request->idDepartamento;
        $user->idCargo = $request->idCargo;
        $user->save();
        return response()->json($user);
    }

        /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, usuarios $user)
    {
        $user->usuario = $request->usuario;
        $user->primerNombre = $request->primerNombre;
        $user->segundoNombre = $request->segundoNombre;
        $user->primerApellido = $request->primerApellido;
        $user->segundoApellido = $request->segundoApellido;
        $user->idDepartamento = $request->idDepartamento;
        $user->idCargo = $request->idCargo;
        $user->save();
        return response()->json($user);
    }

    public function destroy(usuarios $user)
    {
        $user->delete();
        return response()->json($user);
    }
    
    
}
