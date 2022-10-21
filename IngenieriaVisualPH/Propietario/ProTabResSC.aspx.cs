using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace IngenieriaVisualPH.Propietario
{
    public partial class Formulario_web143 : System.Web.UI.Page
    {
        Datos.MapeoSC mapeo = new Datos.MapeoSC();
        Modelo.EntidadSC usuario = new Modelo.EntidadSC();
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
            try { 
            id = Convert.ToInt32(Request.QueryString["Id"].ToString());
            if (IsPostBack) return;
            Datos.MapeoCorreo correo = new Datos.MapeoCorreo();
            correo.ActualizarInfoCorreo(id);
            }
            catch
            {
            }
            usuario.Codigo = int.Parse(lblcodigo.Text);
            DataTable dt = mapeo.MostrarApaSC(usuario);
            r1.DataSource = dt;
            r1.DataBind();
        }
    }
}