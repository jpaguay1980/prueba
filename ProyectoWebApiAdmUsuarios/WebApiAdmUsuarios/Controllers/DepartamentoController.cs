using System.Collections.Generic;
using System.Web.Http;
using WebApiAdmUsuarios.Data;
using WebApiAdmUsuarios.Models;

namespace WebApiAdmUsuarios.Controllers
{
    public class DepartamentoController : ApiController
    {
        // GET api/<controller>
        public List<Departamentos> Get()
        {
            return ModelData.ListarDepartamentos();
        }
    }
}