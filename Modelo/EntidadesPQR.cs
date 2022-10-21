using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Modelo
{
    public class EntidadesPQR:EntidadUsuario
    {
        public int IdPQR { get; set; }
        public string Nombre { get; set; }
        public string DescripcionPQR { get; set; }
        public DateTime FechaInicio { get; set; }
        public string Respuesta { get; set; }
        public string FechaCierre { get; set; }
        public string Asignar { get; set; }
        public string Codigo1 { get; set; }
        public string FechaRespuesta { get; set; }
        public string Tipo { get; set; }
        public string EstadoMulta { get; set; }
        public string Tipo2 { get; set; }
        public int IdCorreo { get; set; }
    }
}
