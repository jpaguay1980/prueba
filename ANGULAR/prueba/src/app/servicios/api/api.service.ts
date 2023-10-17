import { Injectable } from '@angular/core';
import { cargosI } from '../../modelos/cargos.interface';
import { departamentosI } from '../../modelos/departamentos.interface';
import { usuarios } from '../../modelos/usuarios.interfase';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs'
import { ListaUsuariosI } from 'src/app/modelos/listausuarios.interface';
import { ResponseI } from 'src/app/modelos/response.interface';

@Injectable({
  providedIn: 'root'
})
export class ApiService {

  url : string = "http://127.0.0.1:8000/api/";

  constructor(private http:HttpClient) { }

  getListaCargos():Observable<cargosI>{
    let direccion = this.url + "Cargos";
    return this.http.get<cargosI>(direccion);
  }

  getListaDepartamentos():Observable<departamentosI>{
    let direccion = this.url + "Departamento";
    return this.http.get<departamentosI>(direccion);
  }
  
  getListaUsuarios():Observable<usuarios>{
    let direccion = this.url + "Users";
    return this.http.get<usuarios>(direccion);
  }

  getUsuario(id:number):Observable<usuarios>{
    let direccion = this.url + "UserxId/" + id;
    return this.http.get<usuarios>(direccion);
  }

  putUsuario(form:ListaUsuariosI):Observable<ResponseI> {
    let direccion = this.url + "updUser";
    return this.http.put<ResponseI>(direccion,form);
  }
  
  postUsuario(form:ListaUsuariosI):Observable<ResponseI> {
    let direccion = this.url + "addUser";
    return this.http.post<ResponseI>(direccion,form);
  }

  //
  deleteUsuario(form:ListaUsuariosI):Observable<ResponseI> {
    let direccion = this.url + "delUser";
    return this.http.delete<ResponseI>(direccion);
  }

}
