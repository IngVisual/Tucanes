using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace IngenieriaVisualPH.Administracion
{
    public partial class Formulario_web114 : System.Web.UI.Page
    {
        Datos.MapeoRegistros mapeo = new Datos.MapeoRegistros();
        Modelo.EntidadRegistroGeneral usuario = new Modelo.EntidadRegistroGeneral();
        protected void Page_Load(object sender, EventArgs e)
        {
            llamaTablaSolCart();
        }
        public void llamaTablaSolCart()
        {
            DataTable dt = mapeo.MostrarCarteTabla();
            var result = dt.AsEnumerable().Where(myRow => myRow.Field<string>("Estado") == "Solicitud").AsDataView();
            r1.DataSource = result;
            r1.DataBind();
        }

        protected void ddestado_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataTable dt = mapeo.MostrarCarteTabla();
            var result = dt.AsEnumerable().Where(myRow => myRow.Field<string>("Estado") == ddestado.Text).AsDataView();
            r1.DataSource = result;
            r1.DataBind();
        }
    }
}