using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Modelo.AlquilerParqueadero
{
    public class TipoAlquiler : Alquiler
    {
        //TABLA TIPO ALQUILER ParqTbl_TipAlquiler
        public string _TipoAlquiler { get; set; }
        //ParqTbl_TipoParqueadero
        public int IDTiParq { get; set; }
        public string _TipoParqueadero { get; set; }
        //ParqTbl_TipoVehiculo
        public int IDtipoVeh { get; set; }
        public string _TipoVehiculo { get; set; }
        //ParqTbl_Tarifa
        public int IDtar { get; set; }
        public int? _Tarifa { get; set; }
        // ParqTbl_TipoTarifa
        public int IDTiptar { get; set; }
        public string _TipoTarifa { get; set; }
        //ParqTbl_TipoDia
        public int IDtipodia { get; set; }
        public string _TipoDia { get; set; }
        //ParqTbl_FreeHora
        public int IDfree { get; set; }
        public int? _Free_hora { get; set; }
        //ParqTbl_TarifaHoraFija
        public int IDtarHorFija { get; set; }
        public int _TarifaHoraFija { get; set; }
        public bool Activo { get; set; }

        public int tipConsulta { get; set; }
        public int msg { get; set; }
    }
}
