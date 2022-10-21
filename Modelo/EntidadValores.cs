using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Modelo
{
    public class EntidadValores
    {
        public int Idsp { get; set; }
        public int Id { get; set; }
        public DateTime Fecha { get; set; }
        public string Observaciones { get; set;}
        public double ValorAdm { get; set; }
        public string Tipo { get; set; }
        public string Observ { get; set; }
        public int IdDesc { get; set; }
        public string DescuentoAdm { get; set; }
        public string FechaDesc { get; set; }
        public double Porcentaje { get; set; }
        public int IdParq { get; set; }
        public string Parqueadero { get; set; }
        public double Valor { get; set; }
        public int IdChip { get; set; }
        public string Chip { get; set; }
        public double ValorChip { get; set; }
        public int IdSC { get; set; }
        public string SalCom { get; set; }
        public double ValorSC { get; set; }


    }
}
