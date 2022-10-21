using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace IngenieriaVisualPH.Propietario
{
    public partial class Formulario_web115 : System.Web.UI.Page
    {
        Datos.MapeoSaldos mapeo = new Datos.MapeoSaldos();
        Datos.MapeoOtrosPagos mapeo2 = new Datos.MapeoOtrosPagos();
        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable dt = mapeo.MostrarObserSaldo();
            r1.DataSource = dt;
            r1.DataBind();

            DataTable dt1 = mapeo.MostrarValorAdm();
            r2.DataSource = dt1;
            r2.DataBind();

            DataTable dt3 = mapeo2.MostrarvalorParq();
            r3.DataSource = dt3;
            r3.DataBind();

            DataTable dt4 = mapeo2.MostrarvalorSC();
            r4.DataSource = dt4;
            r4.DataBind();

            DataTable dt5 = mapeo2.MostrarvalorChip();
            r5.DataSource = dt5;
            r5.DataBind();
        }
    }
}