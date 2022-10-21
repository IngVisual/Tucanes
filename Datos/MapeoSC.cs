using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;


namespace Datos
{  
    public class MapeoSC
    {
        private Conexion acceso = new Conexion();

        //Llamar Valores al filtrar un salon comunal
        public DataTable BuscarValorSC(Modelo.EntidadSC sc)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@IdSC",sc._IdSC));
            DataTable dt = acceso.Leer("sp_MostrarValSC",parameters);
            return dt;
        }

        //buscar disponibilidad de horarios del salon comunal
        public int BuscarDisponibilidad(Modelo.EntidadSC sc)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@IdSC", sc._IdSC));
            parameters.Add(acceso.CrearParametro("@Fecha", sc._Fecha));
            int valor = acceso.Escribir("sp_BuscarDispoSC", parameters);
            return valor;
        }

        //Llamar mensaje de pago salon comunal
        public DataTable BuscarMSMPago(Modelo.EntidadSC sc)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@Idpago", sc._Idpago));
            DataTable dt = acceso.Leer("sp_MostrarMSMPago", parameters);
            return dt;
        }

        //Llamar tabla de salon comunal
        public DataTable MostrarSC(Modelo.EntidadSC sc)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@Fecha", sc._Fechahoy));
            DataTable dt = acceso.Leer("sp_MostraSC", parameters);
            return dt;
        }

        //Guardar Reserva
        public int GuardarReservaSC(Modelo.EntidadSC sc)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@Codigo", sc.Codigo));
            parameters.Add(acceso.CrearParametro("@IdSC", sc._IdSC));
            parameters.Add(acceso.CrearParametro("@Fecha", sc._Fecha));
            parameters.Add(acceso.CrearParametro("@FechaSol", sc._Fechahoy));
            parameters.Add(acceso.CrearParametro("@FechaPago", sc._Fechapago));
            parameters.Add(acceso.CrearParametro("@Estado", sc.Estado));
            int reserva = acceso.Escribir("sp_GuardarReservaSC", parameters);
            return reserva;
        }

        //Llamar tabla de salon comunal por apartamento
        public int MostrarSCApart(Modelo.EntidadSC sc)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@Codigo", sc.Codigo));
            parameters.Add(acceso.CrearParametro("@Estado", sc.Estado));
            int reserva = acceso.Escribir("sp_MostraSCApart", parameters);
            return reserva;
        }

        //Llamar tablas de salon comunal por apartamento
        public DataTable MostrarSCApartTabla(Modelo.EntidadSC sc)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@Codigo", sc.Codigo));
            parameters.Add(acceso.CrearParametro("@Estado", sc.Estado));
            DataTable dt = acceso.Leer("sp_MostraSCApartTabla", parameters);
            return dt;
        }
        //Llamar tablas de salon comunal por apartamento
        public DataTable MostrarApaSC(Modelo.EntidadSC sc)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@Codigo", sc.Codigo));
            DataTable dt = acceso.Leer("sp_MostrarApaSC", parameters);
            return dt;
        }

        //Llamar un solo salon comunal por codigo
        public DataTable MostrarUnSCCodigo(Modelo.EntidadSC sc)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@Codigo", sc.Codigo));
            DataTable dt = acceso.Leer("sp_MostrarUnSCCodigo", parameters);
            return dt;
        }
        //Llamar un solo salon comunal por codigo
        public DataTable MostrarUnSCID(Modelo.EntidadSC sc)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@Id", sc._Id));
            DataTable dt = acceso.Leer("sp_MostrarUnSCID", parameters);
            return dt;
        }

        //Eliminar tablas de salon comunal por apartamento
        public int EliminarSalCom(Modelo.EntidadSC sc)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@Id", sc._Id));
            int reserva = acceso.Escribir("EliminarSC", parameters);
            return reserva;
        }

        //Eliminar fechas reservadas pasadas
        public void EliminarSCFechaRes(Modelo.EntidadSC sc)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@Fechahoy", sc._Fechahoy));
            acceso.Leer("EliminarSCReserva", parameters);
        }

        //subir imagen de recibo y solictud de SC
        public void GuardarSolicitudSC(Modelo.EntidadSC sc, Modelo.EntidadImagenes imagen)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@Observacion", sc._Observacion));
            parameters.Add(acceso.CrearParametro("@Respuesta", sc._Respuesta));
            parameters.Add(acceso.CrearParametro("@Estado", sc.Estado));
            parameters.Add(acceso.CrearParametro("@Nombre", sc._Nombre));
            parameters.Add(acceso.CrearParametro("@Cedula", sc._Cedula));
            parameters.Add(acceso.CrearParametro("@Tipo", sc._Tipo));
            parameters.Add(acceso.CrearParametro("@Ruta", imagen.Recibo));
            parameters.Add(acceso.CrearParametro("@IdSC", imagen.IdSC));
            acceso.GuardarDatos("spcargar_SolicitudSC", parameters);
        }

        //Llamar un solo apartamento apartamento
        public DataTable MostrarUnSC(Modelo.EntidadSC sc)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@Codigo", sc.Codigo));
            parameters.Add(acceso.CrearParametro("@Id", sc._Id));
            DataTable dt = acceso.Leer("sp_MostrarUNApaSC", parameters);
            return dt;
        }

        //Llamar un solo apartamento apartamento
        public DataTable MostrarSCEstado(Modelo.EntidadSC sc)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@Estado", sc.Estado));
            DataTable dt = acceso.Leer("sp_MostrarEstadoSC", parameters);
            return dt;
        }
        //Lactualizar vigilante estado y obsradm
        public DataTable ActualizarMudanzaSC(Modelo.EntidadSC sc)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@Id", sc._Id));
            parameters.Add(acceso.CrearParametro("@Estado", sc.Estado));
            parameters.Add(acceso.CrearParametro("@ObservacionAdm", sc._ObservacionAdm));
            DataTable dt = acceso.Leer("sp_ActualizarMudanzaSC", parameters);
            return dt;
        }
        //Lactualizar vigilante estado y obsradm
        public DataTable ActualizarSC(Modelo.EntidadSC sc)
        {
            List<SqlParameter> parameter = new List<SqlParameter>();
            parameter.Add(acceso.CrearParametro("@Id", sc._Id));
            parameter.Add(acceso.CrearParametro("@Respuesta", sc._Respuesta));
            parameter.Add(acceso.CrearParametro("@FechaRes", sc._FechaRes));
            parameter.Add(acceso.CrearParametro("@Estado", sc.Estado));
            parameter.Add(acceso.CrearParametro("@ObservacionAdm", sc._ObservacionAdm));
            parameter.Add(acceso.CrearParametro("@Cedula", sc._Cedula));
            parameter.Add(acceso.CrearParametro("@Nombre", sc._Nombre));
            parameter.Add(acceso.CrearParametro("@IdCorreo", sc._IdCorreo));
            DataTable dt = acceso.Leer("ActualizarSC", parameter);
            return dt;
        }
        //mostrar tabla completa
        public DataTable MostrarSCTabla()
        {
            DataTable dt = acceso.Leer("sp_MostrarSCTabla", null);
            return dt;
        }
    }
}
