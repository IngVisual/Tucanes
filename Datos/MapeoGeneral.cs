using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;

namespace Datos
{
   
    public class MapeoGeneral
    {
        private string Tipo;

        public string _Tipo
        {
            get { return Tipo; }
            set { Tipo = value; }
        }

        private DateTime FechaIni;

        public DateTime _FechaIni
        {
            get { return FechaIni; }
            set { FechaIni = value; }
        }

        private DateTime FehaFin;

        public DateTime _FechaFin
        {
            get { return FehaFin; }
            set { FehaFin = value; }
        }

        private Conexion acceso = new Conexion();

        public DataTable MostrarTableros(MapeoGeneral Usuario)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@Tipo", Usuario.Tipo));
            parameters.Add(acceso.CrearParametro("@FechaIni", Usuario._FechaIni));
            parameters.Add(acceso.CrearParametro("@FechaFin", Usuario._FechaFin));
            DataTable dt = acceso.Leer("sp_MostrarTableros", parameters);
            return dt;
        }

    }
}
