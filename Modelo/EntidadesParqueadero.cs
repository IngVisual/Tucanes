using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Modelo
{
    public class EntidadesParqueadero:EntidadUsuario
    {
        private int Id;

        public int _Id
        {
            get { return Id; }
            set { Id = value; }
        }

        private string PlacaVehiculo1;

        public string _PlacaVehiculo1
        {
            get { return PlacaVehiculo1; }
            set { PlacaVehiculo1 = value; }
        }

        private string PlacaVehiculo2;

        public string _PlacaVehiculo2
        {
            get { return PlacaVehiculo2; }
            set { PlacaVehiculo2 = value; }
        }

        private string PlacaVehiculo3;

        public string _PlacaVehiculo3
        {
            get { return PlacaVehiculo3; }
            set { PlacaVehiculo3 = value; }
        }

        private string PlacaVehiculo4;

        public string _PlacaVehiculo4
        {
            get { return PlacaVehiculo4; }
            set { PlacaVehiculo4 = value; }
        }

        private string Obseravacion;

        public string _Obseravacion
        {
            get { return Obseravacion; }
            set { Obseravacion = value; }
        }
    }
}
