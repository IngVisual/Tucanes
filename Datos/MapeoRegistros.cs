using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;

namespace Datos
{
    public class MapeoRegistros
    {
        private Conexion acceso = new Conexion();
        //Registrar tabla de ciclas
        public void RegistroCicla(Modelo.EntidadBicicleta usuario)
        {
            List<SqlParameter> parameter = new List<SqlParameter>();
            parameter.Add(acceso.CrearParametro("@Codigo", usuario.Codigo));
            parameter.Add(acceso.CrearParametro("@Estado", usuario.Estado));
            parameter.Add(acceso.CrearParametro("@Marca", usuario.Marca));
            parameter.Add(acceso.CrearParametro("@Tipo", usuario.Tipo));
            parameter.Add(acceso.CrearParametro("@Color", usuario.Color));
            parameter.Add(acceso.CrearParametro("@Persona", usuario.Persona));
            acceso.GuardarDatos("spcargar_Cicla", parameter);
        }
        //Mostrar Cicla
        public DataTable MostrarCicla(Modelo.EntidadUsuario Usuario)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@Codigo", Usuario.Codigo));
            DataTable dt = acceso.Leer("sp_MostrarCicla", parameters);
            return dt;
        }

        //Registrar visitas
        public void RegistroVisita(Modelo.EntidadVisitantes usuario)
        {
            List<SqlParameter> parameter = new List<SqlParameter>();
            parameter.Add(acceso.CrearParametro("@Codigo", usuario.Codigo));    
            parameter.Add(acceso.CrearParametro("@PlacaVehiculo", usuario.PlacaVehiculo));
            parameter.Add(acceso.CrearParametro("@Vehiculo", usuario.Vehiculo));
            parameter.Add(acceso.CrearParametro("@FechaPro", usuario.FechaPro));
            parameter.Add(acceso.CrearParametro("@Observacion", usuario.Observacion));
            parameter.Add(acceso.CrearParametro("@Usuario", usuario.Usuario));
            acceso.GuardarDatos("spcargar_Ingresos", parameter);
        }

        //Mostrar Visitas
        public DataTable MostrarVisita(Modelo.EntidadUsuario Usuario)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@Codigo", Usuario.Codigo));
            DataTable dt = acceso.Leer("sp_MostrarVisitas", parameters);
            return dt;
        }

        //Registro Gneral
        public void RegistroGeneral(Modelo.EntidadRegistroGeneral usuario)
        {
            List<SqlParameter> parameter = new List<SqlParameter>();
            parameter.Add(acceso.CrearParametro("@Codigo", usuario.Codigo));
            parameter.Add(acceso.CrearParametro("@Observaciones", usuario.Observaciones));
            acceso.GuardarDatos("spcargar_RegGen", parameter);
        }

        // Registro Cartelera
        public void RegistroCartelera(Modelo.EntidadCartelera usuario)
        {
            List<SqlParameter> parameter = new List<SqlParameter>();
            parameter.Add(acceso.CrearParametro("@Codigo", usuario.Codigo));
            parameter.Add(acceso.CrearParametro("@Nombre", usuario.Nombre));
            parameter.Add(acceso.CrearParametro("@Celular", usuario.Celular));
            parameter.Add(acceso.CrearParametro("@Estado", usuario.Estado));
            parameter.Add(acceso.CrearParametro("@Observaciones", usuario.Observaciones));
            acceso.GuardarDatos("spcargar_cartelera", parameter);
        }
        //Mostrar Cartelera
        public DataTable MostrarCartelera(Modelo.EntidadCartelera Usuario)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@Codigo", Usuario.Codigo));
            DataTable dt = acceso.Leer("sp_MostrarCartelera", parameters);
            return dt;
        }
        //mostrar tabla cartelera
        public DataTable MostrarCarteTabla()
        {
            DataTable dt = acceso.Leer("sp_MostrarCarteTabla", null);
            return dt;
        }

        // Registro Arriendo
        public void RegistroArriendo(Modelo.EntidadCartelera usuario)
        {
            List<SqlParameter> parameter = new List<SqlParameter>();
            parameter.Add(acceso.CrearParametro("@Codigo", usuario.Codigo));
            parameter.Add(acceso.CrearParametro("@Nombre", usuario.Nombre));
            parameter.Add(acceso.CrearParametro("@Celular", usuario.Celular));
            parameter.Add(acceso.CrearParametro("@Estado", usuario.Estado));
            parameter.Add(acceso.CrearParametro("@Precio", usuario.Precio));
            parameter.Add(acceso.CrearParametro("@Descripcion", usuario.Descripcion));
            acceso.GuardarDatos("spcargar_Arriendo", parameter);
        }
        //Mostrar Arriendo
        public DataTable MostrarArriendo(Modelo.EntidadCartelera Usuario)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@Codigo", Usuario.Codigo));
            DataTable dt = acceso.Leer("sp_MostrarArriendo", parameters);
            return dt;
        }
        //Mostrar Arriendo Cartelera
        public DataTable MostrarCarte(Modelo.EntidadCartelera Usuario)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@Estado", Usuario.Estado));
            DataTable dt = acceso.Leer("sp_MostrarCarte", parameters);
            return dt;
        }
        //Mostrar Arriendo Cartelera
        public DataTable MostrarArrie()
        {
            DataTable dt = acceso.Leer("sp_MostrarArrien", null);
            return dt;
        }

    }
}
