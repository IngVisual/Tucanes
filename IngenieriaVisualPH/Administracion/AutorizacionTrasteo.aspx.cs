using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace IngenieriaVisualPH.Administracion
{
    public partial class Formulario_web19 : System.Web.UI.Page
    {
        Datos.MapeoMudanzas mapeo = new Datos.MapeoMudanzas();
        Modelo.EntidadMudanzas mudanzas = new Modelo.EntidadMudanzas();
        string estado = "Solicitud";
        string respuesta = "Pendiente";
        private int count1, count2;
        private string Strcodigo;
        protected void Page_Load(object sender, EventArgs e)
        {
            llamaTablaMud();
        }
        public void llamaTablaMud()
        {
            DataTable dt = mapeo.MostrarSolMudaTablaTipo();
            var result = dt.AsEnumerable().Where(myRow => myRow.Field<string>("Estado") == "Solicitud").AsDataView();
            count1 = result.Count;
            lblnot8.Text = count1.ToString();
            var result1 = dt.AsEnumerable().Where(myRow => myRow.Field<string>("Estado") == "Novedad").AsDataView();
            count2 = result1.Count;
            Label1.Text = count2.ToString();
            r1.DataSource = result;
            r1.DataBind();
        }
        protected void txtbuscar_TextChanged(object sender, EventArgs e)
        {
            if (txtbuscar.Text != "")
            {
                var codigoBus = new Modelo.EntidadMudanzas();
                codigoBus.Codigo = int.Parse(txtbuscar.Text);
                DataTable dt = mapeo.MostrarUnaMudanzaCodigoTipo(codigoBus);
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

        protected void btnenviardocuemnto_Click1(object sender, EventArgs e)
        {
            Strcodigo = ddltor.Text + ddapa.Text;

            if (Strcodigo != "TorreApartamento" && ddltor.Text != "Torre" && ddapa.Text != "Apartamento")
            {
                mudanzas.Codigo = int.Parse(Strcodigo);
                mudanzas.Estado = estado;
                mudanzas.Respuesta = respuesta;
                mudanzas.FechaIniMud = Convert.ToDateTime(txtfechaini.Text);
                mudanzas.FechaFinMud = Convert.ToDateTime(txtfechafin.Text);
                mudanzas.Autorizado = "Propietario";
                mudanzas.Cedula = txtcedula.Text;
                mudanzas.IdTipoMud = int.Parse(ddtipo.Text);
                mudanzas.Encargado = txtencargado.Text;
                mudanzas.Observacion = txtarticulos.Text;
                mapeo.GuardarMudanza(mudanzas);
                error2.Style.Add("display","none");
                error3.Style.Add("display", "block");
                txtarticulos.Text = "";
                txtcedula.Text = "";
                txtfechafin.Text = "";
                txtfechaini.Text = "";
                txtencargado.Text = "";
                ddapa.DataTextField = "Apartamento";
                ddltor.DataTextField = "Torre";
                llamaTablaMud();
            }
            else
            {
                error3.Style.Add("display", "none");
                error2.Style.Add("display", "block");
            }
        }

        protected void ddestado_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataTable dt = mapeo.MostrarSolMudaTablaTipo();
            var result = dt.AsEnumerable().Where(myRow => myRow.Field<string>("Estado") == ddestado.Text).AsDataView();
            r1.DataSource = result;
            r1.DataBind();
        }
    }
}