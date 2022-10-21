using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using System.Security;
using System.Web.Security;

namespace Datos
{  
    public class MapeoLogin
    {
        private Conexion acceso = new Conexion();

        public int Login(Modelo.EntidadUsuario usuarios)
        {
            List<SqlParameter> parametro = new List<SqlParameter>();
            //string encrytattion = FormsAuthentication.HashPasswordForStoringInConfigFile(usuarios.CCPropietario,"SHA1");
            parametro.Add(acceso.CrearParametro("@Codigo", usuarios.Codigo));
            parametro.Add(acceso.CrearParametro("@CCPropietario", usuarios.CCPropietario));
            parametro.Add(acceso.CrearParametro("@AceptaTerminosyCondiciones", usuarios.AceptaTerminosyCondiciones));
            return acceso.VerificarLogin("spAutenticar_User", parametro);
        }

        public int LoginEmpleado(Modelo.EntidadUsuario usuarios)
        {
            List<SqlParameter> parametro = new List<SqlParameter>();
            //string encrytattion = FormsAuthentication.HashPasswordForStoringInConfigFile(usuarios.CCPropietario,"SHA1");
            parametro.Add(acceso.CrearParametro("@Usuario", usuarios.Codigo));
            parametro.Add(acceso.CrearParametro("@Contraseña", usuarios.CCPropietario));
            return acceso.VerificarLogin("spAutenticar_User2", parametro);
        }

    }
}
