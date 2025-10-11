using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IngenieriaVisualPH.Propietario
{
    public partial class Formulario_web167 : System.Web.UI.Page
    {
        Datos.MapeoRegistros mapeo = new Datos.MapeoRegistros();
        Modelo.EntidadBicicleta usuario = new Modelo.EntidadBicicleta();
        Datos.MapeoContrato mapeocont = new Datos.MapeoContrato();
        Modelo.EntidadContrato contrato = new Modelo.EntidadContrato();
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
            DataTable dt = mapeo.Mostrar_UnaSolBici(usuario);
            foreach (DataRow dr in dt.Rows)
            {
                lblmarca.Text = dr["Marca"].ToString();
                lblcolor.Text = dr["Color"].ToString();
                lbltipocicla.Text = dr["Tipo"].ToString();
                lbltipopersona.Text = dr["Persona"].ToString();
                lblfecini.Text = dr["Fecha"].ToString();
                lblestado.Text = dr["Estado"].ToString();
                lbltiposolicitante.Text = dr["TipoSolicitante"].ToString();
                lblserie.Text = dr["Serie"].ToString();
                lblnombre.Text = dr["Nombre"].ToString();
                lblresp.Text = dr["Respuesta"].ToString();
                lblfechres.Text = dr["FechaRespuesta"].ToString();
                lblobseradmin.Text = dr["ObservacionAdm"].ToString();
            }
            if (lblestado.Text != "Solicitud")
            {
                cedula.Style.Add("display", "none");
            }
            r1.DataSource = dt;
            r1.DataBind();
            PoliticaBicicletero();
        }
        public void PoliticaBicicletero()
        {
            int IdContrato = 1;
            contrato.IdContrato = IdContrato;
            DataTable dt = mapeocont.MostrarContrato(contrato);
            foreach (DataRow item in dt.Rows)
            {
                lblmsg.Text = item["ContratoBicicletero"].ToString();
            }
        }
    }
}