using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IngenieriaVisualPH.Propietario
{
    public partial class Formulario_web110 : System.Web.UI.Page
    {
        Datos.MapeoRegistros mapeo = new Datos.MapeoRegistros();
        Modelo.EntidadVisitantes usuario = new Modelo.EntidadVisitantes();
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

        protected void btnguardar_Click(object sender, EventArgs e)
        {
            if (txtfecha.Text != "" && txtuuario.Text != "" && ddobs.Text != "")
            {
                usuario.Codigo = int.Parse(lblcodigo.Text);
                usuario.PlacaVehiculo = txtplaca.Text;
                usuario.Vehiculo = ddvehiculo.Text;
                usuario.FechaPro = Convert.ToDateTime(txtfecha.Text);
                usuario.Observacion = ddobs.Text;
                usuario.Usuario = txtuuario.Text;
                mapeo.RegistroVisita(usuario);
                txtfecha.Text = "";
                txtuuario.Text = "";
                txtplaca.Text = "";
                ddvehiculo.Text = "";
                ddobs.Text = "";
                Response.Redirect("ProRegistroVisitantes.aspx");
            }
        }
    }
}