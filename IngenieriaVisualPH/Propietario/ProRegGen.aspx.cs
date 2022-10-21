using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IngenieriaVisualPH.Propietario
{
    public partial class Formulario_web112 : System.Web.UI.Page
    {
        Datos.MapeoRegistros mapeo = new Datos.MapeoRegistros();
        Modelo.EntidadRegistroGeneral usuario = new Modelo.EntidadRegistroGeneral();
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
        }

        protected void btnenviardocuemnto_Click(object sender, EventArgs e)
        {          
            if (txtobservacion.Text != "" )
            {
                usuario.Codigo = int.Parse(lblcodigo.Text);
                usuario.Observaciones = txtobservacion.Text;
                mapeo.RegistroGeneral(usuario);
                error.Style.Add("display", "block");
                txtobservacion.Text = "";
            }
        }
    }
}