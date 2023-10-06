import { Component, OnInit } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';
import { ApiService } from '../../servicios/api/api.service';
import { ListaUsuariosI } from 'src/app/modelos/listausuarios.interface';
import { usuarios } from 'src/app/modelos/usuarios.interfase';
import { ListaCargosI } from 'src/app/modelos/listacargos.inteface';
import { FormGroup,  FormBuilder } from '@angular/forms';
import { AlertasService } from '../../servicios/alertas/alertas.service';
import { cargosI } from 'src/app/modelos/cargos.interface';

@Component({
  selector: 'app-editar',
  templateUrl: './editar.component.html',
  styleUrls: ['./editar.component.css']
})

export class EditarComponent implements OnInit {
  userI!: usuarios;
  lista : ListaUsuariosI[]=[];
  cargoI! : cargosI;
  listaCargos : ListaCargosI[]=[];  

  formDatosUsuario!: FormGroup;
constructor(private router:Router, private activeroute: ActivatedRoute,private api:ApiService, 
            private fb: FormBuilder, private alerta:AlertasService){
  }

  datosUsuario!: ListaUsuariosI;
  selectedCargoOption: number = 0;
  
ngOnInit(): void {
  this.api.getListaCargos().subscribe(data =>{
    this.cargoI = data;
    this.listaCargos = this.cargoI.$values!;
  });
  let usuarioId: number = Number(this.activeroute.snapshot.paramMap.get('id'));
  this.api.getUsuario(usuarioId).subscribe(data => {
      this.userI = data;
      this.lista = this.userI.$values!;
      this.datosUsuario = this.lista[0]; 
      console.log(usuarioId);
      this.selectedCargoOption =Number([this.datosUsuario.idCargo]);
      this.formDatosUsuario = this.fb.group({    
        id: [usuarioId! ],
        usuario: [this.datosUsuario.usuario!],
        primerNombre: [this.datosUsuario.primerNombre!],
        segundoNombre: [this.datosUsuario.segundoNombre],
        primerApellido: [this.datosUsuario.primerApellido],
        segundoApellido: [this.datosUsuario.segundoApellido],
        idDepartamento: [this.datosUsuario.idDepartamento],
        idCargo: [this.datosUsuario.idCargo]
      }
      );  
    }
  )
}

postForm(form:ListaUsuariosI){
    this.api.putUsuario(form).subscribe( data =>{
        
          this.alerta.showSuccess("Mensaje de sistema","Se actualiza con exito");
          this.router.navigate(['dashboard']);
              
    }
    );
}

eliminar(form:ListaUsuariosI){
  this.api.deleteUsuario(form).subscribe( data =>{
    
          this.alerta.showSuccess("Mensaje de sistema","Se elimina con exito");
          this.router.navigate(['dashboard']);
        
  }
  );
}

salir(){  
          this.router.navigate(['dashboard']);        
}

}
