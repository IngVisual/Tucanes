using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace Datos
{
    public class MapeoUsuarios
    {
        private Conexion acceso = new Conexion();
        Modelo.EntidadUsuario usuario = new Modelo.EntidadUsuario();

        public DataTable LeerUsuario(Modelo.EntidadUsuario Usuario)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@Codigo", Usuario.Codigo));
            DataTable dt = acceso.Leer("sp_MostrarUsuario", parameters);
            return dt;
        }

        public DataTable TablaUsuario()
        {
            DataTable dt = acceso.Leer("sp_TablaUsuario", null);
            return dt;
        }

        public int ActualizarUsuario(Modelo.EntidadUsuario usuario)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@Codigo",usuario.Codigo));
            parameters.Add(acceso.CrearParametro("@Celular", usuario.Celular));
            parameters.Add(acceso.CrearParametro("@OtroCelular", usuario.OtroCelular));
            parameters.Add(acceso.CrearParametro("@Email", usuario.Email));
            parameters.Add(acceso.CrearParametro("@AceptaTerminosyCondiciones", usuario.AceptaTerminosyCondiciones));
            parameters.Add(acceso.CrearParametro("@Estado", usuario.Estado));
            parameters.Add(acceso.CrearParametro("@CelularArr", usuario.CelularArr));
            parameters.Add(acceso.CrearParametro("@Npersonas", usuario.Npersonas));
            parameters.Add(acceso.CrearParametro("@NMenores", usuario.NMenores));
            parameters.Add(acceso.CrearParametro("@Nmascotas", usuario.Nmascotas));
            parameters.Add(acceso.CrearParametro("@Razas", usuario.Razas));
            parameters.Add(acceso.CrearParametro("@NombMayores", usuario.NomMayores));
            parameters.Add(acceso.CrearParametro("@NombMenores", usuario.NomMenores));
            parameters.Add(acceso.CrearParametro("@NombProhibidoIngreso", usuario.NomProhibidoIng));
            return acceso.Escribir("sp_ActualizarUsuario", parameters);
        }
        public int ActualizarUsuarioPassword(Modelo.EntidadUsuario usuario)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@Codigo", usuario.Codigo));
            parameters.Add(acceso.CrearParametro("@Celular", usuario.Celular));
            parameters.Add(acceso.CrearParametro("@CCPropietario", usuario.CCPropietario));
            parameters.Add(acceso.CrearParametro("@OtroCelular", usuario.OtroCelular));
            parameters.Add(acceso.CrearParametro("@Email", usuario.Email));
            parameters.Add(acceso.CrearParametro("@AceptaTerminosyCondiciones", usuario.AceptaTerminosyCondiciones));
            parameters.Add(acceso.CrearParametro("@Estado", usuario.Estado));
            parameters.Add(acceso.CrearParametro("@CelularArr", usuario.CelularArr));
            parameters.Add(acceso.CrearParametro("@Npersonas", usuario.Npersonas));
            parameters.Add(acceso.CrearParametro("@NMenores", usuario.NMenores));
            parameters.Add(acceso.CrearParametro("@Nmascotas", usuario.Nmascotas));
            parameters.Add(acceso.CrearParametro("@Razas", usuario.Razas));
            parameters.Add(acceso.CrearParametro("@NombrePropietario", usuario.NombrePropietario));
            parameters.Add(acceso.CrearParametro("@NombMayores", usuario.NomMayores));
            parameters.Add(acceso.CrearParametro("@NombMenores", usuario.NomMenores));
            parameters.Add(acceso.CrearParametro("@NombProhibidoIngreso", usuario.NomProhibidoIng));
            return acceso.Escribir("spActualizarPropietario", parameters);
        }
        public int ContreoUsuarios(Modelo.EntidadUsuario conteo)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@Codigo",conteo.Codigo));
            return acceso.Escribir("sp_ActualizarIngresos", parameters);
        }
    }
}
