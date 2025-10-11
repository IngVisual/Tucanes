using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Modelo.AlquilerParqueadero
{
    public class CajaMenor
    {
        public int Id { get; set; }
        public string Nombre { get; set; }
        public bool Activo { get; set; }
    }

    public class Transferencias
    {
        public int Id { get; set; }
        public int UsuarioRemitente { get; set; }
        public int UsuarioDestino { get; set; }
        public int Transferencia { get; set; }
        public int CajaMenorAdmin { get; set; }
        public int CajaMenorGuarda { get; set; }
        public int ExcedenteAdmin { get; set; }
        public int ExcedenteGuarda { get; set; }
        public DateTime FechaTransferencia { get; set; }
    }
}
