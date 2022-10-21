using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Modelo
{
     public class EntidadNotificaciones:EntidadUsuario
    {
        private int Id;

        public int _Id
        {
            get { return Id; }
            set { Id = value; }
        }

        private string EnvioNotif;

        public string _EnvioNotif
        {
            get { return EnvioNotif; }
            set { EnvioNotif = value; }
        }

        private string RecibeNotif;

        public string _RecibeNotif
        {
            get { return RecibeNotif; }
            set { RecibeNotif = value; }
        }

        private string Msg;

        public string _Msg
        {
            get { return Msg; }
            set { Msg = value; }
        }

        private string Lugar;

        public string _Lugar
        {
            get { return Lugar; }
            set { Lugar = value; }
        }




    }
}
