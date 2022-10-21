using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace Datos
{
    public class MapeoMaterPropietario
    {
        private Conexion acceso = new Conexion();
        Modelo.EntidadUsuario usuario = new Modelo.EntidadUsuario();
        
        public DataTable LeerQuejas(Modelo.EntidadUsuario Usuario)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@Codigo", Usuario.Codigo));
            DataTable dt = acceso.Leer("sp_MostrarUsuario", parameters);
            return dt;
        }
        public DataTable LeerMensajes(Modelo.EntidadUsuario Usuario)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@Codigo", Usuario.Codigo));
            DataTable dt = acceso.Leer("sp_MostrarUsuario", parameters);
            return dt;
        }
    }
}
