using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IngenieriaVisualPH.Propietario
{
    public partial class Formulario_web164 : System.Web.UI.Page
    {
        private int codigo;
        private string Msg;
        private int dia = 2;
        private bool validacion;
        Datos.MapeoMudanzas mud = new Datos.MapeoMudanzas();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                codigo = int.Parse(Session["cod"].ToString());
            }
            catch (Exception)
            {
                throw new Exception("Tiempo de sesion finalizado, por favor ingrese nuevamente a la app");
            }
        }

        protected void btnbuscar_Click(object sender, EventArgs e)
        {
            validacion = mud.ValidarFecha(Convert.ToDateTime(txtfecha.Text), dia);
            if (validacion)
            {
                Response.Redirect("ProMudanza.aspx?date=" + txtfecha.Text + "");
            }
            else
            {
                lblMessage.Text = "Seleccione otra fecha, Su solicitud se debe realizar con 3 días de anticipación a la fecha de la Mudanza. De lo contrario comuníquese con " + " ADMINISTRACION en los horarios de atención para que validen su solicitud.";
                lblMessage.Visible = true;
            }
        }
    }
}