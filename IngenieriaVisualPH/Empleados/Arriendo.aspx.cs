using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace IngenieriaVisualPH.Empleados
{
    public partial class Formulario_web17 : System.Web.UI.Page
    {
        Datos.MapeoRegistros mapeo = new Datos.MapeoRegistros();
        Modelo.EntidadCartelera usuario = new Modelo.EntidadCartelera();
        protected void Page_Load(object sender, EventArgs e)
        {
                DataTable dt1 = mapeo.MostrarArrie();
                r2.DataSource = dt1;
                r2.DataBind();
        }
    }
}