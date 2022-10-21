using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Modelo
{
    public class EntidadDescargas
    {
        private int FileID;

        public int _FileID
        {
            get { return FileID; }
            set { FileID = value; }
        }

        private string Documento;

        public string _Documento
        {
            get { return Documento; }
            set { Documento = value; }
        }

        private string Nombre;

        public string _Nombre
        {
            get { return Nombre; }
            set { Nombre = value; }
        }



    }
}
