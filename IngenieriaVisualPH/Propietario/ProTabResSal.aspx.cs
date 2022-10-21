using System;
using System.Data;

namespace IngenieriaVisualPH.Propietario
{
    public partial class Formulario_web131 : System.Web.UI.Page
    {
        Datos.MapeoMudanzas mapeo = new Datos.MapeoMudanzas();
        Modelo.EntidadMudanzas usuario = new Modelo.EntidadMudanzas();
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
            DataTable dt = mapeo.MostrarMudanza(usuario);
            r1.DataSource = dt;
            r1.DataBind();
        }
    }
}