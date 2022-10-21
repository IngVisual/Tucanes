using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;
using Modelo;

namespace Datos
{
    public class MapeoSolicitudes
    {
        private Conexion acceso = new Conexion();

        //NOVEDAD SALDO
        //NOVEDAD SALDOS guardar novedad de saldo con las rutas de imagenes de recibos
        public void GuardarNovedadSaldo(Modelo.EntidadesNovedadSaldo novedad, Modelo.EntidadImagenes imagen)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@Codigo", novedad.Codigo));
            parameters.Add(acceso.CrearParametro("@Observacion", novedad.Obseraciones));
            parameters.Add(acceso.CrearParametro("@Estado", novedad.Estado));
            parameters.Add(acceso.CrearParametro("@Respuesta", novedad.Respuesta));
            parameters.Add(acceso.CrearParametro("@FechaRes", novedad.FechaRes));
            parameters.Add(acceso.CrearParametro("@Nombre", imagen.Nombre));
            parameters.Add(acceso.CrearParametro("@IdNovSaldo", imagen.IdNovSaldo));
            acceso.GuardarDatos("spcargar_Novedad",parameters);
        }
        //solicitud paz y salvo
        public void GuardarSolPyZ(Modelo.EntidadesNovedadSaldo novedad)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@Codigo", novedad.Codigo));
            parameters.Add(acceso.CrearParametro("@Observacion", novedad.Obseraciones));
            parameters.Add(acceso.CrearParametro("@Estado", novedad.Estado));
            parameters.Add(acceso.CrearParametro("@Respuesta", novedad.Respuesta));
            parameters.Add(acceso.CrearParametro("@FechaRes", novedad.FechaRes));
            acceso.GuardarDatos("spcargar_SolPyZ", parameters);
        }
        //Mostrar Novedades de Saldo
        public DataTable MostrarNovSaldo(Modelo.EntidadesNovedadSaldo novedad)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@Codigo", novedad.Codigo));
            DataTable dt= acceso.Leer("sp_MostrarNovSal", parameters);
            return dt;
        }

        //Mostrar una Novedad de Saldo por codigo
        public DataTable MostrarUnNovSalCodigo(Modelo.EntidadesNovedadSaldo novedad)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@Codigo", novedad.Codigo));
            DataTable dt = acceso.Leer("sp_MostrarUnNovSalCodigo", parameters);
            return dt;
        }
        //Mostrar una sola Novedades de Saldo
        public DataTable MostrarNovSaldoIndividual(Modelo.EntidadesNovedadSaldo novedad)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@Codigo", novedad.Codigo));
            parameters.Add(acceso.CrearParametro("@Id", novedad.IdNov));
            DataTable dt = acceso.Leer("sp_MostrarNovSalInd", parameters);
            return dt;
        }
        //Mostrar PDF
        public DataTable MostrarNovSaldoPDF(Modelo.EntidadesNovedadSaldo novedad)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@Id", novedad.IdNov));
            DataTable dt = acceso.Leer("sp_MostrarNovSalPDF", parameters);
            return dt;
        }

        //Mostrar una sola Novedades de Saldo
        public DataTable MostrarNovSaldoIndividualID(Modelo.EntidadesNovedadSaldo novedad)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@Id", novedad.IdNov));
            DataTable dt = acceso.Leer("sp_MostrarNovSaldoIndividualID", parameters);
            return dt;
        }


        // mostrar tabla de novedadsaldo completa
        public DataTable MostrarNovSaldoTabla()
        {
            DataTable dt = acceso.Leer("sp_MostrarNovSaldoTabla", null);
            return dt;
        }

        //Eliminar novsaldo
        public DataTable ElimnarNovSaldo(Modelo.EntidadesNovedadSaldo nov)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@Id", nov.IdNov));
            DataTable dt = acceso.Leer("EliminarNovedad", parameters);
            return dt;
        }
        public DataTable ActualizarNovedad(Modelo.EntidadesNovedadSaldo nov)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@Id", nov.IdNov));
            parameters.Add(acceso.CrearParametro("@Respuesta", nov.Respuesta));
            parameters.Add(acceso.CrearParametro("@FechaRes", nov.FechaRes));
            parameters.Add(acceso.CrearParametro("@Estado", nov.Estado));
            parameters.Add(acceso.CrearParametro("@IdCorreo", nov.IdCorreo));
            DataTable dt = acceso.Leer("ActualizarNovedad", parameters);
            return dt;
        }
        public DataTable GuardarImagen(Modelo.EntidadImagenes nov)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@IdNovedad", nov.IdNovedad));
            parameters.Add(acceso.CrearParametro("@Imagen", nov.Imagen));
            DataTable dt = acceso.Leer("sp_NovSaldoImagenResp", parameters);
            return dt;
        }



        //PQR
        //guardar pqr con imagen
        public void GuardarPQR(Modelo.EntidadesPQR novedad, Modelo.EntidadImagenes imagen)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@Codigo", novedad.Codigo));
            parameters.Add(acceso.CrearParametro("@NombrePro", novedad.Nombre));
            parameters.Add(acceso.CrearParametro("@DescripcionPQR", novedad.DescripcionPQR));
            parameters.Add(acceso.CrearParametro("@Estado", novedad.Estado));
            parameters.Add(acceso.CrearParametro("@Respuesta", novedad.Respuesta));
            parameters.Add(acceso.CrearParametro("@FechaRes", novedad.FechaRespuesta));
            parameters.Add(acceso.CrearParametro("@Asignar", novedad.Asignar));
            parameters.Add(acceso.CrearParametro("@Codigo1", novedad.Codigo1));
            parameters.Add(acceso.CrearParametro("@Tipo", novedad.Tipo));
            parameters.Add(acceso.CrearParametro("@Nombre", imagen.Nombre));
            parameters.Add(acceso.CrearParametro("@IdSolPQR", imagen.IdSolPQR));
            acceso.GuardarDatos("spCargar_PQR", parameters);
        }
        //guardar pqr solo
        public void GuardarPQRSolo(Modelo.EntidadesPQR novedad)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@Codigo", novedad.Codigo));
            parameters.Add(acceso.CrearParametro("@NombrePro", novedad.Nombre));
            parameters.Add(acceso.CrearParametro("@DescripcionPQR", novedad.DescripcionPQR));
            parameters.Add(acceso.CrearParametro("@Estado", novedad.Estado));
            parameters.Add(acceso.CrearParametro("@Respuesta", novedad.Respuesta));
            parameters.Add(acceso.CrearParametro("@FechaRes", novedad.FechaRespuesta));
            parameters.Add(acceso.CrearParametro("@Asignar", novedad.Asignar));
            parameters.Add(acceso.CrearParametro("@Codigo1", novedad.Codigo1));
            parameters.Add(acceso.CrearParametro("@Tipo", novedad.Tipo));
            acceso.GuardarDatos("spCargar_PQRSolo", parameters);
        }

        //Mostrar pqr
        public DataTable MostrarPQR(Modelo.EntidadesPQR pqr)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@Codigo", pqr.Codigo));
            DataTable dt = acceso.Leer("sp_MostrarPQR", parameters);
            return dt;
        }
        //Mostrar llamados de atencion
        public DataTable MostrarPQRLLamado(Modelo.EntidadesPQR pqr)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@Codigo", pqr.Codigo1));
            DataTable dt = acceso.Leer("MostrarPQRLLamado", parameters);
            return dt;
        }
        //Mostrar un solo pqr
        public DataTable MostrarPQRIndividual(Modelo.EntidadesPQR pqr)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@Codigo", pqr.Codigo));
            parameters.Add(acceso.CrearParametro("@Id", pqr.IdPQR));
            DataTable dt = acceso.Leer("sp_MostrarPQRInd", parameters);
            return dt;
        }

        //Mostrar un solo pqr
        public DataTable MostrarPQRIndviCodigo(Modelo.EntidadesPQR pqr)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@Codigo", pqr.Codigo));
            DataTable dt = acceso.Leer("sp_MostrarPQRIndviCodigo", parameters);
            return dt;
        }
        //Mostrar un solo pqr por id
        public DataTable MostrarPQRIndvID(Modelo.EntidadesPQR pqr)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@Id", pqr.IdPQR));
            DataTable dt = acceso.Leer("sp_MostrarPQRIndvID", parameters);
            return dt;
        }
        //Mostrar un solo llamado de atencion estado cerrado codigo.
        public DataTable MostrarLLamdoIndviCodigo(Modelo.EntidadesPQR pqr)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@Codigo", pqr.Codigo1));
            DataTable dt = acceso.Leer("sp_MostrarLLamdoIndviCodigo", parameters);
            return dt;
        }

        //Mostrar un solo llamado de atencion
        public DataTable MostrarPQRLLamadoCerrada(Modelo.EntidadesPQR pqr)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@Codigo", pqr.Codigo1));
            DataTable dt = acceso.Leer("MostrarPQRLLamadoCerrada", parameters);
            return dt;
        }
        // mostrar tabla de pqr completa
        public DataTable MostrarPQRTabla()
        {
            DataTable dt = acceso.Leer("sp_MostrarPQRTabla", null);
            return dt;
        }
        //actualizar pqr
        public DataTable ActualizarPQR(Modelo.EntidadesPQR pqr)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@Id", pqr.IdPQR));
            parameters.Add(acceso.CrearParametro("@Respuesta", pqr.Respuesta));
            parameters.Add(acceso.CrearParametro("@FechaRespuesta", pqr.FechaRespuesta));
            parameters.Add(acceso.CrearParametro("@Codigo1", pqr.Codigo1));
            parameters.Add(acceso.CrearParametro("@Estado", pqr.Estado));
            parameters.Add(acceso.CrearParametro("@IdCorreo", pqr.IdCorreo));
            parameters.Add(acceso.CrearParametro("@DescripcionPQR", pqr.DescripcionPQR));
            DataTable dt = acceso.Leer("ActualizarPQR", parameters);
            return dt;
        }
        //Eliminar pqr
        public DataTable ElimnarPQR(Modelo.EntidadesPQR pqr)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@Id", pqr.IdPQR));
            DataTable dt = acceso.Leer("EliminarPQR", parameters);
            return dt;
        }
    }
}
