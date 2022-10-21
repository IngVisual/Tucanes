using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace IngenieriaVisualPH.Empleados
{
    public partial class Formulario_web15 : System.Web.UI.Page
    {
        Datos.MapeoParqueaderos mapeo = new Datos.MapeoParqueaderos();
        protected void Page_Load(object sender, EventArgs e)
        {           
            DataTable dt= mapeo.MostrarTableroParq();
            r1.DataSource = dt;
            r1.DataBind();
        }
    }
}