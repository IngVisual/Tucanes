using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;

namespace Datos
{
    public class MapeoContrato
    {
        private Datos.Conexion acceso = new Conexion();
        public Modelo.EntidadContrato parq = new Modelo.EntidadContrato();

        public DataTable MostrarContrato(Modelo.EntidadContrato Usuario)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();   
            parameters.Add(acceso.CrearParametro("@IdContrato", Usuario.IdContrato));
            DataTable dt = acceso.Leer("sp_MostrarContrato", parameters);
            return dt;
        }
        public DataTable ActualizarContrato(Modelo.EntidadContrato Usuario)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@IdContrato", Usuario.IdContrato));
            parameters.Add(acceso.CrearParametro("@Contrato", Usuario._ConGen));
            parameters.Add(acceso.CrearParametro("@Tipo", Usuario._Tipo));
            DataTable dt = acceso.Leer("sp_ActualizarContrato", parameters);
            return dt;
        }
    }
}
