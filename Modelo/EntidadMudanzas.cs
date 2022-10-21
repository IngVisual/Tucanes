using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Modelo
{
    
    public class EntidadMudanzas:EntidadUsuario
    {
        public int Id { get; set; }
        public string Observacion { get; set; } 
        public string Respuesta { get; set; }
        public DateTime FechaSol { get; set; }
        public string FechaRes { get; set; }
        public string ObservacionAdm { get; set; }
        public DateTime FechaIniMud { get; set; }
        public DateTime FechaFinMud { get; set; }
        public string Autorizado { get; set; }
        public string Cedula { get; set; }
        public int IdTipoMud { get; set; }
        public string Encargado { get; set; }
        public int IdCorreo { get; set; }
    }

}
