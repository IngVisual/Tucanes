using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Modelo
{
    public class EntidadSC:EntidadUsuario
    {                    
        private int Id;

        public int _Id
        {
            get { return Id; }
            set { Id = value; }
        }

        private string FechaRes;

        public string _FechaRes
        {
            get { return FechaRes; }
            set { FechaRes = value; }
        }

        private string Respuesta;

        public string _Respuesta
        {
            get { return Respuesta; }
            set { Respuesta = value; }
        }

        private DateTime Fecha;
        
        public DateTime _Fecha
        {
            get { return Fecha; }
            set { Fecha = value; }
        }

        private DateTime Fechahoy;

        public DateTime _Fechahoy
        {
            get { return Fechahoy; }
            set { Fechahoy = value; }
        }
        private DateTime Fechapago;

        public DateTime _Fechapago
        {
            get { return Fechapago; }
            set { Fechapago = value; }
        }

        private string Observacion;

        public string _Observacion
        {
            get { return Observacion; }
            set { Observacion = value; }
        }

        private string nombre;

        public string _Nombre
        {
            get { return nombre; }
            set { nombre = value; }
        }

        private string cedula;

        public string _Cedula
        {
            get { return cedula; }
            set { cedula = value; }
        }

        private string tipo;

        public string _Tipo
        {
            get { return tipo; }
            set { tipo = value; }
        }


        private  int  IdSC;

        public  int _IdSC
        {
            get { return IdSC; }
            set { IdSC = value; }
        }

        private int IdCorreo;

        public int _IdCorreo
        {
            get { return IdCorreo; }
            set { IdCorreo = value; }
        }

        //TABLA ANIDADA VALORES SC
        private double ValorSC;

        public double _ValorSC
        {
            get { return ValorSC; }
            set { ValorSC = value; }
        }

        private string SalCom;

        public string _SalCom
        {
            get { return SalCom; }
            set { SalCom = value; }
        }

        // TABLA ANIDAD MSMPAGO
        private string MsgPago;

        public string _MsgPago
        {
            get { return MsgPago; }
            set { MsgPago = value; }
        }

        private int Idpago;

        public int _Idpago
        {
            get { return Idpago; }
            set { Idpago = value; }
        }

        private string ObservacionAdm;

        public string _ObservacionAdm
        {
            get { return ObservacionAdm; }
            set { ObservacionAdm = value; }
        }

    }
}
