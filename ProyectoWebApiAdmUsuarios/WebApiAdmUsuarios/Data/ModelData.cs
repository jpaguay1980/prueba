using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using WebApiAdmUsuarios.Models;

namespace WebApiAdmUsuarios.Data
{
    public class ModelData
    {
        public static bool Registrar(Users oUsuario)
        {
            using (SqlConnection oConexion = new SqlConnection(Conexion.rutaConexion))
            {
                SqlCommand cmd = new SqlCommand("sp_crear_usuario", oConexion);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@usuario", oUsuario.Usuario);
                cmd.Parameters.AddWithValue("@primerNombre", oUsuario.PrimerNombre);
                cmd.Parameters.AddWithValue("@segundoNombre", oUsuario.SegundoNombre);
                cmd.Parameters.AddWithValue("@primerApellido", oUsuario.PrimerApellido);
                cmd.Parameters.AddWithValue("@segundoApellido", oUsuario.SegundoApellido);
                cmd.Parameters.AddWithValue("@idDepartamento", oUsuario.idDepartamento);
                cmd.Parameters.AddWithValue("@idCargo", oUsuario.idCargo);

                try
                {
                    oConexion.Open();
                    cmd.ExecuteNonQuery();
                    return true;
                }
                catch (Exception ex)
                {
                    return false;
                }
            }
        }


        public static bool Modificar(Users oUsuario)
        {
            using (SqlConnection oConexion = new SqlConnection(Conexion.rutaConexion))
            {
                SqlCommand cmd = new SqlCommand("sp_modificar_usuario", oConexion);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id", oUsuario.Id);
                cmd.Parameters.AddWithValue("@usuario", oUsuario.Usuario);
                cmd.Parameters.AddWithValue("@primerNombre", oUsuario.PrimerNombre);
                cmd.Parameters.AddWithValue("@segundoNombre", oUsuario.SegundoNombre);
                cmd.Parameters.AddWithValue("@primerApellido", oUsuario.PrimerApellido);
                cmd.Parameters.AddWithValue("@segundoApellido", oUsuario.SegundoApellido);
                cmd.Parameters.AddWithValue("@idDepartamento", oUsuario.idDepartamento);
                cmd.Parameters.AddWithValue("@idCargo", oUsuario.idCargo);

                try
                {
                    oConexion.Open();
                    cmd.ExecuteNonQuery();
                    return true;
                }
                catch (Exception ex)
                {
                    return false;
                }
            }
        }



        public static List<Users> ListarUsuario(int? id)
        {
            List<Users> oListaUsuario = new List<Users>();
            using (SqlConnection oConexion = new SqlConnection(Conexion.rutaConexion))
            {
                SqlCommand cmd = new SqlCommand("sp_listar_usuario", oConexion);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id", id);
                try
                {
                    oConexion.Open();
                    cmd.ExecuteNonQuery();

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {

                        while (dr.Read())
                        {
                            oListaUsuario.Add(new Users()
                            {
                                Id = Convert.ToInt32(dr["Id"]),
                                Usuario = dr["Usuario"].ToString(),
                                PrimerNombre = dr["PrimerNombre"].ToString(),
                                SegundoNombre = dr["SegundoNombre"].ToString(),
                                PrimerApellido = dr["PrimerApellido"].ToString(),
                                SegundoApellido = dr["SegundoApellido"].ToString(),
                                idDepartamento = Convert.ToInt32(dr["idDepartamento"]),
                                idCargo = Convert.ToInt32(dr["idCargo"]),
                                Departamento = dr["Departamento"].ToString(),
                                Cargo = dr["Cargo"].ToString()
                            });
                        }

                    }



                    return oListaUsuario;
                }
                catch (Exception ex)
                {
                    return oListaUsuario;
                }
            }
        }



        
        public static bool Eliminar(int id)
        {
            using (SqlConnection oConexion = new SqlConnection(Conexion.rutaConexion))
            {
                SqlCommand cmd = new SqlCommand("sp_eliminar_usuario", oConexion);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id", id);

                try
                {
                    oConexion.Open();
                    cmd.ExecuteNonQuery();
                    return true;
                }
                catch (Exception ex)
                {
                    return false;
                }
            }
        }


        public static List<Cargos> ListarCargos()
        {
            List<Cargos> oListaCargos = new List<Cargos>();
            using (SqlConnection oConexion = new SqlConnection(Conexion.rutaConexion))
            {
                SqlCommand cmd = new SqlCommand("sp_lista_cargos", oConexion);
                cmd.CommandType = CommandType.StoredProcedure;
                try
                {   
                    oConexion.Open();
                    cmd.ExecuteNonQuery();
                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        while (dr.Read())
                        {
                            oListaCargos.Add(new Cargos()
                            {
                                Id = Convert.ToInt32(dr["Id"]),
                                codigo = dr["codigo"].ToString(),
                                nombre = dr["nombre"].ToString(),
                                activo = bool.Parse(dr["activo"].ToString()),
                                idUsuarioCreacion = Convert.ToInt32(dr["idUsuarioCreacion"])
                            });
                        }

                    }
                    return oListaCargos;
                }
                catch (Exception ex)
                {
                    return oListaCargos;
                }
            }
        }


        public static List<Departamentos> ListarDepartamentos()
        {
            List<Departamentos> oListaDepartamentos = new List<Departamentos>();
            using (SqlConnection oConexion = new SqlConnection(Conexion.rutaConexion))
            {
                SqlCommand cmd = new SqlCommand("sp_lista_departamentos", oConexion);
                cmd.CommandType = CommandType.StoredProcedure;
                try
                {
                    oConexion.Open();
                    cmd.ExecuteNonQuery();
                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        while (dr.Read())
                        {
                            oListaDepartamentos.Add(new Departamentos()
                            {
                                Id = Convert.ToInt32(dr["Id"]),
                                codigo = dr["codigo"].ToString(),
                                nombre = dr["nombre"].ToString(),
                                activo = bool.Parse(dr["activo"].ToString()),
                                idUsuarioCreacion = Convert.ToInt32(dr["idUsuarioCreacion"])
                            });
                        }

                    }
                    return oListaDepartamentos;
                }
                catch (Exception ex)
                {
                    return oListaDepartamentos;
                }
            }
        }

    }
}