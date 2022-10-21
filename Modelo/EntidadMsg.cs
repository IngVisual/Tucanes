using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Modelo
{
    public class EntidadMsg
    {
        public string Tipo { get; set; }

        private int Id;

        public int _Id
        {
            get { return Id; }
            set { Id = value; }
        }

        private string Msg;

        public string _Msg
        {
            get { return Msg; }
            set { Msg = value; }
        }

        private string MsgParqueadero;

        public string _MsgParqueadero
        {
            get { return MsgParqueadero; }
            set { MsgParqueadero = value; }
        }

        private string MsgSC;

        public string _MsgSC
        {
            get { return MsgSC; }
            set { MsgSC = value; }
        }

        private string MsgChip;

        public string _MsgChip
        {
            get { return MsgChip; }
            set { MsgChip = value; }
        }

        private string MagMud;

        public string _MagMud
        {
            get { return MagMud; }
            set { MagMud = value; }
        }
    }
}
