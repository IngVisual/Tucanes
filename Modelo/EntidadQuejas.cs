using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Modelo
{
    public class EntidadQuejas:EntidadUsuario
    {
        private int IdQueja;

        public int _IdQueja
        {
            get { return IdQueja; }
            set { IdQueja = value; }
        }

        private int IdPQR;

        public int _IdPQR
        {
            get { return IdPQR; }
            set { IdPQR = value; }
        }

    }
}
