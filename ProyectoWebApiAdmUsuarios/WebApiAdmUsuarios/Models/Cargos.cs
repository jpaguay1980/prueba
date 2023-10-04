using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApiAdmUsuarios.Models
{
    public class Cargos
    {
        public int Id { get; set; }
        public string codigo { get; set; }
        public string nombre { get; set; }
        public bool activo { get; set; }
        public int idUsuarioCreacion { get; set; }
    }
}