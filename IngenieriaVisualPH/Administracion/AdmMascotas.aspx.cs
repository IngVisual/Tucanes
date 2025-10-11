using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IngenieriaVisualPH.Administracion
{
    public partial class Formulario_web157 : System.Web.UI.Page
    {
        Datos.MapeoMascotas mapeo = new Datos.MapeoMascotas();
        Modelo.EntidadMascota usuario = new Modelo.EntidadMascota();
        private int count1, count2;
        protected void Page_Load(object sender, EventArgs e)
        {
            llamaTablaSolbici();
        }
        public void llamaTablaSolbici()
        {
            DataTable dt = mapeo.MostrarMascotaTabla();
            var result = dt.AsEnumerable().Where(myRow => myRow.Field<string>("Estado") == "Registrado").AsDataView();
            count1 = result.Count;
            lblnot8.Text = count1.ToString();
            var result2 = dt.AsEnumerable().Where(myRow => myRow.Field<string>("Estado") == "Solicitud").AsDataView();
            r1.DataSource = result2;
            r1.DataBind();
        }
    }
}