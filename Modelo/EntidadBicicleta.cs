using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Modelo
{
    public class EntidadBicicleta : EntidadUsuario
    {
        public int Id { get; set; }
        public string Marca { get; set; }
        public string Color { get; set; }
        public string Tipo { get; set; }
        public string Persona { get; set; }
        public string TipoSolicitante { get; set; }
        public string Serie { get; set; }
        public string Nombre { get; set; }
        public string FechaRespuesta { get; set; }
        public string Respuesta { get; set; }
        public string ObservacionAdm { get; set; }
        public int IdCorreo { get; set; }

    }
}
