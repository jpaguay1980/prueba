using System.Collections.Generic;
using System.Web.Http;
using WebApiAdmUsuarios.Data;
using WebApiAdmUsuarios.Models;

namespace WebApiAdmUsuarios.Controllers
{
    public class CargosController : ApiController
    {
        // GET api/<controller>
        public List<Cargos> Get()
        {
            return ModelData.ListarCargos();
        }
        
    }
}