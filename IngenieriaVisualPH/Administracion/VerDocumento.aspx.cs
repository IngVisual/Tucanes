using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace IngenieriaVisualPH.Administracion
{
    public partial class Formulario_web18 : System.Web.UI.Page
    {
        Datos.MapeoParqueadero mapeo = new Datos.MapeoParqueadero();
        Modelo.EntidadParqueadero usuario = new Modelo.EntidadParqueadero();
        Datos.MapeoCorreo mapeoCorreo = new Datos.MapeoCorreo();
        private int id;
        private string conjunto;
        private string Asunto = "Respuesta de Parqueadero", Leido = "no";
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
            DataTable dt = mapeo.MostrarUnSolPaqrID(usuario);
            foreach (DataRow dr in dt.Rows)
            {
                txtcodigo.Text = dr["Codigo"].ToString();
                lblfecha.Text = dr["FechaRespuesta"].ToString();
                txtfecha1.Text = dr["Fecha"].ToString();
                ddestado.Text = dr["Estado"].ToString();
                txtdest.Text = dr["Destino"].ToString();
                txtmoto.Text = dr["PlacaMoto"].ToString();
                txtcarro.Text = dr["PlacaCarro"].ToString();
                txtcarmot.Text = dr["PLacaCarroMoto"].ToString();
                txtobs.Text = dr["Color"].ToString();
                txttp.Text = dr["TP"].ToString();
                lblnombre2.Text = dr["Destino"].ToString();
                txtres.Text = dr["Respuesta"].ToString();
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
                lblmsm.Text = item["ContratoParqueadero"].ToString();
            }
        }
        protected void btnactualizar_Click(object sender, EventArgs e)
        {
            var fecha = DateTime.Now.ToString();
            if (ddestado.Text != "" && txtres.Text != "" && txtobs.Text != "")
            {
                var idcorreo = mapeoCorreo.ObtenerIdMaxCorreo();
                usuario.Id = id;
                usuario.FechaRespuesta= fecha;
                usuario.Estado = ddestado.Text;
                usuario.Respuesta = txtres.Text;
                usuario.IdCorreo = idcorreo;
                mapeo.ActualizarSolPar(usuario);
                mapeoCorreo.GuardarInfoCorreo(Asunto, Leido, Convert.ToDateTime(fecha),int.Parse(txtcodigo.Text));
                EnviarPush();
                BuscarEmail();
                if (lblemail1.Text != "")
                {
                    string asunto = "Respuesta SOLICITUD DE PARQUEADERO";
                    string mensaje1 = "Tiene una respuesta de Parqueadero en la aplicación de su Conjunto Residencial. <a style='color:#138496;' href=\"https://conjuntoid012.somee.com/Login.aspx?ReturnUrl=%2fPropietario%2fHome.aspx\"><u><strong>Link de la Aplicacion</strong></u></a>";
                    Servicios.Email email1 = new Servicios.Email(lblemail1.Text, txtcodigo.Text, mensaje1, asunto, conjunto);
                }
                Response.Redirect("Documentos_Recibidos.aspx");
            }
            else
            {
                error.Style.Add("display", "block");
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
        protected void btneliminar_Click(object sender, EventArgs e)
        {
            usuario.Id = id;
            mapeo.EliminarSolPar(usuario);
            Response.Redirect("Documentos_Recibidos.aspx");
        }

        private string strpush;
        public void EnviarPush()
        {
            string Msm = " Tiene Respuesta de Parqueadero";
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