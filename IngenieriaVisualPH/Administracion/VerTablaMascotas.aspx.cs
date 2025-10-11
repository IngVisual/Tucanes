using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IngenieriaVisualPH.Administracion
{
    public partial class Formulario_web159 : System.Web.UI.Page
    {
        Datos.MapeoMascotas mapeo = new Datos.MapeoMascotas();
        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable dt = mapeo.MostrarMascotaTabla();
            var result = dt.AsEnumerable().Where(myRow => myRow.Field<string>("Estado") == "Registrado").AsDataView();
            r1.DataSource = result;
            r1.DataBind();
        }
    }
}