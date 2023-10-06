import { Component,OnInit } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';
import { ApiService } from '../../servicios/api/api.service';
import { FormGroup,  FormBuilder } from '@angular/forms';
import { AlertasService } from '../../servicios/alertas/alertas.service';
import { ListaCargosI } from 'src/app/modelos/listacargos.inteface';
import { cargosI } from 'src/app/modelos/cargos.interface';
import { ListaUsuariosI } from 'src/app/modelos/listausuarios.interface';
import { usuarios } from 'src/app/modelos/usuarios.interfase';
import { ListaDepartamentosI } from 'src/app/modelos/listadepartamentos.interface';
import { departamentosI } from 'src/app/modelos/departamentos.interface';

@Component({
  selector: 'app-nuevo',
  templateUrl: './nuevo.component.html',
  styleUrls: ['./nuevo.component.css']
})


export class NuevoComponent implements OnInit {
  userI!: usuarios;
  lista : ListaUsuariosI[]=[];
  cargoI! : cargosI;
  listaCargos : ListaCargosI[]=[];
  departamentoI! : departamentosI;
  listaDepartamentos : ListaDepartamentosI[]=[];

  formDatosUsuario!: FormGroup;
constructor(private router:Router, private activeroute: ActivatedRoute,private api:ApiService, private fb: FormBuilder,
            private alerta:AlertasService){
  }

datosUsuario!: ListaUsuariosI;
  

ngOnInit(): void {
  this.api.getListaCargos().subscribe(data =>{
    this.cargoI = data;
    this.listaCargos = this.cargoI.$values!;
  });
  this.api.getListaDepartamentos().subscribe(data =>{
    this.departamentoI = data;
    this.listaDepartamentos = this.departamentoI.$values!;
  });
      this.formDatosUsuario = this.fb.group({    
        id: ['0'],
        usuario: [''],
        primerNombre: [''],
        segundoNombre: [''],
        primerApellido: [''],
        segundoApellido: [''],
        idDepartamento: [''],
        idCargo: ['']
      }
      );  
    
  
}

postForm(form:ListaUsuariosI){
    this.api.postUsuario(form).subscribe( data =>{
        
          this.alerta.showSuccess("Mensaje de sistema","Se grabó con exito");
          this.router.navigate(['dashboard']);
              
    }
    );
}

 
salir(){  
          this.router.navigate(['dashboard']);        
}

}
