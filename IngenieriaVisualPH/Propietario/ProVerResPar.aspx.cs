using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


namespace IngenieriaVisualPH.Propietario
{
    public partial class Formulario_web128 : System.Web.UI.Page
    {
        Datos.MapeoParqueadero mapeo = new Datos.MapeoParqueadero();
        Modelo.EntidadParqueadero usuario = new Modelo.EntidadParqueadero();
        Modelo.EntidadContrato contrato = new Modelo.EntidadContrato();
        Datos.MapeoContrato mapeocont = new Datos.MapeoContrato();
        private int id;
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
            usuario.Id = id;
            DataTable dt = mapeo.MostrarUnaSolParqueaderos(usuario);
            foreach (DataRow dr in dt.Rows)
            {
                lblfechres.Text = dr["FechaRespuesta"].ToString();
                lblfecini.Text = dr["Fecha"].ToString();
                lblestado.Text = dr["Estado"].ToString();
                lblresp.Text = dr["Respuesta"].ToString();
                lblcarmot.Text = dr["PLacaCarroMoto"].ToString();
                lblplacacarro.Text = dr["PlacaCarro"].ToString();
                lblplacamoto.Text = dr["PlacaMoto"].ToString();
                lbltp.Text = dr["TP"].ToString();
                lbldetino.Text = dr["Destino"].ToString();
                lblcolor.Text = dr["Color"].ToString();
                lblnombre2.Text = dr["Destino"].ToString();
            }
            if(lblestado.Text!="Solicitud")
            {
                cedula.Style.Add("display","none");
            }
            r1.DataSource = dt;
            r1.DataBind();
            PoliticaMudanza();
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            EliminarSol();
        }

        public void EliminarSol()
        {
            usuario.Id = id;
            mapeo.EliminarSolPar(usuario);
            Response.Redirect("ProTabResPar.aspx");
        }
        public void PoliticaMudanza()
        {
            int IdContrato = 1;
            contrato.IdContrato = IdContrato;
            DataTable dt = mapeocont.MostrarContrato(contrato);
            foreach (DataRow item in dt.Rows)
            {
                lblmsm.Text = item["ContratoParqueadero"].ToString();
            }
        }
    }
}