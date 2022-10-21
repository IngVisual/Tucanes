using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Threading;

namespace IngenieriaVisualPH.Propietario
{
    public partial class Formulario_web118 : System.Web.UI.Page
    {
        public Datos.Conexion con = new Datos.Conexion();
        Datos.MapeoSolicitudes mapeo = new Datos.MapeoSolicitudes();
        Modelo.EntidadesNovedadSaldo novedad = new Modelo.EntidadesNovedadSaldo();
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

        protected void btnsave_Click(object sender, EventArgs e)
        {
            if (txtobservacion.Text != "")
            {
                lblmensaje.Visible = false;
                novedad.Codigo = int.Parse(lblcodigo.Text);
                novedad.Obseraciones = txtobservacion.Text;
                novedad.Estado = lblestado.Text;
                novedad.Respuesta = lblresp.Text;
                novedad.FechaRes = lblfecha.Text;
                mapeo.GuardarSolPyZ(novedad);
                error.Style.Add("display", "block");
                btnsave.Visible = false;
                txtobservacion.Text = "";
            }
            else
            {
                lblmensaje.Visible = true;
                lblmensaje.Text = "Ingrese la descripción";
            }
        }
    }
}