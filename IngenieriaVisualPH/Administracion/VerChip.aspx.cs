using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace IngenieriaVisualPH.Administracion
{
    public partial class Formulario_web119 : System.Web.UI.Page
    {
        Datos.MapeoChip mapeo = new Datos.MapeoChip();
        Modelo.EntidadChip usuario = new Modelo.EntidadChip();
        Datos.MapeoCorreo mapeoCorreo = new Datos.MapeoCorreo();
        private int id;
        private string conjunto;
        private string Asunto = "Respuesta Solicitud de Chip", Leido = "no";
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
            DataTable dt = mapeo.MostrarUnChipID(usuario);
            foreach (DataRow dr in dt.Rows)
            {
                txtcodigo.Text = dr["Codigo"].ToString();
                lblfecha.Text = dr["FechaRes"].ToString();
                txtfecha1.Text = dr["Fecha"].ToString();
                ddestado.Text = dr["Estado"].ToString();
                txtres.Text = dr["Respuesta"].ToString();
                txttipo.Text = dr["Tipo"].ToString();
                txtdest.Text = dr["Destinado"].ToString();
                txtnomb.Text = dr["Nombre"].ToString();
                txtcedu.Text = dr["Documento"].ToString();
                txtobs.Text = dr["Perdida"].ToString();
                lblnuevo.Text = dr["Nuevo"].ToString();
            }
            r1.DataSource = dt;
            r1.DataBind();
            MostrarSaldo();
        }
        public void MostrarSaldo()
        {
            var saldo1 = new LogicaNeg.CSaldos();
            string saldoTotal = saldo1.BuscarSaldo(int.Parse(txtcodigo.Text));
            txtsaldo.Text = saldoTotal;
        }
        protected void btnactualizar_Click(object sender, EventArgs e)
        {
            var fecha = DateTime.Now.ToString();
            if (ddestado.Text != "" && txtres.Text != "")
            {
                var idcorreo = mapeoCorreo.ObtenerIdMaxCorreo();
                usuario._Id = id;
                usuario._FechaRes = fecha;
                usuario.Estado = ddestado.Text;
                usuario._Respuesta = txtres.Text;
                usuario._IdCorreo = idcorreo;
                mapeo.ActualizarChip(usuario);
                mapeoCorreo.GuardarInfoCorreo(Asunto, Leido, Convert.ToDateTime(fecha),int.Parse(txtcodigo.Text));
                EnviarPush();
                BuscarEmail();
                if (lblemail1.Text != "")
                {
                    string asunto = "Respuesta SOLICITUD DE CHIPS";
                    string mensaje1 = "Descripcion de la solicitud: <br/><br/>" + " Observacion de Administracion: " +ddestado.Text+ " " + txtres.Text + "";
                    Servicios.Email email1 = new Servicios.Email(lblemail1.Text, txtcodigo.Text, mensaje1, asunto, conjunto);
                }
                Response.Redirect("AdmChip.aspx");
            }
            else
            {
                error.Style.Add("display", "block");
            }
        }

        protected void btneliminar_Click(object sender, EventArgs e)
        {
            usuario._Id = id;
            mapeo.EliminarChip(usuario);
            Response.Redirect("AdmChip.aspx");
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
            string Msm = " Tiene Respuesta de su Chip";
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