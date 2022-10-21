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
    public partial class Formulario_web112 : System.Web.UI.Page
    {
        Datos.MapeoSC mapeo = new Datos.MapeoSC();
        Modelo.EntidadSC usuario = new Modelo.EntidadSC();
        Datos.MapeoCorreo mapeoCorreo = new Datos.MapeoCorreo();
        private int id;
        private string conjunto;
        private string Asunto = "Respuesta de Salon Comunal", Leido = "no";
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
            usuario._Id = id;
            DataTable dt = mapeo.MostrarUnSCID(usuario);
            foreach (DataRow dr in dt.Rows)
            {
                txtcodigo.Text = dr["Codigo"].ToString();
                txtres.Text = dr["Respuesta"].ToString();
                lblfecha.Text = dr["FechaRes"].ToString();
                txtfeceven.Text = dr["Fecha"].ToString();
                txtfecpago.Text = dr["FechaPago"].ToString();
                txtfecha1.Text = dr["FechaSol"].ToString();
                txtnombre.Text = dr["Nombre"].ToString();
                txtced.Text = dr["Cedula"].ToString();
                lblpropi.Text = dr["Tipo"].ToString();
                txtnov.Text = dr["ObservacionAdm"].ToString();
                txtsc.Text = dr["SalCom"].ToString();
                txtval.Text = dr["ValorSC"].ToString();
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
                lblmsm.Text = item["ContratoSC"].ToString();
            }
        }
        protected void btnactualizar_Click(object sender, EventArgs e)
        {
            var fecha = DateTime.Now.ToString();
            if (ddestado.Text != "" && txtres.Text != "" && txtnombre.Text != "" && txtced.Text.Trim() != "")
            {
                var idcorreo = mapeoCorreo.ObtenerIdMaxCorreo();
                usuario._Id = id;
                usuario._FechaRes = fecha;
                usuario.Estado = ddestado.Text;
                usuario._Respuesta = txtres.Text;
                usuario._ObservacionAdm = txtnov.Text;
                usuario._Nombre = txtnombre.Text;
                usuario._Cedula = txtced.Text.Trim();
                usuario._IdCorreo = idcorreo;
                mapeo.ActualizarSC(usuario);
                mapeoCorreo.GuardarInfoCorreo(Asunto, Leido, Convert.ToDateTime(fecha),int.Parse(txtcodigo.Text));
                EnviarPush();
                BuscarEmail();
                if (lblemail1.Text != "")
                {
                    string asunto = "Respuesta SOLICITUD DE SALON COMUNAL";
                    string mensaje1 = "Descripcion de la solicitud: " + txtsc.Text + "<br/><br/>" + " Observacion de Administracion: " + txtres.Text + "";
                    Servicios.Email email1 = new Servicios.Email(lblemail1.Text, txtcodigo.Text, mensaje1, asunto, conjunto);
                }
                Response.Redirect("SalonComunal.aspx");
            }
            else
            {
                error.Style.Add("display", "block");
            }
        }

        protected void btneliminar_Click(object sender, EventArgs e)
        {
            usuario._Id = id;
            mapeo.EliminarSalCom(usuario);
            Response.Redirect("SalonComunal.aspx");
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
            string Msm = " Tiene Respuesta de Salon Comunal";
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