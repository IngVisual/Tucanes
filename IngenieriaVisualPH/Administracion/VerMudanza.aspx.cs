using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Net;

namespace IngenieriaVisualPH.Administracion
{
    public partial class Formulario_web110 : System.Web.UI.Page
    {

        // clases o dll que se instacian un objeto 
        Datos.MapeoMudanzas mapeo = new Datos.MapeoMudanzas();
        Modelo.EntidadMudanzas usuario = new Modelo.EntidadMudanzas();
        Datos.MapeoCorreo mapeoCorreo = new Datos.MapeoCorreo();


        private int id;
        private string conjunto;
        private string Asunto = "Respuesta de Mudanza, Articulos o Adeacuaciones", Leido = "no";
        protected void Page_Load(object sender, EventArgs e)
        {        
            try
            {
                conjunto = Session["conj"].ToString();
            }
            catch (Exception)
            {
                throw new Exception("Tiempo de sesion finalizado, por favor ingrese nuevamente a la app");
            }


            id = Convert.ToInt32(Request.QueryString["Id"].ToString());
            if (IsPostBack) return;

            usuario.Id = id;
            DataTable dt = mapeo.MostrarUnaMudanzaID(usuario);

            foreach (DataRow dr in dt.Rows)
            {
                txtcodigo.Text = dr["Codigo"].ToString();
                lblfecha.Text = dr["FechaRes"].ToString();
                txtfecha1.Text = dr["FechaSol"].ToString();
                ddestado.Text = dr["Estado"].ToString();
                txtnov.Text = dr["ObservacionAdm"].ToString();
                txtfechini.Text = dr["FechaIniMud"].ToString();
                txtfechfin.Text = dr["FechaFinMud"].ToString();
                txtprop.Text = dr["Autorizado"].ToString();
                txtenca.Text = dr["Encargado"].ToString();
                txtobs.Text = dr["Observacion"].ToString();
                txtres.Text = dr["Respuesta"].ToString();
                lblnombre2.Text = dr["Autorizado"].ToString();
                txttp.Text = dr["Tipo"].ToString();

            }
            r1.DataSource = dt;
            r1.DataBind();
            MostrarSaldo();
            PoliticaMudanza();
        }
        public void MostrarSaldo()
        {
            var saldo1 = new LogicaNeg.CSaldos();
            string saldoTotal = saldo1.BuscarSaldo(int.Parse(txtcodigo.Text));
            txtnom.Text = saldoTotal;
        }
        public void PoliticaMudanza()
        {
            Modelo.EntidadContrato contrato = new Modelo.EntidadContrato();
            Datos.MapeoContrato mapeocont = new Datos.MapeoContrato();
            int IdContrato = 1;
            contrato.IdContrato = IdContrato;
            DataTable dt = mapeocont.MostrarContrato(contrato);
            foreach (DataRow item in dt.Rows)
            {
                lblmsm.Text = item["ContratoMudanza"].ToString();
            }
        }
        protected void btnactualizar_Click(object sender, EventArgs e)
        {
            var fecha = DateTime.Now.ToString();
            if (ddestado.Text != "" && txtres.Text != "" && txtobs.Text != "")
            {
                var idcorreo = mapeoCorreo.ObtenerIdMaxCorreo();
                usuario.Id = id;
                usuario.FechaRes = fecha;
                usuario.Estado = ddestado.Text;
                usuario.Respuesta = txtres.Text;
                usuario.ObservacionAdm = txtnov.Text;
                usuario.IdCorreo = idcorreo;
                mapeo.ActualizarSolMud(usuario);
                mapeoCorreo.GuardarInfoCorreo(Asunto, Leido, Convert.ToDateTime(fecha), int.Parse(txtcodigo.Text));
                EnviarPush();
                BuscarEmail();
                if (lblemail1.Text != "")
                {
                    string asunto = "Respuesta SOLICITUD DE MUDANZA, ARTICULOS O ADECUACIONES";
                    string mensaje1 = "Tiene una respuesta de Mudanza o Adecuaciones en la aplicación de su Conjunto Residencial. <a style='color:#138496;' href=\"https://conjuntoid012.somee.com/Login.aspx?ReturnUrl=%2fPropietario%2fHome.aspx\"><u><strong>Link de la Aplicacion</strong></u></a>";
                    Servicios.Email email1 = new Servicios.Email(lblemail1.Text, txtcodigo.Text, mensaje1, asunto, conjunto);
                }
                Response.Redirect("AutorizacionTrasteo.aspx");
            }
            else
            {
                error.Style.Add("display", "block");
            }
        }

        protected void btneliminar_Click(object sender, EventArgs e)
        {
            usuario.Id = id;
            mapeo.EliminarSolMud(usuario);
            Response.Redirect("AutorizacionTrasteo.aspx");
        }

        private string rutaPDF;
        protected void bttnpdf_Click(object sender, EventArgs e)
        {
            usuario.Codigo = int.Parse(txtcodigo.Text);
            usuario.Id = id;
            DataTable dt = mapeo.MostrarUnaMudanza(usuario);
            foreach (DataRow dr in dt.Rows)
            {
                lblfecha.Text = dr["FechaRes"].ToString();
                rutaPDF = dr["DocumentoPDF"].ToString();
                txttp.Text = dr["Tipo"].ToString();
            }
            string FilePath = Server.MapPath("../Mudanzas/DocumentoPDF/" + rutaPDF);
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
        public void BuscarEmail()
        {
            var mapeo = new Datos.MapeoUsuarios();
            var usuario = new Modelo.EntidadUsuario();
            usuario.Codigo = int.Parse(txtcodigo.Text);
            DataTable dt = mapeo.LeerUsuario(usuario);
            foreach (DataRow item in dt.Rows)
            {
                lblemail1.Text = item["Email"].ToString();
            }
        }

        private string strpush;
        public void EnviarPush()
        {
            string Msm = " Tiene Respuesta de Mudanza";
            Datos.MapeoPush push = new Datos.MapeoPush();
            Modelo.EntidadPush usupush = new Modelo.EntidadPush();
            usupush.Codigo = int.Parse(txtcodigo.Text);
            DataTable dt = push.MostrarPushCodigo(usupush);
            foreach (DataRow item in dt.Rows)
            {
                strpush = item["Push"].ToString();
                Servicios.Push SendPush = new Servicios.Push(txtcodigo.Text, strpush, Msm);
            }
        }
    }
}