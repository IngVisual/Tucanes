using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IngenieriaVisualPH.Administracion
{
    public partial class Formulario_web154 : System.Web.UI.Page
    {
        Datos.MapeoRegistros mapeo = new Datos.MapeoRegistros();
        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable dt = mapeo.MostrarbiciTabla();
            var result = dt.AsEnumerable().Where(myRow => myRow.Field<string>("Estado") == "Autorizado").AsDataView();
            r1.DataSource = result;
            r1.DataBind();
        }
    }
}