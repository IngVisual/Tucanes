using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Modelo
{
    public class EntidadMascota : EntidadUsuario
    {
        public int Id { get; set; }
        public string Especie { get; set; }
        public string Nombre { get; set; }
        public string TipoEncargado { get; set; }
        public string NombreEncargado { get; set; }
        public string NumeroCarnet { get; set; }
        public string Sexo { get; set; }
        public string Raza { get; set; }
        public int IdCorreo { get; set; }
        public string Respuesta { get; set; }
        public string FechaRespuesta { get; set; }
        public string Color { get; set; }
        public string RazaEspecial { get; set; }
        public string Esterilizado { get; set; }
        public string Discapacidad { get; set; }
        public string Edad { get; set; }
        public string Telefono { get; set; }
        public string Correo { get; set; }

    }
}
