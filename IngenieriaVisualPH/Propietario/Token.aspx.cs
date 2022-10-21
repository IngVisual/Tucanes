using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IngenieriaVisualPH.Propietario
{
    public partial class Formulario_web12 : System.Web.UI.Page
    {
        Modelo.EntidadUsuario usuario = new  Modelo.EntidadUsuario();
        Datos.MapeoUsuarios mapeo = new Datos.MapeoUsuarios();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                lblcodigo.Text = Session["cod"].ToString();
            }
            catch (Exception)
            {
                throw new Exception("Tiempo de sesion finalizado, por favor ingrese nuevamente a la app");
            }
            Session["cod"] = lblcodigo.Text;
            usuario.Codigo = int.Parse(lblcodigo.Text);
            mapeo.ContreoUsuarios(usuario);
        }
    }
}