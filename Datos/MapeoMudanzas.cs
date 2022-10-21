using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace Datos
{
    public class MapeoMudanzas
    {
        private Conexion acceso = new Conexion();
        //public DataTable MostrarTipoMud(int Tipo)
        //{
        //    List<SqlParameter> parameters = new List<SqlParameter>();
        //    parameters.Add(acceso.CrearParametro("@IdTipoMud", Tipo));
        //    DataTable dt = acceso.Leer("sp_MostrarTipoMud", parameters);
        //    return dt;
        //}

        public void GuardarMudSalArt(Modelo.EntidadMudanzas usuario, Modelo.EntidadImagenes imagen)
        {
            List<SqlParameter> parameter = new List<SqlParameter>();
            parameter.Add(acceso.CrearParametro("@Codigo", usuario.Codigo));
            parameter.Add(acceso.CrearParametro("@Estado", usuario.Estado));
            parameter.Add(acceso.CrearParametro("@Respuesta", usuario.Respuesta));
            parameter.Add(acceso.CrearParametro("@Observacion", usuario.Observacion));
            parameter.Add(acceso.CrearParametro("@FechaIniMud", usuario.FechaIniMud));
            parameter.Add(acceso.CrearParametro("@FechaFinMud", usuario.FechaFinMud));
            parameter.Add(acceso.CrearParametro("@Autorizado", usuario.Autorizado));
            parameter.Add(acceso.CrearParametro("@Cedula", usuario.Cedula));
            parameter.Add(acceso.CrearParametro("@Encargado", usuario.Encargado));
            parameter.Add(acceso.CrearParametro("@IdTipoMud", usuario.IdTipoMud));
            parameter.Add(acceso.CrearParametro("@IdSolMud", imagen.IdSolMud));
            parameter.Add(acceso.CrearParametro("@CedulaIma", imagen.Cedula));
            parameter.Add(acceso.CrearParametro("@Firma", imagen.Firma));
            acceso.GuardarDatos("spcargar_Mudanza", parameter);
        }

        public void GuardarMudIng(Modelo.EntidadMudanzas usuario, Modelo.EntidadImagenes imagen)
        {
            List<SqlParameter> parameter = new List<SqlParameter>();
            parameter.Add(acceso.CrearParametro("@Codigo", usuario.Codigo));
            parameter.Add(acceso.CrearParametro("@Estado", usuario.Estado));
            parameter.Add(acceso.CrearParametro("@Respuesta", usuario.Respuesta));
            parameter.Add(acceso.CrearParametro("@Observacion", usuario.Observacion));
            parameter.Add(acceso.CrearParametro("@FechaIniMud", usuario.FechaIniMud));
            parameter.Add(acceso.CrearParametro("@FechaFinMud", usuario.FechaFinMud));
            parameter.Add(acceso.CrearParametro("@Autorizado", usuario.Autorizado));
            parameter.Add(acceso.CrearParametro("@Cedula", usuario.Cedula));
            parameter.Add(acceso.CrearParametro("@Encargado", usuario.Encargado));
            parameter.Add(acceso.CrearParametro("@IdTipoMud", usuario.IdTipoMud));
            parameter.Add(acceso.CrearParametro("@IdSolMud", imagen.IdSolMud));
            parameter.Add(acceso.CrearParametro("@CedulaIma", imagen.Cedula));
            parameter.Add(acceso.CrearParametro("@Firma", imagen.Firma));
            parameter.Add(acceso.CrearParametro("@DocumentoPDF", imagen.DocumentoPDF));
            acceso.GuardarDatos("spcargar_MudanzaIngreso", parameter);
        }
        public void GuardarMudanza(Modelo.EntidadMudanzas usuario)
        {
            List<SqlParameter> parameter = new List<SqlParameter>();
            parameter.Add(acceso.CrearParametro("@Codigo", usuario.Codigo));
            parameter.Add(acceso.CrearParametro("@Estado", usuario.Estado));
            parameter.Add(acceso.CrearParametro("@Respuesta", usuario.Respuesta));
            parameter.Add(acceso.CrearParametro("@Observacion", usuario.Observacion));
            parameter.Add(acceso.CrearParametro("@FechaIniMud", usuario.FechaIniMud));
            parameter.Add(acceso.CrearParametro("@FechaFinMud", usuario.FechaFinMud));
            parameter.Add(acceso.CrearParametro("@Autorizado", usuario.Autorizado));
            parameter.Add(acceso.CrearParametro("@Cedula", usuario.Cedula));
            parameter.Add(acceso.CrearParametro("@Encargado", usuario.Encargado));
            parameter.Add(acceso.CrearParametro("@IdTipoMud", usuario.IdTipoMud));
            acceso.GuardarDatos("spcargar_MudanzaAdministrador", parameter);
        }

        public DataTable MostrarMudanza(Modelo.EntidadMudanzas Usuario)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@Codigo", Usuario.Codigo));
            DataTable dt = acceso.Leer("sp_MostrarMudunza", parameters);
            return dt;
        }

        public DataTable MostrarUnaMudanza(Modelo.EntidadMudanzas Usuario)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@Id", Usuario.Id));
            parameters.Add(acceso.CrearParametro("@Codigo", Usuario.Codigo));
                DataTable dt = acceso.Leer("sp_MostrarUnaMudunza", parameters);
            return dt;
        }
        public DataTable MostrarUnaMudanzaCodigo(Modelo.EntidadMudanzas Usuario)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@Codigo", Usuario.Codigo));
            DataTable dt = acceso.Leer("sp_MostrarUnaMudanzaCodigo", parameters);
            return dt;
        }
        public DataTable MostrarUnaMudanzaCodigoTipo(Modelo.EntidadMudanzas Usuario)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@Codigo", Usuario.Codigo));
            DataTable dt = acceso.Leer("sp_MostrarUnaMudanzaCodigoTipo", parameters);
            return dt;
        }
        public DataTable MostrarUnaMudanzaID(Modelo.EntidadMudanzas Usuario)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@Id", Usuario.Id));
            DataTable dt = acceso.Leer("sp_MostrarUnaMudanzaID", parameters);
            return dt;
        }

        public DataTable MostrarMudanzaEstado(Modelo.EntidadMudanzas Usuario)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@Estado", Usuario.Estado));
            DataTable dt = acceso.Leer("sp_MostrarUnaMudunzaEstado", parameters);
            return dt;
        }

        public DataTable EliminarSolMud(Modelo.EntidadMudanzas Usuario)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@Id", Usuario.Id));
            DataTable dt = acceso.Leer("EliminarMudanza", parameters);
            return dt;
        }
        public DataTable ActualizarSolMud(Modelo.EntidadMudanzas usuario)
        {
            List<SqlParameter> parameter = new List<SqlParameter>();
            parameter.Add(acceso.CrearParametro("@Id", usuario.Id));
            parameter.Add(acceso.CrearParametro("@Respuesta", usuario.Respuesta));
            parameter.Add(acceso.CrearParametro("@FechaRes", usuario.FechaRes));
            parameter.Add(acceso.CrearParametro("@Estado", usuario.Estado));
            parameter.Add(acceso.CrearParametro("@ObservacionAdm", usuario.ObservacionAdm));
            parameter.Add(acceso.CrearParametro("@IdCorreo", usuario.IdCorreo));
            DataTable dt = acceso.Leer("ActualizarMudanza", parameter);
            return dt;
        }

        public DataTable ActualizarMudanzaVig(Modelo.EntidadMudanzas Usuario)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@Id", Usuario.Id));
            parameters.Add(acceso.CrearParametro("@Estado", Usuario.Estado));
            parameters.Add(acceso.CrearParametro("@ObservacionAdm", Usuario.ObservacionAdm));
            DataTable dt = acceso.Leer("sp_ActualizarMudanzaVig", parameters);
            return dt;
        }
        public DataTable MostrarSolMudaTabla()
        {
            DataTable dt = acceso.Leer("sp_MostrarSolMudaTabla", null);
            return dt;
        }

        public DataTable MostrarSolMudaTablaTipo()
        {
            DataTable dt = acceso.Leer("sp_MostrarSolMudaTablaTipo", null);
            return dt;
        }

        // Valida la limite de fechas del salon social y mudanza
        public bool ValidarFecha(DateTime fecha, int dia)
        {
            var fechahoy = DateTime.Now.ToLocalTime();
            var fechaProgramacion = fecha;
            var fechaLimite = fechahoy.AddDays(dia);

            if (fechaProgramacion < fechaLimite)
            {
                return false;
            }
            else
            {
                return true;
            }
        }
    }
}
