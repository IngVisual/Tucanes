using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace LogicaNeg
{
    public class CSaldos
    {
        public string BuscarSaldo(int codigo)
        {
            var total = "";
            Datos.MapeoSaldos mapeo = new Datos.MapeoSaldos();
            Modelo.EntidadSaldos saldo = new Modelo.EntidadSaldos();
            saldo._IdCodigo = codigo;
            DataTable dt = mapeo.MostrarSaldo2(saldo);
            foreach (DataRow item in dt.Rows)
            {
                total = item["Total"].ToString();
            }
            return total;
        }
    }
}
