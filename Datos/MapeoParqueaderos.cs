using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace Datos
{
    public class MapeoParqueaderos
    {
        private Conexion acceso = new Conexion();
        Modelo.EntidadesParqueadero usuario = new Modelo.EntidadesParqueadero();

        public DataTable MostrarTableroParq()
        {
            DataTable dt = acceso.Leer("sp_MostrarTableroParq", null);
            return dt;
        }

        public DataTable MostrarTableroParqCodigo(Modelo.EntidadesParqueadero usuario)
        {
            List<SqlParameter> parameter = new List<SqlParameter>();
            parameter.Add(acceso.CrearParametro("@Codigo", usuario.Codigo));
            DataTable dt = acceso.Leer("sp_MostrarTableroParqCodigo", parameter);
            return dt;
        }
    }
}
