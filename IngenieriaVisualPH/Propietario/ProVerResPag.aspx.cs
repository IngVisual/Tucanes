using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Net;

namespace IngenieriaVisualPH.Propietario
{
    public partial class Formulario_web120 : System.Web.UI.Page
    {
        Datos.MapeoSolicitudes mapeo = new Datos.MapeoSolicitudes();
        Modelo.EntidadesNovedadSaldo usuario = new Modelo.EntidadesNovedadSaldo();
        private int id;
        private string codigo;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                 codigo = Session["cod"].ToString();
            }
            catch (Exception)
            {
                throw new Exception("Tiempo de sesion finalizado, por favor ingrese nuevamente a la app");
            }
            id = Convert.ToInt32(Request.QueryString["Id"].ToString());
            if (IsPostBack) return;
            usuario.Codigo = int.Parse(codigo);
            usuario.IdNov = id;
            DataTable dt = mapeo.MostrarNovSaldoIndividual(usuario);
            foreach (DataRow dr in dt.Rows)
            {
                lblfechres.Text = dr["FechaRes"].ToString();
                lblfecini.Text = dr["Fecha"].ToString();
                lblestado.Text = dr["Estado"].ToString();
                lbldescri.Text = dr["Observaciones"].ToString();
                lblresp.Text = dr["Respuesta"].ToString();
            }
            r1.DataSource = dt;
            r1.DataBind();
            usuario.IdNov = id;
            DataTable dt1= mapeo.MostrarNovSaldoPDF(usuario);
            if (dt1.Rows.Count > 0)
            {
                r2.Visible = true;
                r2.DataSource = dt1;
                r2.DataBind();
            }
        }

        public void EliminarSol()
        {
            usuario.IdNov = id;
        }

        
    }
}