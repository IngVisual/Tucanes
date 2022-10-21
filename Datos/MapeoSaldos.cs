using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace Datos
{
    public class MapeoSaldos
    {
        private Conexion acceso = new Conexion();
        Modelo.EntidadUsuario usuario = new Modelo.EntidadUsuario();
        public DataTable MostrarSaldo(Modelo.EntidadUsuario Usuario)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@Codigo", Usuario.Codigo));
            DataTable dt = acceso.Leer("sp_MostrarSaldo", parameters);
            return dt;
        }
        public DataTable MostrarSaldo2(Modelo.EntidadSaldos Usuario)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@Codigo", Usuario._IdCodigo));
            DataTable dt = acceso.Leer("sp_MostrarSaldo", parameters);
            return dt;
        }
        public DataTable MostrarObserSaldo()
        {
            DataTable dt = acceso.Leer("sp_MostrarObservacionSaldo", null);
            return dt;
        }
        public DataTable MostrarValorAdm()
        {
            DataTable dt = acceso.Leer("sp_MostrarValorAdm", null);
            return dt;
        }

        public DataTable MostrarValorAdmInd()
        {
            DataTable dt = acceso.Leer("sp_MostrarValorAdmInd", null);
            return dt;
        }

        public DataTable MostrarValorAdmDesc()
        {
            DataTable dt = acceso.Leer("sp_MostrarValorAdmDesc", null);
            return dt;
        }

        public DataTable ActualizarSaldo(Modelo.EntidadSaldos Usuario)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@Codigo", Usuario._IdCodigo));
            parameters.Add(acceso.CrearParametro("@Admi", Usuario._Admi));
            parameters.Add(acceso.CrearParametro("@Favor", Usuario._Favor));
            parameters.Add(acceso.CrearParametro("@Inter", Usuario._Inter));
            parameters.Add(acceso.CrearParametro("@Sancion", Usuario._Sancion));
            parameters.Add(acceso.CrearParametro("@Moto", Usuario._Moto));
            parameters.Add(acceso.CrearParametro("@Carro", Usuario._Carro));
            parameters.Add(acceso.CrearParametro("@Total", Usuario._Total));
            parameters.Add(acceso.CrearParametro("@Juridico", Usuario._Juridico));
            DataTable dt = acceso.Leer("sp_ActualizarSaldo", parameters);
            return dt;
        }
        public DataTable GuardarFechaMsg(Modelo.EntidadSaldos Usuario)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@Fecha", Usuario._Fecha));
            parameters.Add(acceso.CrearParametro("@Msg", Usuario._Mensaje));
            parameters.Add(acceso.CrearParametro("@Id", Usuario._Id));
            DataTable dt = acceso.Leer("sp_GuardarFechaMsg", parameters);
            return dt;
        }
    }
}
