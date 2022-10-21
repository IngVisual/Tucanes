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
    public partial class Formulario_web18 : System.Web.UI.Page
    {
        Datos.MapeoRegistros mapeo = new Datos.MapeoRegistros();
        Modelo.EntidadBicicleta usuario = new Modelo.EntidadBicicleta();
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
            usuario.Codigo = int.Parse(lblcodigo.Text);
            DataTable dt = mapeo.MostrarCicla(usuario);
            r1.DataSource = dt;
            r1.DataBind();
        }

        protected void btnactualizar_Click(object sender, EventArgs e)
        {
            if (txtcolor.Text != "" && txtmarca.Text != "" && ddper.Text != "" && ddtipo.Text != "")
            {
                usuario.Codigo = int.Parse(lblcodigo.Text);
                usuario.Estado = lblestado.Text;
                usuario.Marca = txtmarca.Text;
                usuario.Persona = ddper.Text;
                usuario.Tipo = ddtipo.Text;
                usuario.Color = txtcolor.Text;
                mapeo.RegistroCicla(usuario);
                error1.Style.Add("display", "block");
                txtcolor.Text = "";
                txtmarca.Text = "";
                ddper.Text = "";
                ddtipo.Text = "";
                DataTable dt = mapeo.MostrarCicla(usuario);
                r1.DataSource = dt;
                r1.DataBind();
            }
        }

    }
}