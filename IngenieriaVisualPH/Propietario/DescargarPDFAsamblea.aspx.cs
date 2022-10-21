using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace IngenieriaVisualPH.Propietario
{
    public partial class Formulario_web148 : System.Web.UI.Page
    {
        Datos.MapeoDescargas mapeo = new Datos.MapeoDescargas();
        Modelo.EntidadDescargas usuario = new Modelo.EntidadDescargas();
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
            DataTable dt = mapeo.MostrarDocAdm();
            r1.DataSource = dt;
            r1.DataBind();
        }        
    }
}