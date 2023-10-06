import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { ApiService } from '../../servicios/api/api.service';
import { usuarios } from '../../modelos/usuarios.interfase';
import { ListaUsuariosI } from '../../modelos/listausuarios.interface'

@Component({
  selector: 'app-dashboard',
  templateUrl: './dashboard.component.html',
  styleUrls: ['./dashboard.component.css']
})
export class DashboardComponent implements OnInit  {

  userI!: usuarios;
  lista : ListaUsuariosI[]=[];

  constructor(private api:ApiService, private router:Router){}
  ngOnInit(): void {
      this.api.getListaUsuarios().subscribe(data => {
      this.userI = data;
      this.lista = this.userI.$values!;
    }
    )
  }

  editarUsuario(id: any){
    this.router.navigate(["editar",id]);
  }
  nuevoUsuario(){
    this.router.navigate(["nuevo"]);
  }
}
