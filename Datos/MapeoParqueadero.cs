using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace Datos
{
    public class MapeoParqueadero
    {
        private Conexion acceso = new Conexion();

        public void GuardarDatosParque(Modelo.EntidadParqueadero usuario, Modelo.EntidadImagenes imagen)
        {
            List<SqlParameter> parameter = new List<SqlParameter>();
            parameter.Add(acceso.CrearParametro("@Codigo", usuario.Codigo));
            parameter.Add(acceso.CrearParametro("@Estado", usuario.Estado));
            parameter.Add(acceso.CrearParametro("@Respuesta", usuario.Respuesta));
            parameter.Add(acceso.CrearParametro("@Destino", usuario.Destino));
            parameter.Add(acceso.CrearParametro("@PlacaMoto", usuario.PlacaMoto));
            parameter.Add(acceso.CrearParametro("@PlacaCarro", usuario.PlacaCarro));
            parameter.Add(acceso.CrearParametro("@PLacaCarroMoto", usuario.PLacaCarroMoto));
            parameter.Add(acceso.CrearParametro("@Color", usuario.Color));
            parameter.Add(acceso.CrearParametro("@TP", usuario.TP));
            parameter.Add(acceso.CrearParametro("@IdSolParq", imagen.IdSolParq));
            parameter.Add(acceso.CrearParametro("@Cedula", imagen.Cedula));
            parameter.Add(acceso.CrearParametro("@Soat", imagen.Soat));
            parameter.Add(acceso.CrearParametro("@TarjetaP", imagen.TarjetaP));
            parameter.Add(acceso.CrearParametro("@TecnoM", imagen.TecnoM));
            parameter.Add(acceso.CrearParametro("@Vehiculo", imagen.Vehiculo));
            acceso.GuardarDatos("spcargar_Documento", parameter);
        }

        public DataTable MostrarSolParqueaderos(Modelo.EntidadParqueadero usuario)
        {
            List<SqlParameter> parameter = new List<SqlParameter>();
            parameter.Add(acceso.CrearParametro("@Codigo", usuario.Codigo));
            DataTable dt = acceso.Leer("MostrarSolParqueaderos", parameter);
            return dt;
        }

        public DataTable ActualizarSolPar(Modelo.EntidadParqueadero usuario)
        {
            List<SqlParameter> parameter = new List<SqlParameter>();
            parameter.Add(acceso.CrearParametro("@Id", usuario.Id));
            parameter.Add(acceso.CrearParametro("@Respuesta", usuario.Respuesta));
            parameter.Add(acceso.CrearParametro("@FechaRespuesta", usuario.FechaRespuesta));
            parameter.Add(acceso.CrearParametro("@Estado", usuario.Estado));
            parameter.Add(acceso.CrearParametro("@IdCorreo", usuario.IdCorreo));
            DataTable dt = acceso.Leer("ActualizarDocumento", parameter);
            return dt;
        }

        public DataTable MostrarUnSolPaqrCodigo(Modelo.EntidadParqueadero usuario)
        {
            List<SqlParameter> parameter = new List<SqlParameter>();
            parameter.Add(acceso.CrearParametro("@Codigo", usuario.Codigo));
            DataTable dt = acceso.Leer("sp_MostrarUnSolPaqrCodigo", parameter);
            return dt;
        }

        public DataTable MostrarUnSolPaqrID(Modelo.EntidadParqueadero usuario)
        {
            List<SqlParameter> parameter = new List<SqlParameter>();
            parameter.Add(acceso.CrearParametro("@Id", usuario.Id));
            DataTable dt = acceso.Leer("sp_MostrarUnSolPaqrID", parameter);
            return dt;
        }

        public DataTable MostrarUnaSolParqueaderos(Modelo.EntidadParqueadero usuario)
        {
            List<SqlParameter> parameter = new List<SqlParameter>();
            parameter.Add(acceso.CrearParametro("@Codigo", usuario.Codigo));
            parameter.Add(acceso.CrearParametro("@Id", usuario.Id));
            DataTable dt= acceso.Leer("Mostrar_UnaSolParque", parameter);
            return dt;
        }

        public DataTable MostrarSolParqTabla()
        {
            DataTable dt = acceso.Leer("sp_MostrarSolParqTabla", null);
            return dt;
        }

        public void EliminarSolPar(Modelo.EntidadParqueadero usuario)
        {
            List<SqlParameter> parameter = new List<SqlParameter>();
            parameter.Add(acceso.CrearParametro("@Id", usuario.Id));
            acceso.GuardarDatos("EliminarDocumento", parameter);
        }

    }
}
