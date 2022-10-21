using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;

namespace Datos
{
    public class MapeoPush
    {
        Conexion acceso = new Conexion();

        public int GuardarPush(Modelo.EntidadPush push)
        {
            List<SqlParameter> parameter = new List<SqlParameter>();

            parameter.Add(acceso.CrearParametro("@Codigo",push.Codigo));
            parameter.Add(acceso.CrearParametro("@Push", push.Push));
            return acceso.Escribir("sp_GuardarPush", parameter);
        }

        public DataTable MostrarPush(Modelo.EntidadPush Usuario)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@Codigo", Usuario.Codigo));
            DataTable dt = acceso.Leer("sp_MostrarPush", parameters);
            return dt;
        }

        public DataTable MostrarPushCodigo(Modelo.EntidadPush Usuario)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@Codigo", Usuario.Codigo));
            DataTable dt = acceso.Leer("sp_MostrarPushCodigo", parameters);
            return dt;
        }
    }
}
