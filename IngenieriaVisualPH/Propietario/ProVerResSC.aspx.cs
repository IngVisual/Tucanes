using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace IngenieriaVisualPH.Propietario
{
    public partial class Formulario_web144 : System.Web.UI.Page
    {
        Datos.MapeoSC mapeo = new Datos.MapeoSC();
        Modelo.EntidadSC usuario = new Modelo.EntidadSC();
        Modelo.EntidadContrato contrato = new Modelo.EntidadContrato();
        Datos.MapeoContrato mapeocont = new Datos.MapeoContrato();
        private int id;
        string codigo;
        DateTime fecha = new DateTime();
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
            DataTable dt = mapeo.MostrarUnSC(usuario);

            foreach (DataRow dr in dt.Rows)
            {
                lblestado.Text = dr["Estado"].ToString();
                lblfecini.Text = dr["FechaSol"].ToString();
                lblfechasol.Text = dr["FechaSol"].ToString();
                lblresp.Text = dr["Respuesta"].ToString();
                lblfechres.Text = dr["FechaRes"].ToString();
                fecha = (dr["Fecha"] != DBNull.Value) ? Convert.ToDateTime(dr["Fecha"].ToString()) : DateTime.MinValue;
                lblobserv.Text = dr["Observacion"].ToString();
                lblfechapag.Text = dr["FechaPago"].ToString();
                lblnombre.Text = dr["Nombre"].ToString();
                lblnombre2.Text = dr["Nombre"].ToString();
                lbltipo.Text = dr["Tipo"].ToString();
                lblcedula.Text = dr["Cedula"].ToString();
                lbltiposc.Text = dr["SalCom"].ToString();
                lblnove.Text = dr["ObservacionAdm"].ToString();
            }
                lblfeceven.Text = fecha.ToString("MM/dd/yyyy");
                r1.DataSource = dt;
                r1.DataBind();
                if(lblestado.Text=="Reservado")
                {
                politica.Style.Add("display","none");
                imagen.Style.Add("display", "none");
            }
            PoliticaMudanza();
           
        }
        public void PoliticaMudanza()
        {
            int IdContrato = 1;
            contrato.IdContrato = IdContrato;
            DataTable dt = mapeocont.MostrarContrato(contrato);
            foreach (DataRow item in dt.Rows)
            {
                lblmsm.Text = item["ContratoSC"].ToString();
            }
        }
    }
}