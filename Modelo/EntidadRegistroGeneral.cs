using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Modelo
{
    public class EntidadRegistroGeneral: EntidadUsuario
    {
        public string Observaciones { get; set; }
        public int IdCart { get; set; }
    }
}
