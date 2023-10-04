using System.Collections.Generic;
using System.Web.Http;
using WebApiAdmUsuarios.Data;
using WebApiAdmUsuarios.Models;

namespace WebApiAdmUsuarios.Controllers
{
    public class UserController : ApiController
    {
        // GET api/<controller>
        public List<Users> Get()
        {
            return ModelData.ListarUsuario();
        }

        // POST api/<controller>
        public bool Post([FromBody] Users oUsuario)
        {
            return ModelData.Registrar(oUsuario);
        }
        
        // PUT api/<controller>/5
        public bool Put([FromBody] Users oUsuario)
        {
            return ModelData.Modificar(oUsuario);
        }

        // DELETE api/<controller>/5
        public bool Delete(int id)
        {
            return ModelData.Eliminar(id);
        }
    }
}