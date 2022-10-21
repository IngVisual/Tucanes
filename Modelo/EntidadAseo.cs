using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Modelo
{
    public  class EntidadAseo
    {
        private int Id;
                    
        public int _Id
        {
            get { return Id; }
            set { Id = value; }
        }

        private string Nombres;

        public string _Nombres
        {
            get { return Nombres; }
            set { Nombres = value; }
        }

        private string Estado;

        public string _Estado
        {
            get { return Estado; }
            set { Estado = value; }
        }

        private DateTime FechaMtto;

        public DateTime _FechaMtto
        {
            get { return FechaMtto; }
            set { FechaMtto = value; }
        }

        private string Observacion;

        public string _Observacion
        {
            get { return Observacion; }
            set { Observacion = value; }
        }
    }
}
