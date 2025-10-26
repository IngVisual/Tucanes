using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using Modelo.AlquilerParqueadero;

namespace Datos
{
    public class MapeoAlquilerParqueadero
    {
        private Conexion acceso = new Conexion();
        Alquiler parTipoAlquiler = new Alquiler();

        public DataTable TablaTipoAlquiler(TipoAlquiler modparametro)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@TipoConsulta", modparametro.tipConsulta));
            var dt = acceso.Leer("sp_ParqueaderoAlquiler", parameters);
            return dt;
        }

        public void GuardarAlquilerParqueadero(Alquiler modparametro)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@TipoConsulta", modparametro.tipoConsulta));
            parameters.Add(acceso.CrearParametro("@Codigo", modparametro.Codigo));
            parameters.Add(acceso.CrearParametro("@IDtipoAlq", modparametro.IDtipoAlq));
            parameters.Add(acceso.CrearParametro("@FechaIni", modparametro.FechaIni));
            parameters.Add(acceso.CrearParametro("@Placa", modparametro.Placa));
            parameters.Add(acceso.CrearParametro("@Marca", modparametro.Marca));
            parameters.Add(acceso.CrearParametro("@Nombre", modparametro.Nombre));
            parameters.Add(acceso.CrearParametro("@Dias", modparametro.Dias));
            parameters.Add(acceso.CrearParametro("@Horas", modparametro.Horas));
            parameters.Add(acceso.CrearParametro("@Estado", modparametro.Estado));
            parameters.Add(acceso.CrearParametro("@NumParqueadero", modparametro.NumParqueadero));
            acceso.GuardarDatos("sp_ParqueaderoAlquiler1", parameters);
        }

        public DataTable TablaAlquiler(Alquiler modparametro)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@TipoConsulta", modparametro.tipoConsulta));
            var dt = acceso.Leer("sp_ParqueaderoAlquiler", parameters);
            return dt;
        }

        public DataTable TablaAlquilerCodigo(Alquiler modparametro)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@IDalquiler", modparametro.Codigo));
            parameters.Add(acceso.CrearParametro("@TipoConsulta", modparametro.tipoConsulta));
            var dt = acceso.Leer("sp_ParqueaderoAlquiler2", parameters);
            return dt;
        }

        public DataTable TablaAlquilerId(Alquiler modparametro)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@IDalquiler", modparametro.IDalquiler));
            parameters.Add(acceso.CrearParametro("@TipoConsulta", modparametro.tipoConsulta));
            var dt = acceso.Leer("sp_ParqueaderoAlquiler2", parameters);
            return dt;
        }

        public void GuardarPagoAlquiler(TipoAlquiler modparametro)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@IDalquiler", modparametro.IDalquiler));
            parameters.Add(acceso.CrearParametro("@Total", modparametro.Total));
            parameters.Add(acceso.CrearParametro("@FechaFin", modparametro.FechaFin));
            parameters.Add(acceso.CrearParametro("@Horas", modparametro.Horas));
            parameters.Add(acceso.CrearParametro("@Estado", modparametro.Estado));
            parameters.Add(acceso.CrearParametro("@Observaciones", modparametro.Observaciones));
            acceso.GuardarDatos("sp_ParqueaderoGuardarPago", parameters);
        }

        public DataTable FiltrosPagosTotal(Alquiler modparametro)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@FechaIni", modparametro.FechaIni));
            parameters.Add(acceso.CrearParametro("@FechaFin", modparametro.FechaFin));
            var dt = acceso.Leer("sp_ParqueaderoFiltroPagoTotal", parameters);
            return dt;
        }
        public DataTable FiltrosPagosFacturado(Alquiler modparametro)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@FechaIni", modparametro.FechaIni));
            parameters.Add(acceso.CrearParametro("@FechaFin", modparametro.FechaFin));
            var dt = acceso.Leer("sp_ParqueaderoFiltroPagoFacturado", parameters);
            return dt;
        }
        public DataTable FiltrosPagosNovedad(Alquiler modparametro)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@FechaIni", modparametro.FechaIni));
            parameters.Add(acceso.CrearParametro("@FechaFin", modparametro.FechaFin));
            var dt = acceso.Leer("sp_ParqueaderoFiltroPagoNovedad", parameters);
            return dt;
        }
        public DataTable FiltrosPagosCancelado(Alquiler modparametro)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@FechaIni", modparametro.FechaIni));
            parameters.Add(acceso.CrearParametro("@FechaFin", modparametro.FechaFin));
            var dt = acceso.Leer("sp_ParqueaderoFiltroPagoCancelado", parameters);
            return dt;
        }

        public DataTable FiltrosPagos(Alquiler modparametro)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@FechaIni", modparametro.FechaIni));
            parameters.Add(acceso.CrearParametro("@FechaFin", modparametro.FechaFin));
            var dt = acceso.Leer("sp_ParqueaderoFiltro", parameters);
            return dt;
        }

        public void RegistroAlquilerParq(TipoAlquiler modparametro)
        {
            List<SqlParameter> parameter = new List<SqlParameter>();
            parameter.Add(acceso.CrearParametro("@IDTiParq", modparametro.IDTiParq));
            parameter.Add(acceso.CrearParametro("@IDtipoVeh", modparametro.IDtipoVeh));
            parameter.Add(acceso.CrearParametro("@IDtar", modparametro.IDtar));
            parameter.Add(acceso.CrearParametro("@IDTiptar", modparametro.IDTiptar));
            parameter.Add(acceso.CrearParametro("@IDtipodia", modparametro.IDtipodia));
            parameter.Add(acceso.CrearParametro("@IDfree", modparametro.IDfree));
            parameter.Add(acceso.CrearParametro("@IDtarHorFija", modparametro.IDtarHorFija));
            parameter.Add(acceso.CrearParametro("@Activo", modparametro.Activo));
            parameter.Add(acceso.CrearParametro("@TipoAlquiler", modparametro._TipoAlquiler));
            acceso.GuardarDatos("sp_ParqueaderoAlquilerAdmin", parameter);
        }

        public void GuardarUsuario(CajaMenor cajamenor)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@Nombre", cajamenor.Nombre));
            parameters.Add(acceso.CrearParametro("@Activo", cajamenor.Activo));
            acceso.GuardarDatos("sp_ParqueaderoAlquilerUsuario", parameters);
        }

        public DataTable MostrarTransferencias()
        {
            DataTable dt = acceso.Leer("sp_MostrarTransferencias", null);
            return dt;
        }
        public DataTable MostrarUltimaTransferencias()
        {
            DataTable dt = acceso.Leer("sp_MostrarUltimaTransferencias", null);
            return dt;
        }

        public void GuardarTransferencia(Transferencias transf)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@UsuarioRemitente", transf.UsuarioRemitente));
            parameters.Add(acceso.CrearParametro("@UsuarioDestino", transf.UsuarioDestino));
            parameters.Add(acceso.CrearParametro("@Transferencia", transf.Transferencia));
            parameters.Add(acceso.CrearParametro("@CajaMenorGuarda", transf.CajaMenorGuarda));
            parameters.Add(acceso.CrearParametro("@CajaMenorAdmin", transf.CajaMenorAdmin));
            parameters.Add(acceso.CrearParametro("@ExcedenteAdmin", transf.ExcedenteAdmin));
            parameters.Add(acceso.CrearParametro("@ExcedenteGuarda", transf.ExcedenteGuarda));
            parameters.Add(acceso.CrearParametro("@FechaTransferencia", transf.FechaTransferencia));
            acceso.GuardarDatos("sp_GuardarTransferencia", parameters);
        }

        public DataTable ValidarAlquilerDia(Alquiler modparametro)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@Placa", modparametro.Placa));
            parameters.Add(acceso.CrearParametro("@FechaIni", modparametro.FechaIni));
            var dt = acceso.Leer("sp_ParqueaderoValidarAlquilerDia", parameters);
            return dt;
        }
    }
}
