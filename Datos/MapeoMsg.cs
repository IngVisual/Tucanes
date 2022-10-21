using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace Datos
{
    public class MapeoMsg
    {
        private Datos.Conexion acceso = new Conexion();
        public Modelo.EntidadMsg msg = new Modelo.EntidadMsg();

        public DataTable MostrarMsg(Modelo.EntidadMsg Usuario)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@Id", Usuario._Id));
            DataTable dt = acceso.Leer("sp_MostrarMsg", parameters);
            return dt;
        }

        public DataTable ActualizarMsg(Modelo.EntidadMsg Usuario)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@Id", Usuario._Id));
            parameters.Add(acceso.CrearParametro("@Msg", Usuario._Msg));
            parameters.Add(acceso.CrearParametro("@Tipo", Usuario.Tipo));
            DataTable dt = acceso.Leer("sp_ActualizarMsg", parameters);
            return dt;
        }

    }
}
