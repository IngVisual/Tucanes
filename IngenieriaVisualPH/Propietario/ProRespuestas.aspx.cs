using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace IngenieriaVisualPH.Propietario
{
    public partial class Formulario_web125 : System.Web.UI.Page
    {
        Datos.MapeoSolicitudes mapeo = new Datos.MapeoSolicitudes();
        Modelo.EntidadesPQR usuario = new Modelo.EntidadesPQR();
        int id;
        string codigo;
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
            usuario.IdPQR = id;
            DataTable dt = mapeo.MostrarPQRIndividual(usuario);
            foreach (DataRow dr in dt.Rows)
            {
                lblfechres.Text = dr["FechaRespuesta"].ToString();
                lblfecini.Text = dr["FechaInicio"].ToString();
                lblestado.Text = dr["Estado"].ToString();
                lbldescri.Text = dr["DescripcionPQR"].ToString();
                lblresp.Text = dr["Respuesta"].ToString();
                lbltipo.Text = dr["Tipo"].ToString();
                lblqueja.Text = dr["Codigo1"].ToString();
            }
            r1.DataSource = dt;
            r1.DataBind();
        }
    }
}