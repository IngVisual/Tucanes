using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace IngenieriaVisualPH.Propietario
{
    public partial class Formulario_web138 : System.Web.UI.Page
    {
        Datos.MapeoRegistros mapeo = new Datos.MapeoRegistros();
        Modelo.EntidadCartelera usuario = new Modelo.EntidadCartelera();
        string codigo;
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
            DataTable dt = mapeo.MostrarArriendo(usuario);
            r1.DataSource = dt;
            r1.DataBind();
        }

        protected void btnenviardocuemnto_Click(object sender, EventArgs e)
        {
            if (txtobservacion.Text != "" && txttelefono.Text != "" && txtnombre.Text != "" && ddestado.Text != "" && txtprecio.Text != "")
            {
                usuario.Codigo = int.Parse(codigo);
                usuario.Estado = ddestado.Text;
                usuario.Nombre = txtnombre.Text;
                usuario.Descripcion = txtobservacion.Text;
                usuario.Celular = txttelefono.Text;
                usuario.Precio = txtprecio.Text;
                mapeo.RegistroArriendo(usuario);
                error1.Style.Add("display", "block");
                txtnombre.Text = "";
                txtobservacion.Text = "";
                txttelefono.Text = "";
                txtprecio.Text = "";
                ddestado.Text = "";
                DataTable dt = mapeo.MostrarArriendo(usuario);
                r1.DataSource = dt;
                r1.DataBind();
            }
        }
    }
}