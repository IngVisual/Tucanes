using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace IngenieriaVisualPH.Propietario
{
    public partial class Formulario_web147 : System.Web.UI.Page
    {
        Datos.MapeoChip mapeo = new Datos.MapeoChip();
        Modelo.EntidadChip usuario = new Modelo.EntidadChip();
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
            usuario._Id = id;
            DataTable dt = mapeo.MostrarUnChip(usuario);

            foreach (DataRow dr in dt.Rows)
            {
                lblestado.Text = dr["Estado"].ToString();
                lblfecini.Text = dr["Fecha"].ToString();
                lblresp.Text = dr["Respuesta"].ToString();
                lblfechres.Text = dr["FechaRes"].ToString();
                lblnombre.Text = dr["Nombre"].ToString();
                lbldocumento.Text = dr["Documento"].ToString();
                lblresid.Text = dr["Destinado"].ToString();
                lbltipo.Text = dr["Tipo"].ToString();
                lblcompra.Text = dr["Nuevo"].ToString();
            }
            r1.DataSource = dt;
            r1.DataBind();

           
        }
    }
}