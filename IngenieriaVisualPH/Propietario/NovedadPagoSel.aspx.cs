using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Globalization;

namespace IngenieriaVisualPH.Propietario
{
    public partial class Formulario_web117 : System.Web.UI.Page
    {
        Datos.MapeoSaldos mapeo = new Datos.MapeoSaldos();
        Modelo.EntidadUsuario usuario = new Modelo.EntidadUsuario();
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
            try
            {
                DataTable dt1 = mapeo.MostrarObserSaldo();
                foreach (DataRow item in dt1.Rows)
                {
                    CultureInfo RegionIdioma = new CultureInfo("es-ES");
                    DateTime fecha = Convert.ToDateTime(item["Fecha"].ToString());
                    fecha.ToString(RegionIdioma);
                    lblfecha.Text = fecha.Date.ToString("dd/MM/yyyy");
                }
            }
            catch
            {

            }
        }

        protected void btnactualizar_Click(object sender, EventArgs e)
        {
            if (RadioButton1.Checked == true)
            {
                error1.Style.Add("display", "block");
            }

            if (RadioButton2.Checked == true)
            {
                Response.Redirect("NovedadPago.aspx");
            }
            if (RadioButton3.Checked == true)
            {
                Response.Redirect("NovedadPagoPyZ.aspx");
            }
        }
    }
}