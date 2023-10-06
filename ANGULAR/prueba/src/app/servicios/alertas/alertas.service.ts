import { Injectable } from '@angular/core';
import { ToastrService } from 'ngx-toastr';

@Injectable({
  providedIn: 'root'
})
export class AlertasService {

  constructor(private toast : ToastrService) { }

  showSuccess(titulo: string | '', mensaje: string | ''){
    this.toast.success(mensaje, titulo);
  }
  showError(titulo: string | '', mensaje: string | ''){
    this.toast.error(mensaje, titulo);
  }
}
