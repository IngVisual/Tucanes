using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;
using System.Net;

namespace IngenieriaVisualPH.Propietario
{

    public partial class Formulario_web132 : System.Web.UI.Page
    {
        Datos.MapeoMudanzas mapeo = new Datos.MapeoMudanzas();
        Modelo.EntidadMudanzas usuario = new Modelo.EntidadMudanzas();
        Modelo.EntidadContrato contrato = new Modelo.EntidadContrato();
        Datos.MapeoContrato mapeocont = new Datos.MapeoContrato();
        private int id;
        string codigo;
        private string rutaPDF;

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
            DataTable dt = mapeo.MostrarUnaMudanza(usuario);

                foreach (DataRow dr in dt.Rows)
                {
                lblfechres.Text = dr["FechaRes"].ToString();
                lblfecini.Text = dr["FechaSol"].ToString();
                lblestado.Text = dr["Estado"].ToString();
                lblresp.Text = dr["Respuesta"].ToString();
                lblfeini.Text = dr["FechaIniMud"].ToString();
                lblfefin.Text = dr["FechaFinMud"].ToString();
                lblpeenca.Text = dr["Encargado"].ToString();
                lblnove.Text = dr["ObservacionAdm"].ToString();
                lblobse.Text = dr["Observacion"].ToString();
                lbltipo.Text = dr["Tipo"].ToString();
                lblusuario.Text = dr["Autorizado"].ToString();
            }
            usuario.Id = id;

            if (lbltipo.Text == "IngresoMudanzaCompleta")
            { bttnpdf.Visible = true; }
            else
            { bttnpdf.Visible = false; }
            if (lblestado.Text == "Autorizado" || lblestado.Text == "Finalizado")
            {
                error.Style.Add("display", "block");
                r1.Visible = false;
            }
            else if (lblestado.Text == "Novedad")
            {
                error1.Style.Add("display", "block");
                r1.Visible = false;
            }
            else
            {
                r1.DataSource = dt;
                r1.DataBind();
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
                lblmsm.Text = item["ContratoMudanza"].ToString();
            }
        }
        protected void bttnpdf_Click(object sender, EventArgs e)
        {
            usuario.Codigo = int.Parse(codigo);
            usuario.Id = id;
            DataTable dt = mapeo.MostrarUnaMudanza(usuario);
            foreach (DataRow dr in dt.Rows)
            {
                lblfechres.Text = dr["FechaRes"].ToString();
                rutaPDF = dr["DocumentoPDF"].ToString();
                lbltipo.Text = dr["Tipo"].ToString();
            }
            string FilePath = Server.MapPath("../Mudanzas/DocumentoPDF/"+rutaPDF);
            if (rutaPDF.ToString() != "")
            {
                WebClient User = new WebClient();
                Byte[] FileBuffer = User.DownloadData(FilePath);
                if (FileBuffer != null)
                {
                    Response.ContentType = "application/pdf";
                    Response.AddHeader("content-length", FileBuffer.Length.ToString());
                    Response.BinaryWrite(FileBuffer);
                }
            }           
        }

    }
}