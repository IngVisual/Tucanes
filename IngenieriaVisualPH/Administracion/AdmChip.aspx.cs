using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace IngenieriaVisualPH.Administracion
{
    public partial class Formulario_web118 : System.Web.UI.Page
    {
        Datos.MapeoChip mapeo = new Datos.MapeoChip();
        Modelo.EntidadChip usuario = new Modelo.EntidadChip();
        private int count1, count2;
        protected void Page_Load(object sender, EventArgs e)
        {
            LlamartablaChip();
        }
        public void LlamartablaChip()
        {
            DataTable dt = mapeo.MostrarChipTabla();
            var result = dt.AsEnumerable().Where(row=> row.Field<string>("Estado")== "Solicitud").AsDataView();
            count1 = result.Count;
            lblnot8.Text = count1.ToString();
            var result1 = dt.AsEnumerable().Where(row => row.Field<string>("Estado") == "No Autorizado").AsDataView();
            count2 = result1.Count;
            Label1.Text = count2.ToString();
            r1.DataSource = result;
            r1.DataBind();
        }
        protected void txtbuscar_TextChanged(object sender, EventArgs e)
        {
            if (txtbuscar.Text != "")
            {
                var codigoBus = new Modelo.EntidadChip();
                codigoBus.Codigo = int.Parse(txtbuscar.Text);
                DataTable dt = mapeo.MostrarUnChipCodigo(codigoBus);
                r1.DataSource = dt;
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
            DataTable dt = mapeo.MostrarChipTabla();
            var result = dt.AsEnumerable().Where(myRow => myRow.Field<string>("Estado") == ddestado.Text).AsDataView();
            r1.DataSource = result;
            r1.DataBind();
        }

    }
}