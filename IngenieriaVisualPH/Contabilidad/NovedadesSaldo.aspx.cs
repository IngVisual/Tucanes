using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace IngenieriaVisualPH.Contabilidad
{
    public partial class Formulario_web11 : System.Web.UI.Page
    {
        Datos.MapeoSolicitudes mapeo = new Datos.MapeoSolicitudes();
        Modelo.EntidadesNovedadSaldo usuario = new Modelo.EntidadesNovedadSaldo();
        private int count1, count2;
        protected void Page_Load(object sender, EventArgs e)
        {
            llamaTablaNovSal();
        }
        public void llamaTablaNovSal()
        {
            DataTable dt = mapeo.MostrarNovSaldoTabla();
            var result = dt.AsEnumerable().Where(myRow => myRow.Field<string>("Estado") == "Abierta").AsDataView();
            count1 = result.Count;
            lblnot8.Text = count1.ToString();
            var result1 = dt.AsEnumerable().Where(myRow => myRow.Field<string>("Estado") == "En Proceso").AsDataView();
            count2 = result1.Count;
            Label1.Text = count2.ToString();
            r1.DataSource = result;
            r1.DataBind();
        }
        protected void txtbuscar_TextChanged(object sender, EventArgs e)
        {
            if (txtbuscar.Text != "")
            {
                var codigoBus = new Modelo.EntidadesNovedadSaldo();
                codigoBus.Codigo = int.Parse(txtbuscar.Text);
                DataTable dt = mapeo.MostrarUnNovSalCodigo(codigoBus);
                var result = dt.AsEnumerable().Where(myRow => myRow.Field<string>("Codigo") == txtbuscar.Text).AsDataView();
                r1.DataSource = result;
                r1.DataBind();
                error1.Style.Add("display", "none");
            }
            else
            {
                error1.Style.Add("display", "block");
            }
        }

        protected void ddestado_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataTable dt = mapeo.MostrarNovSaldoTabla();
            var result = dt.AsEnumerable().Where(myRow => myRow.Field<string>("Estado") == ddestado.Text).AsDataView();
            r1.DataSource = result;
            r1.DataBind();
        }
    }
}