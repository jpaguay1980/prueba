using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApiAdmUsuarios.Models
{
    public class Departamentos
    {
        public int Id { get; set; }
        public string codigo { get; set; }
        public string nombre { get; set; }
        public Boolean activo { get; set; }
        public int idUsuarioCreacion { get; set; }
    }
}