using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


namespace IngenieriaVisualPH.Propietario
{
    public partial class Formulario_web136 : System.Web.UI.Page
    {
        Datos.MapeoRegistros mapeo = new Datos.MapeoRegistros();
        Modelo.EntidadCartelera usuario = new Modelo.EntidadCartelera();
        string codigo, estado="Solicitud";
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                codigo = Session["cod"].ToString();
            }
            catch (Exception)
            {
                throw new Exception("Tiempo de sesion finalizado, por favor ingrese nuevamente a la app");
            }
            usuario.Codigo = int.Parse(codigo);
            DataTable dt = mapeo.MostrarCartelera(usuario);
            r1.DataSource = dt;
            r1.DataBind();
        }

        protected void btnenviardocuemnto_Click(object sender, EventArgs e)
        {
            if (txtobservacion.Text != "" && txttelefono.Text != "" && txtnombre.Text != "")
            {
                usuario.Codigo = int.Parse(codigo);
                usuario.Estado = estado;
                usuario.Nombre = txtnombre.Text;
                usuario.Observaciones = txtobservacion.Text;
                usuario.Celular = txttelefono.Text;
                mapeo.RegistroCartelera(usuario);
                error1.Style.Add("display", "block");
                txtnombre.Text = "";
                txtobservacion.Text = "";
                txttelefono.Text = "";
                DataTable dt = mapeo.MostrarCartelera(usuario);
                r1.DataSource = dt;
                r1.DataBind();
            }
        }
    }
}