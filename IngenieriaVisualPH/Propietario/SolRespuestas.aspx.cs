using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace IngenieriaVisualPH.Propietario
{
    public partial class Formulario_web160 : System.Web.UI.Page
    {
        private int codigo;
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
            Datos.MapeoCorreo correo = new Datos.MapeoCorreo();
            DataTable dt= correo.MostrarInfoCorreo(codigo);
            r1.DataSource = dt;
            r1.DataBind();
        }
    }
}