using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace Datos
{
    public class MapeoOtrosPagos
    {
        Modelo.EntidadValores valor = new Modelo.EntidadValores();
        private Conexion acceso = new Conexion();
        public DataTable MostrarvalorSC()
        {
            DataTable dt = acceso.Leer("sp_MostrarValorSC", null);
            return dt;
        }
        public DataTable MostrarvalorParq()
        {
            DataTable dt = acceso.Leer("sp_MostrarValorParqueadero", null);
            return dt;
        }
        public DataTable MostrarvalorChip()
        {
            DataTable dt = acceso.Leer("sp_MostrarValorChip", null);
            return dt;
        }
        public DataTable RegistrarValores(Modelo.EntidadValores Usuario)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@Tipo", Usuario.Tipo));
            parameters.Add(acceso.CrearParametro("@Valor", Usuario.ValorAdm));
            parameters.Add(acceso.CrearParametro("@Observ", Usuario.Observ));
            DataTable dt = acceso.Leer("sp_RegistrarValorAdm", parameters);
            return dt;
        }
        public DataTable RegistrarDescuento(Modelo.EntidadValores Usuario)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@IdAdm", Usuario.Id));
            parameters.Add(acceso.CrearParametro("@Valor", Usuario.ValorAdm));
            parameters.Add(acceso.CrearParametro("@Observ", Usuario.DescuentoAdm));
            DataTable dt = acceso.Leer("sp_RegistrarDescuentoAdm", parameters);
            return dt;
        }
        public DataTable ActualizarValor(Modelo.EntidadValores Usuario)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@Id", Usuario.Idsp));
            parameters.Add(acceso.CrearParametro("@IdAdm", Usuario.Id));
            parameters.Add(acceso.CrearParametro("@Tipo", Usuario.Tipo));
            parameters.Add(acceso.CrearParametro("@Valor", Usuario.ValorAdm));
            parameters.Add(acceso.CrearParametro("@Observ", Usuario.Observ));
            DataTable dt = acceso.Leer("sp_ActualizarValor", parameters);
            return dt;
        }
    }
}
