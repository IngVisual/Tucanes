using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace IngenieriaVisualPH.Administracion
{
    public partial class Formulario_web14 : System.Web.UI.Page
    {
        Datos.MapeoSolicitudes mapeo = new Datos.MapeoSolicitudes();
        Modelo.EntidadesPQR pqr = new Modelo.EntidadesPQR();
        Datos.MapeoCorreo mapeoCorreo = new Datos.MapeoCorreo();
        private  int id;
        private string conjunto;
        private string Asunto = "Respuesta de PQR", Leido="no";
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
            pqr.IdPQR = id;
            DataTable dt = mapeo.MostrarPQRIndvID(pqr);
            foreach (DataRow dr in dt.Rows)
            {
                txtcodigo.Text = dr["Codigo"].ToString();
                lblfecha.Text = dr["FechaRespuesta"].ToString();
                txtfecha1.Text= dr["FechaInicio"].ToString();
                ddestado.Text = dr["Estado"].ToString();
                txtobs.Text = dr["DescripcionPQR"].ToString();
                txtres.Text = dr["Respuesta"].ToString();
                txtced.Text = dr["Tipo"].ToString();
                txtnom.Text = dr["Nombre"].ToString();
                txtcodigo1.Text = dr["Codigo1"].ToString();
            }
            lblllaate.Text = txtcodigo1.Text;
            r1.DataSource = dt;
            r1.DataBind();
            LlamdosAtencion(dt);
        }
        public void LlamdosAtencion(DataTable dt)
        {
            string cadena = txtcodigo1.Text;
            if(cadena.Length>5)
            {
                tabLla.Style.Add("display", "none");
            }
            else
            {
                pqr.Codigo1 = txtcodigo1.Text;
                DataTable dt1 = mapeo.MostrarPQRLLamado(pqr);
                tabLla.Style.Add("display", "block");
                r2.DataSource = dt1;
                r2.DataBind();
            }
        }

        protected void btnactualizar_Click(object sender, EventArgs e)
        {
            var fecha = DateTime.Now.ToString();
            if (ddestado.Text != "" && txtres.Text != "" && txtobs.Text != "")
            {
               var idcorreo = mapeoCorreo.ObtenerIdMaxCorreo();
               pqr.IdPQR = id;
               pqr.FechaRespuesta = fecha;
               pqr.Estado = ddestado.Text;
               pqr.Codigo1 = txtcodigo1.Text;
               pqr.Respuesta = txtres.Text;
               pqr.IdCorreo = idcorreo;
               pqr.DescripcionPQR = txtobs.Text;
               mapeo.ActualizarPQR(pqr);
               mapeoCorreo.GuardarInfoCorreo(Asunto, Leido, Convert.ToDateTime(fecha), int.Parse(txtcodigo.Text));
               EnviarPush();
               EnviarPushQueja();
               BuscarEmail();           
               if(lblemail1.Text!="")
                {
                    string asunto = "Respuesta de PQR";
                    string mensaje1 = "Tiene una respuesta de PQR en la aplicación de su Conjunto Residencial. <a style='color:#138496;' href=\"https://conjuntoid012.somee.com/Login.aspx?ReturnUrl=%2fPropietario%2fHome.aspx\"><u><strong>Link de la Aplicacion</strong></u></a>";
                    Servicios.Email email1 = new Servicios.Email(lblemail1.Text, txtcodigo.Text, mensaje1, asunto, conjunto);
                }
                if (lblemail2.Text != "")
                {
                    string asunto1 = "Asunto llamado de Atencion";
                    string mensaje2 = "Tiene un llamado de atención en la aplicación de su Conjunto Residencial. <a style='color:#138496;' href=\"https://conjuntoid012.somee.com/Login.aspx?ReturnUrl=%2fPropietario%2fHome.aspx\"><u><strong>Link de la Aplicacion</strong></u></a>";
                    Servicios.Email email2 = new Servicios.Email(lblemail2.Text, txtcodigo1.Text, mensaje2, asunto1, conjunto);
                }
                Response.Redirect("TramitePQR.aspx");
            }
            else
            {
                error.Style.Add("display", "block");
            }
        }

        protected void btneliminar_Click(object sender, EventArgs e)
        {
            pqr.IdPQR = id;
            mapeo.ElimnarPQR(pqr);
            Response.Redirect("TramitePQR.aspx");
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
            string cadena2 = txtcodigo1.Text;
            if (cadena2.Length <= 5)
            {
                var usuario1 = new Modelo.EntidadUsuario();
                usuario1.Codigo = int.Parse(txtcodigo1.Text);
                DataTable dt2 = mapeo.LeerUsuario(usuario1);
                foreach (DataRow item in dt2.Rows)
                {
                    lblemail2.Text = item["Email"].ToString();
                }
            }
        }

        private string strpush;
        public void EnviarPush()
        {          
            string Msm = " Tiene Respuesta del PQR";
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
        private string strpush1;
        public void EnviarPushQueja()
        {
            string cadena3 = txtcodigo1.Text;
            if (cadena3.Length <= 5)
            { 
            string Msm = " Tiene una queja por CONVIVENCIA";
            Datos.MapeoPush push = new Datos.MapeoPush();
            Modelo.EntidadPush usupush = new Modelo.EntidadPush();
            usupush.Codigo = int.Parse(txtcodigo1.Text);
            DataTable dt = push.MostrarPushCodigo(usupush);
            foreach (DataRow item in dt.Rows)
            {
                strpush1 = item["Push"].ToString();
                Servicios.Push SendPush = new Servicios.Push(txtcodigo1.Text, strpush, Msm);
            }
            }
        }
    }
}