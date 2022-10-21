using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Modelo
{
    public class EntidadesNovedadSaldo:EntidadUsuario
    {
        public string Obseraciones { get; set; }
        public string Respuesta { get; set; }
        public string FechaRes { get; set; }
        public int IdNov { get; set; }
        public int IdCorreo { get; set; }
        public string Tipo2 { get; set; }
    }
}
