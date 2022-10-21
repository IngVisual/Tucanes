using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Modelo
{
    public class EntidadBicicleta:EntidadUsuario
    {
        public string Marca { get; set; }
        public string Color { get; set; }
        public string Tipo { get; set; }
        public string Persona { get; set; }

    }
}
