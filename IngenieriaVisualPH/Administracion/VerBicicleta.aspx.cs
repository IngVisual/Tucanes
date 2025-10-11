using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IngenieriaVisualPH.Administracion
{
    public partial class Formulario_web153 : System.Web.UI.Page
    {
        Datos.MapeoRegistros mapeo = new Datos.MapeoRegistros();
        Modelo.EntidadBicicleta usuario = new Modelo.EntidadBicicleta();
        Datos.MapeoCorreo mapeoCorreo = new Datos.MapeoCorreo();
        private int id;
        private string conjunto;
        private string Asunto = "Respuesta de Bicicletero", Leido = "no";
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
            DataTable dt = mapeo.MostrarUnSolbiciID(usuario);
            foreach (DataRow dr in dt.Rows)
            {
                txtcodigo.Text = dr["Codigo"].ToString();
                var fechares = dr["FechaRespuesta"].ToString();
                if (fechares == "")
                { lblfecha.Text = dr["FechaRespuesta"].ToString(); }
                else
                {
                    var fecharespuesta = Convert.ToDateTime(dr["FechaRespuesta"].ToString());
                    lblfecha.Text = Convert.ToString(fecharespuesta.ToString("dd/MM/yyyy"));
                }
                var fechasol = Convert.ToDateTime(dr["Fecha"].ToString());
                txtfecha1.Text = Convert.ToString(fechasol.ToString("dd/MM/yyyy"));
                ddestado.Text = dr["Estado"].ToString();
                txtmarca.Text = dr["Marca"].ToString();
                txtcolor.Text = dr["Color"].ToString();
                txtnombre.Text = dr["Nombre"].ToString();
                txtpersona.Text = dr["Persona"].ToString();
                txtserie.Text = dr["Serie"].ToString();
                txttipocicla.Text = dr["Tipo"].ToString();
                txttiposolicitante.Text = dr["TipoSolicitante"].ToString();
                txtnumeroparq.Text = dr["ObservacionAdm"].ToString();
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
            txtsaldo.Text = saldoTotal;
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
                lblmsm.Text = item["ContratoBicicletero"].ToString();
            }
        }
        protected void btnactualizar_Click(object sender, EventArgs e)
        {
            var fecha = DateTime.Now.ToString();
            if (ddestado.Text != "" && txtres.Text != "")
            {
                var idcorreo = mapeoCorreo.ObtenerIdMaxCorreo();
                usuario.Id = id;
                usuario.FechaRespuesta = fecha;
                usuario.Estado = ddestado.Text;
                usuario.Respuesta = txtres.Text;
                usuario.ObservacionAdm = txtnumeroparq.Text;
                usuario.IdCorreo = idcorreo;
                mapeo.ActualizarSolbici(usuario);
                mapeoCorreo.GuardarInfoCorreo(Asunto, Leido, Convert.ToDateTime(fecha), int.Parse(txtcodigo.Text));
                EnviarPush();
                BuscarEmail();
                if (lblemail1.Text != "")
                {
                    string asunto = "Respuesta SOLICITUD DE BICICLETERO";
                    string mensaje1 = "Tiene una respuesta de Bicicletero en la aplicacion de su Conjunto Residencial. <a style='color:#138496;' href=\"https://conjuntoid012.somee.com/Login.aspx?ReturnUrl=%2fPropietario%2fHome.aspx\"><u><strong>Link de la Aplicacion</strong></u></a>";
                    Servicios.Email email1 = new Servicios.Email(lblemail1.Text, txtcodigo.Text, mensaje1, asunto, conjunto);
                }
                Response.Redirect("AdmBici.aspx");
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
            //usuario.Id = id;
            //mapeo.EliminarSolPar(usuario);
            //Response.Redirect("Documentos_Recibidos.aspx");
        }

        private string strpush;
        public void EnviarPush()
        {
            string Msm = " Tiene Respuesta de Bicicletero";
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