using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace Datos
{
    public class MapeoQuejas
    {
        private Conexion acceso = new Conexion();
        public Modelo.EntidadChip parq = new Modelo.EntidadChip();

        public DataTable MostrarQuejaCodigo(Modelo.EntidadQuejas Usuario)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@Codigo", Usuario.Codigo));
            parameters.Add(acceso.CrearParametro("@Estado", Usuario.Estado));
            DataTable dt = acceso.Leer("sp_MostrarQuejaCodigo", parameters);
            return dt;
        }

    }
}
