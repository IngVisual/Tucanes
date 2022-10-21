using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;

namespace IngenieriaVisualPH.Propietario
{
    public partial class Formulario_web114 : System.Web.UI.Page
    {
        Datos.MapeoSaldos mapeo = new Datos.MapeoSaldos();
        Modelo.EntidadUsuario usuario = new Modelo.EntidadUsuario();
        int total = 0;
        int favor = 0;
        int Mediodb = 130000;
        int Alto = 350000;
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
            string message = string.Empty;
            try
            {
                usuario.Codigo = int.Parse(lblcodigo.Text);
                DataTable dt = mapeo.MostrarSaldo(usuario);
                r1.DataSource = dt;
                r1.DataBind();
                DataTable dt1 = mapeo.MostrarObserSaldo();
                foreach (DataRow item in dt1.Rows)
                {                  
                    CultureInfo RegionIdioma = new CultureInfo("es-ES");
                    DateTime fecha = Convert.ToDateTime(item["Fecha"].ToString());
                    fecha.ToString(RegionIdioma);
                    lblfecha.Text = fecha.Date.ToString("dd/MM/yyyy");
                    lblmsg.Text = item["Msg"].ToString();
                }
                foreach (DataRow item in dt.Rows)
                {
                    lbltotal1.Text = item["Total"].ToString();
                    lblfavor.Text = item["Juridico"].ToString();
                }
                total = Convert.ToInt32(lbltotal1.Text.Trim());            
                favor = Convert.ToInt32(lblfavor.Text.Trim());
                if (total <= Mediodb)
                {
                    lbltotal1.ForeColor = System.Drawing.Color.Green;
                    Image2.Visible = true;
                    lblbien.Visible = true;
                }
                else
                if (total <= Alto)
                {
                    lbltotal1.ForeColor = System.Drawing.Color.Red;
                    Image3.Visible = true;
                    lblmedio.Visible = true;
                }
                else
                {
                    lbltotal1.ForeColor = System.Drawing.Color.Red;
                    Image4.Visible = true;
                    lblmalo.Visible = true;
                }
            }
            catch (Exception error)
            {
                message = "No hemos cargado tu estado de cuenta:" + error.Message;
            }
            lblmensaje.Text = message;
            lblmensaje.Visible = true;
        }
    }
}