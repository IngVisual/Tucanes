using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Modelo
{
    public class EntidadUsuario
    {
        public int IdUsuario { get; set; }
        public int Codigo { get; set; }
        public string NombrePropietario { get; set; }
        public string CCPropietario { get; set; }
        public string Torre { get; set; }
        public string Apartamento { get; set; }
        public string Email { get; set; }
        public string Celular { get; set; }     
        public string OtroCelular { get; set; }
        public string CelularArr { get; set; }
        public string AceptaTerminosyCondiciones { get; set; }
        public string Estado { get; set; }
        public int Conteo { get; set; }
        public string Npersonas { get; set; }
        public string NMenores { get; set; }
        public string Nmascotas { get; set; }
        public string Razas { get; set; }
        public string NomMayores { get; set; }
        public string NomMenores { get; set; }
        public string NomProhibidoIng { get; set; }
    }
}
