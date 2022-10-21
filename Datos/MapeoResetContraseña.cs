using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using System.Web;

namespace Datos
{  
    public class MapeoResetContraseña
    {
        Conexion acceso = new Conexion();

        //--enviar correo para recuperar contraseña
        public SqlDataReader ResetContraseña(Modelo.EntidadUsuario usuario)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();

            parameters.Add(acceso.CrearParametro("@Codigo",usuario.Codigo));
            return acceso.RetornarSqlReader("sp_NuevaContraseña",parameters);
        }
        
    }
}
