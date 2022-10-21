using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IngenieriaVisualPH.Propietario
{
    public partial class Formulario_web13 : System.Web.UI.Page
    {
        Datos.MapeoPush mapeo = new Datos.MapeoPush();
        Modelo.EntidadPush push = new Modelo.EntidadPush();
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
            txtpush.Text = Request.QueryString["value"];
            push.Codigo = int.Parse(lblcodigo.Text);
            push.Push = txtpush.Text;
            mapeo.GuardarPush(push);
            Response.Redirect("Home.aspx");
        }

    }
}