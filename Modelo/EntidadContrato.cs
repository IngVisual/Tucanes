using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Modelo
{
    public class EntidadContrato
    {
        public int IdContrato { get; set; }
        private string ConDatos;

        public string _ConDatos
        {
            get { return ConDatos; }
            set { ConDatos = value; }
        }
        private string Tipo;

        public string _Tipo
        {
            get { return Tipo; }
            set { Tipo = value; }
        }

        private string ConMud;

        public string _ConMud
        {
            get { return ConMud; }
            set { ConMud = value; }
        }

        private string Consc;

        public string _Consc
        {
            get { return Consc; }
            set { Consc = value; }
        }

        private string Conparq;

        public string _Conparq
        {
            get { return Conparq; }
            set { Conparq = value; }
        }
        private string ConGen;

        public string _ConGen
        {
            get { return ConGen; }
            set { ConGen = value; }
        }

    }
}
