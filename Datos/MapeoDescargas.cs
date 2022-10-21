using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace Datos
{
    public class MapeoDescargas
    {
        private string Nombre;

        public string _Nombre
        {
            get { return Nombre; }
            set { Nombre = value; }
        }
        private string Documento;

        public string _Documento
        {
            get { return Documento; }
            set { Documento = value; }
        }

        private string Acta;

        public string _Acta
        {
            get { return Acta; }
            set { Acta = value; }
        }

        private DateTime Fecha;

        public DateTime _Fecha
        {
            get { return Fecha; }
            set { Fecha = value; }
        }


        private Conexion acceso = new Conexion();
        public void GuardarDocumento(MapeoDescargas Usuario)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@Nombre", Usuario._Nombre));
            parameters.Add(acceso.CrearParametro("@Documento", Usuario._Documento));
            parameters.Add(acceso.CrearParametro("@Fecha", Usuario._Fecha));
            acceso.Leer("sp_GuardarDocumento", parameters);
        }

        public DataTable MostrarDocAdm()
        {
            DataTable dt = acceso.Leer("sp_MostrarDocAdm", null);
            return dt;
        }

        public void GuardarActa(MapeoDescargas Usuario)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@Nombres", Usuario._Nombre));
            parameters.Add(acceso.CrearParametro("@Acta", Usuario._Acta));
            parameters.Add(acceso.CrearParametro("@Fecha", Usuario._Fecha));
            acceso.Leer("sp_GuardarActa", parameters);
        }

        public DataTable MostrarActa()
        {
            DataTable dt = acceso.Leer("sp_MostrarActa", null);
            return dt;
        }
    }
}
