using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace LogicaNeg
{
    public class CSolictudSC
    {
        Modelo.EntidadSC SC = new Modelo.EntidadSC();
        Modelo.EntidadImagenes ima = new Modelo.EntidadImagenes();
        Datos.MapeoSC mapeoSC = new Datos.MapeoSC();
        Modelo.EntidadContrato contrato = new Modelo.EntidadContrato();
        Datos.MapeoContrato mapeocont = new Datos.MapeoContrato();

        public List<Modelo.EntidadSC> LLamarPrecios(int id)
        {
            SC._IdSC = id;
            DataTable dt= mapeoSC.BuscarValorSC(SC);
            List<Modelo.EntidadSC> list = new List<Modelo.EntidadSC>();
            foreach (DataRow item in dt.Rows)
            {             
               double valor = double.Parse(item["ValorSC"].ToString());
               string salcom = item["SalCom"].ToString();
               list.Add(new Modelo.EntidadSC { _ValorSC = valor, _SalCom = salcom });
            }
            return list;
        }

        public int BuscarDisponiSC(DateTime fecha, int id)
        {
            SC._Fecha = fecha;
            SC._IdSC = id;
            int valor = mapeoSC.BuscarDisponibilidad(SC);
            return valor;
        }

         public DataTable MostrarTablaSC(DateTime fecha)
         {
            SC._Fechahoy = fecha;
            DataTable dt = mapeoSC.MostrarSC(SC);
            return dt;
         }

        string mensaje;
        public string MostrarMsgPago()
        {            
            int Idpago =1;
            SC._Idpago = Idpago;
            DataTable dt= mapeoSC.BuscarMSMPago(SC);
            foreach (DataRow item in dt.Rows)
            {
                 mensaje = item["MsgPago"].ToString();
            }
            return mensaje;
        }

        int valorReturn;
        public int GuardarReservaSC(bool reserva,int idsc,DateTime fecha, DateTime fechahoy, DateTime fechaPago, int codigo)
        {
            if(reserva==true)
            {
                SC.Codigo = codigo;
                SC.Estado = "Reservado";
                SC._IdSC = idsc;
                SC._Fecha = fecha;
                SC._Fechahoy = fechahoy;
                SC._Fechapago = fechaPago;
                valorReturn = mapeoSC.GuardarReservaSC(SC);
            }
            return valorReturn;
        }

        public int MostrarSCApartamento(int codigo, string reserva)
        {
            SC.Codigo = codigo;
            SC.Estado = reserva;
            int retornaValorApa = mapeoSC.MostrarSCApart(SC);
            return retornaValorApa;
        }
        public DataTable MostrarSCApartamentoTabla(int codigo, string reserva)
        {
            SC.Codigo = codigo;
            SC.Estado = reserva;
            DataTable dt=  mapeoSC.MostrarSCApartTabla(SC);
            return dt;
        }

        public int EliminarSC(int id)
        {
            SC._Id = id;
            int valor= mapeoSC.EliminarSalCom(SC);
            return valor;
        }

        public void EliminarReservaTablaSC(DateTime fechahoy)
        {
            SC._Fechahoy = fechahoy;
            mapeoSC.EliminarSCFechaRes(SC);
        }

        public void RegistrarSolSC(string estado, string res, int id, string ruta, string obser, string tipo, string nombre, string cedula)
        {
            ima.IdSC = id;
            SC.Estado = estado;
            SC._Respuesta = res;
            SC._Observacion = obser;
            SC._Nombre = nombre;
            SC._Cedula = cedula;
            SC._Tipo = tipo;
            ima.Recibo = ruta;
            mapeoSC.GuardarSolicitudSC(SC,ima);
        }
        public DataTable MostrarContrato(int contr)
        {
            contrato.IdContrato = contr;
            DataTable dt= mapeocont.MostrarContrato(contrato);
            return dt;
        }
    }
}
