using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Modelo
{
    public class EntidadVisitantes:EntidadUsuario
    {
        public string PlacaVehiculo { get; set; }
        public string Vehiculo { get; set; }
        public DateTime FechaPro { get; set; }
        public string Observacion { get; set; }
        public string Usuario { get; set; }
    }
}
