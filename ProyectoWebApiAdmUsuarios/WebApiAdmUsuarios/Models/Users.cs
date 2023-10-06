using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApiAdmUsuarios.Models
{
    public class Users
    {
        public int Id { get; set; }
        public string Usuario { get; set; }
        public string PrimerNombre { get; set; }
        public string SegundoNombre { get; set; }
        public string PrimerApellido { get; set; }
        public string SegundoApellido { get; set; }
        public int idDepartamento { get; set; }
        public int idCargo { get; set; }
        public string Departamento { get; set; } = "";
        public string Cargo { get; set; } = "";

    }
}