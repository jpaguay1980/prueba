import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { DashboardComponent } from './vistas/dashboard/dashboard.component';
import { NuevoComponent } from './vistas/nuevo/nuevo.component';
import { EditarComponent } from './vistas/editar/editar.component';
import { ReactiveFormsModule } from '@angular/forms';

const routes: Routes = [
  {path:'', redirectTo:'Dashboard', pathMatch:'full'},
  {path:'dashboard', component:DashboardComponent},
  {path:'nuevo', component:NuevoComponent},
  {path:'editar/:id', component:EditarComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes), ReactiveFormsModule],
  exports: [RouterModule]
})
export class AppRoutingModule { }
export const routingComponent = [DashboardComponent,NuevoComponent,EditarComponent]
