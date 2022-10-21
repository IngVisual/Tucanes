using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace IngenieriaVisualPH.Propietario
{
    public partial class Formulario_web124 : System.Web.UI.Page
    {
        Datos.MapeoSolicitudes mapeo = new Datos.MapeoSolicitudes();
        Modelo.EntidadesPQR usuario = new Modelo.EntidadesPQR();
        private int id;
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
            try
            {
                id = Convert.ToInt32(Request.QueryString["Id"].ToString());
                if (IsPostBack) return;
                Datos.MapeoCorreo correo = new Datos.MapeoCorreo();
                correo.ActualizarInfoCorreo(id);
            }
            catch
            {

            }
            usuario.Codigo = int.Parse(lblcodigo.Text);
            DataTable dt = mapeo.MostrarPQR(usuario);
            r1.DataSource = dt;
            r1.DataBind();
        }
    }
}