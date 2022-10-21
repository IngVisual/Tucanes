using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Security;

namespace IngenieriaVisualPH.Registro
{
    public partial class NuevoPassword : System.Web.UI.Page
    {
        Datos.Conexion acceso = new Datos.Conexion();
        Modelo.EntidadUsuario usuario = new Modelo.EntidadUsuario();
        public string Value { get; private set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                if(!ContraseñaValida())
                {
                    error.Style.Add("display", "block");
                }
            }
        }

        protected void btnactualizar_Click(object sender, EventArgs e)
        {
            if(txtcont.Text==txtcont2.Text)
            { 
                usuario.CCPropietario = txtcont2.Text;
                if(CambiarUsuarioContraseña())
                {
                error1.Style.Add("display", "block");
                    txtcont.Text = "";
                    txtcont2.Text = "";
                }
                 else
                {
                error.Style.Add("display", "block");
                    txtcont.Text = "";
                    txtcont2.Text = "";
                }
            }
            else
            {
                error2.Style.Add("display", "block");
                txtcont.Text = "";
                txtcont2.Text = "";
            }
        }
        // metodo para obtener el IdGuia del link como boolean
        private bool ContraseñaValida()
        {
            List<SqlParameter> parameters = new List<SqlParameter>();

            parameters.Add(acceso.CrearParametro("@GuiaID", Value = Request.QueryString["uid"]));
            int validar = acceso.Escribir("sp_LinkPassword", parameters);
            return Convert.ToBoolean(validar);
        }

        //validar id del link y cambiar contraseña de usuario en tblUsuario
        public bool CambiarUsuarioContraseña()
        {
            List<SqlParameter> parameters = new List<SqlParameter>();

            parameters.Add(acceso.CrearParametro("@GuiaID", Value = Request.QueryString["uid"]));
            parameters.Add(acceso.CrearParametro("@Contraseña", usuario.CCPropietario));
            int validar = acceso.Escribir("sp_CambiarContraseña", parameters);
            return Convert.ToBoolean(validar);
        }

    }
}