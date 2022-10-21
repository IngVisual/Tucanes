using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Modelo
{
    public class EntidadChip: EntidadUsuario
    {
        private int Id;
        public int _Id
        {
            get { return Id; }
            set { Id = value; }
        }

        private string Respuesta;
        public string _Respuesta
        {
            get { return Respuesta; }
            set { Respuesta = value; }
        }

        private string FechaRes;
        public string _FechaRes
        {
            get { return FechaRes; }
            set { FechaRes = value; }
        }

        private string Tipo;
        public string _Tipo
        {
            get { return Tipo; }
            set { Tipo = value; }
        }

        private string Destinado;
        public string _Destinado
        {
            get { return Destinado; }
            set { Destinado = value; }
        }

        private string Nombre;
        public string _Nombre
        {
            get { return Nombre; }
            set { Nombre = value; }
        }

        private string Perdida;
        public string _Perdida
        {
            get { return Perdida; }
            set { Perdida = value; }
        }
        private string Nuevo;
        public string _Nuevo
        {
            get { return Nuevo; }
            set { Nuevo = value; }
        }
        private string Documento;
        public string _Documento
        {
            get { return Documento; }
            set { Documento = value; }
        }

        private int IdRec;
        public int _IdRec
        {
            get { return IdRec; }
            set { IdRec = value; }
        }

        private int IdCorreo;
        public int _IdCorreo
        {
            get { return IdCorreo; }
            set { IdCorreo = value; }
        }

    }
}
