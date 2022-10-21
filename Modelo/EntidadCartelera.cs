using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Modelo
{
    public class EntidadCartelera:EntidadUsuario
    {
        public int IdCartelera { get; set; }
        public string Nombre { get; set; }
        public string Observaciones { get; set; }
        public int Id { get; set; }
        public string Descripcion { get; set; }
        public string Precio { get; set; }
    }
}
    