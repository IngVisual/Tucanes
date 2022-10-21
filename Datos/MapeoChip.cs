using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;

namespace Datos
{
    public class MapeoChip
    {
        private Conexion acceso = new Conexion();
        public Modelo.EntidadChip parq = new Modelo.EntidadChip();

        public void RegistroChipConRecibo(Modelo.EntidadChip Usuario, Modelo.EntidadImagenes imagen)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@Codigo", Usuario.Codigo));
            parameters.Add(acceso.CrearParametro("@Estado", Usuario.Estado));
            parameters.Add(acceso.CrearParametro("@Respuesta", Usuario._Respuesta));
            parameters.Add(acceso.CrearParametro("@Tipo", Usuario._Tipo));
            parameters.Add(acceso.CrearParametro("@Destinado", Usuario._Destinado));
            parameters.Add(acceso.CrearParametro("@Documento", Usuario._Documento));
            parameters.Add(acceso.CrearParametro("@Nombre", Usuario._Nombre));
            parameters.Add(acceso.CrearParametro("@Perdida", Usuario._Perdida));
            parameters.Add(acceso.CrearParametro("@Nuevo", Usuario._Nuevo));
            parameters.Add(acceso.CrearParametro("@IdRec", Usuario._IdRec));
            parameters.Add(acceso.CrearParametro("@IdChip", imagen.IdChip));
            parameters.Add(acceso.CrearParametro("@DocIdent", imagen.DocumentoChip));
            parameters.Add(acceso.CrearParametro("@Recibo", imagen.ReciboChip));
            acceso.GuardarDatos("spcargar_TabChip", parameters);
        }
        public DataTable BuscarRecibo(Modelo.EntidadImagenes Usuario)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@IdChipRec", Usuario.IdChipRec));
            DataTable dt = acceso.Leer("sp_MostrarImaRecibo", parameters);
            return dt;
        }

        public void RegistroChipSinRecibo(Modelo.EntidadChip Usuario, Modelo.EntidadImagenes imagen)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@Codigo", Usuario.Codigo));
            parameters.Add(acceso.CrearParametro("@Estado", Usuario.Estado));
            parameters.Add(acceso.CrearParametro("@Respuesta", Usuario._Respuesta));
            parameters.Add(acceso.CrearParametro("@Tipo", Usuario._Tipo));
            parameters.Add(acceso.CrearParametro("@Destinado", Usuario._Destinado));
            parameters.Add(acceso.CrearParametro("@Documento", Usuario._Documento));
            parameters.Add(acceso.CrearParametro("@Nombre", Usuario._Nombre));
            parameters.Add(acceso.CrearParametro("@Perdida", Usuario._Perdida));
            parameters.Add(acceso.CrearParametro("@Nuevo", Usuario._Nuevo));
            //parameters.Add(acceso.CrearParametro("@IdRec", Usuario._IdRec));
            parameters.Add(acceso.CrearParametro("@IdChip", imagen.IdChip));
            parameters.Add(acceso.CrearParametro("@DocIdent", imagen.DocumentoChip));
            acceso.GuardarDatos("spcargar_Chip", parameters);
        }

        public int EvaluarEstadoChip(Modelo.EntidadChip Usuario)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@Codigo", Usuario.Codigo));
            parameters.Add(acceso.CrearParametro("@Estado", Usuario.Estado));
            int dt = acceso.Escribir("sp_EvaluarEstadoChip", parameters);
            return dt;
        }

        public DataTable BuscarEstadoChip(Modelo.EntidadChip Usuario)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@Codigo", Usuario.Codigo));
            parameters.Add(acceso.CrearParametro("@Estado", Usuario.Estado));
            DataTable dt = acceso.Leer("sp_BuscarEstadoChip", parameters);
            return dt;
        }

        public DataTable MostrarChip(Modelo.EntidadChip Usuario)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@Codigo", Usuario.Codigo));
            DataTable dt = acceso.Leer("sp_BuscarChipCodigo", parameters);
            return dt;
        }
        public DataTable MostrarUnChipCodigo(Modelo.EntidadChip Usuario)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@Codigo", Usuario.Codigo));
            DataTable dt = acceso.Leer("sp_MostrarUnChipCodigo", parameters);
            return dt;
        }


        public DataTable MostrarUnChip(Modelo.EntidadChip Usuario)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@Codigo", Usuario.Codigo));
            parameters.Add(acceso.CrearParametro("@Id", Usuario._Id));
            DataTable dt = acceso.Leer("sp_MostrarUnChip", parameters);
            return dt;
        }

        public DataTable MostrarUnChipID(Modelo.EntidadChip Usuario)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@Id", Usuario._Id));
            DataTable dt = acceso.Leer("sp_MostrarUnChipID", parameters);
            return dt;
        }

        public DataTable MostrarChipTabla()
        {
            DataTable dt = acceso.Leer("sp_MostrarChipTabla", null);
            return dt;
        }
        public DataTable ActualizarChip(Modelo.EntidadChip usuario)
        {
            List<SqlParameter> parameter = new List<SqlParameter>();
            parameter.Add(acceso.CrearParametro("@Id", usuario._Id));
            parameter.Add(acceso.CrearParametro("@Respuesta", usuario._Respuesta));
            parameter.Add(acceso.CrearParametro("@FechaRes", usuario._FechaRes));
            parameter.Add(acceso.CrearParametro("@Estado", usuario.Estado));
            parameter.Add(acceso.CrearParametro("@IdCorreo", usuario._IdCorreo));
            DataTable dt = acceso.Leer("ActualizarChip", parameter);
            return dt;
        }

        public DataTable EliminarChip(Modelo.EntidadChip Usuario)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@Id", Usuario._Id));
            DataTable dt = acceso.Leer("EliminarChip", parameters);
            return dt;
        }
    }
}
