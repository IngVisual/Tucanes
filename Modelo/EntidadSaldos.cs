using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Modelo
{
    public class EntidadSaldos
    {
        private int IdCodigo;

        public int _IdCodigo
        {
            get { return IdCodigo; }
            set { IdCodigo = value; }
        }
        private int Id;

        public int _Id
        {
            get { return Id; }
            set { Id = value; }
        }

        private string Admi;

        public string _Admi
        {
            get { return Admi; }
            set { Admi = value; }
        }
        private string Favor;

        public string _Favor
        {
            get { return Favor; }
            set { Favor = value; }
        }
        private string Inter;

        public string _Inter
        {
            get { return Inter; }
            set { Inter = value; }
        }
        private string Sancion;

        public string _Sancion
        {
            get { return Sancion; }
            set { Sancion = value; }
        }
        private string Moto;

        public string _Moto
        {
            get { return Moto; }
            set { Moto = value; }
        }
        private string Carro;

        public string _Carro
        {
            get { return Carro; }
            set { Carro = value; }
        }
        private string Total;

        public string _Total
        {
            get { return Total; }
            set { Total = value; }
        }
        private string Juridico;

        public string _Juridico
        {
            get { return Juridico; }
            set { Juridico = value; }
        }
        private DateTime Fecha;

        public DateTime _Fecha
        {
            get { return Fecha; }
            set { Fecha = value; }
        }
        private string Mensaje;

        public string _Mensaje
        {
            get { return Mensaje; }
            set { Mensaje = value; }
        }
    }
}
