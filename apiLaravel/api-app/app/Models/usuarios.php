<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class usuarios extends Model
{
    use HasFactory;
    public $timestamps = false;
    protected $fillable = ['id','usuario','primerNombre','segundoNombre','primerApellido','segundoApellido','idDepartamento','idCargo','departamento','cargo'];
    
}
