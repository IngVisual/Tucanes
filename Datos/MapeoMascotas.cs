using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Datos
{
    public class MapeoMascotas
    {
        private Conexion acceso = new Conexion();

        public void RegistroMascota(Modelo.EntidadMascota usuario, Modelo.EntidadImagenes imagen)
        {
            List<SqlParameter> parameter = new List<SqlParameter>();
            parameter.Add(acceso.CrearParametro("@Codigo", usuario.Codigo));
            parameter.Add(acceso.CrearParametro("@Estado", usuario.Estado));
            parameter.Add(acceso.CrearParametro("@Especie", usuario.Especie));
            parameter.Add(acceso.CrearParametro("@Nombre", usuario.Nombre));
            parameter.Add(acceso.CrearParametro("@TipoEncargado", usuario.TipoEncargado));
            parameter.Add(acceso.CrearParametro("@NombreEncargado", usuario.NombreEncargado));
            parameter.Add(acceso.CrearParametro("@NumeroCarnet", usuario.NumeroCarnet));
            parameter.Add(acceso.CrearParametro("@Sexo", usuario.Sexo));
            parameter.Add(acceso.CrearParametro("@Raza", usuario.Raza));
            parameter.Add(acceso.CrearParametro("@Color", usuario.Color));
            parameter.Add(acceso.CrearParametro("@Respuesta", usuario.Respuesta));
            parameter.Add(acceso.CrearParametro("@RazaEspecial", usuario.RazaEspecial));
            parameter.Add(acceso.CrearParametro("@Esterilizado", usuario.Esterilizado));
            parameter.Add(acceso.CrearParametro("@Discapacidad", usuario.Discapacidad));
            parameter.Add(acceso.CrearParametro("@Edad", usuario.Edad));
            parameter.Add(acceso.CrearParametro("@Correo", usuario.Correo));
            parameter.Add(acceso.CrearParametro("@Telefono", usuario.Telefono));
            parameter.Add(acceso.CrearParametro("@IdMascota", imagen.IdMascota));
            parameter.Add(acceso.CrearParametro("@Carnet", imagen.Carnet));
            parameter.Add(acceso.CrearParametro("@FotoMascota", imagen.FotoMascota));
            acceso.GuardarDatos("spcargar_Mascota", parameter);
        }

        public DataTable MostrarMascotaCodigo(Modelo.EntidadMascota usuario)
        {
            List<SqlParameter> parameter = new List<SqlParameter>();
            parameter.Add(acceso.CrearParametro("@Codigo", usuario.Codigo));
            var dt = acceso.Leer("sp_MostrarMascotaCodigo", parameter);
            return dt;
        }

        public void ActualizarCarnet(Modelo.EntidadImagenes usuario)
        {
            List<SqlParameter> parameter = new List<SqlParameter>();
            parameter.Add(acceso.CrearParametro("@Carnet", usuario.Carnet));
            parameter.Add(acceso.CrearParametro("@IdMascota", usuario.IdMascota));
            acceso.GuardarDatos("sp_ActualizarCarnet", parameter);
        }
        public DataTable MostrarMascotaTabla()
        {
            DataTable dt = acceso.Leer("sp_MostrarMascotaTabla", null);
            return dt;
        }

        public DataTable MostrarMascotaId(Modelo.EntidadMascota usuario)
        {
            List<SqlParameter> parameter = new List<SqlParameter>();
            parameter.Add(acceso.CrearParametro("@Id", usuario.Id));
            var dt = acceso.Leer("sp_MostrarMascotaId", parameter);
            return dt;
        }

        public DataTable ActualizarSolMascota(Modelo.EntidadMascota usuario)
        {
            List<SqlParameter> parameter = new List<SqlParameter>();
            parameter.Add(acceso.CrearParametro("@Id", usuario.Id));
            parameter.Add(acceso.CrearParametro("@Respuesta", usuario.Respuesta));
            parameter.Add(acceso.CrearParametro("@FechaRespuesta", usuario.FechaRespuesta));
            parameter.Add(acceso.CrearParametro("@Estado", usuario.Estado));
            parameter.Add(acceso.CrearParametro("@RazaEspecial", usuario.RazaEspecial));
            DataTable dt = acceso.Leer("sp_ActualizarMascota", parameter);
            return dt;
        }
    }
}
