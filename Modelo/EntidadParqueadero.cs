using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Modelo
{
    public class EntidadParqueadero:EntidadUsuario
    {
        public string Respuesta { get; set; }
        public string Destino { get; set; }
        public string PlacaMoto { get; set; }
        public string PlacaCarro { get; set; }
        public string PLacaCarroMoto { get; set; }
        public string Color { get; set; }
        public string TP { get; set; }
        public string FechaRespuesta { get; set; }
        public int Id { get; set; }
        public int IdCorreo { get; set; }
    }
}
