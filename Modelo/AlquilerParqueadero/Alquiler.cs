using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Modelo.AlquilerParqueadero
{
    public class Alquiler
    {
        //TABLA ALQUILER ParqTbl_Alquiler
        public int IDalquiler { get; set; }
        public int Codigo { get; set; }
        public int IDtipoAlq { get; set; }
        public DateTime FechaIni { get; set; }
        public DateTime FechaFin { get; set; }
        public string Placa { get; set; }
        public string Marca { get; set; }
        public string Nombre { get; set; }
        public int Dias { get; set; }
        public int Horas { get; set; }
        public string Estado { get; set; }
        public int Total { get; set; }
        public int NumParqueadero { get; set; }
        public string Observaciones { get; set; }
        public int tipoConsulta { get; set; }
    }
}
