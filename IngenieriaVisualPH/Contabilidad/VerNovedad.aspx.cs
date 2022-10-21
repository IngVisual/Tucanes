using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;

namespace IngenieriaVisualPH.Contabilidad
{
    public partial class Formulario_web13 : System.Web.UI.Page
    {
        Datos.MapeoSolicitudes mapeo = new Datos.MapeoSolicitudes();
        Modelo.EntidadesNovedadSaldo usuario = new Modelo.EntidadesNovedadSaldo();
        Modelo.EntidadImagenes imag = new Modelo.EntidadImagenes();
        Datos.MapeoCorreo mapeoCorreo = new Datos.MapeoCorreo();
        private int id;
        private string conjunto;
        private string Asunto = "Respuesta Novedad de Saldo", Leido = "no";
        private bool errorpdf = false;
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
            usuario.IdNov = id;
            DataTable dt = mapeo.MostrarNovSaldoIndividualID(usuario);
            foreach (DataRow dr in dt.Rows)
            {
                txtcodigo.Text = dr["Codigo"].ToString();
                lblfecha.Text = dr["FechaRes"].ToString();
                txtfecha1.Text = dr["Fecha"].ToString();
                ddestado.Text = dr["Estado"].ToString();
                txtobs.Text = dr["Observaciones"].ToString();
                txtres.Text = dr["Respuesta"].ToString();
            }
            r1.DataSource = dt;
            r1.DataBind();
            MostrarSaldo();
        }
        public void MostrarSaldo()
        {
            var saldo1 = new LogicaNeg.CSaldos();
            string saldoTotal = saldo1.BuscarSaldo(int.Parse(txtcodigo.Text));
            txtnom.Text = saldoTotal;
        }
        protected void btnactualizar_Click(object sender, EventArgs e)
        {
            CargarImagen();
            if (errorpdf == false)
            {
                var fecha = DateTime.Now.ToString();
                if (ddestado.Text != "" && txtres.Text != "" && txtobs.Text != "")
                {
                    var idcorreo = mapeoCorreo.ObtenerIdMaxCorreo();
                    usuario.IdNov = id;
                    usuario.FechaRes = fecha;
                    usuario.Estado = ddestado.Text;
                    usuario.Respuesta = txtres.Text;
                    usuario.IdCorreo = idcorreo;
                    mapeo.ActualizarNovedad(usuario);
                    mapeoCorreo.GuardarInfoCorreo(Asunto, Leido, Convert.ToDateTime(fecha), int.Parse(txtcodigo.Text));

                    EnviarPush();
                    BuscarEmail();
                    if (lblemail1.Text != "")
                    {
                        string asunto = "Respuesta NOVEDAD DE SALDO";
                        string mensaje1 = "Descripcion: " + txtobs.Text + "<br/><br/>" + " Observacion de Administracion: " + txtres.Text + "";
                        Servicios.Email email1 = new Servicios.Email(lblemail1.Text, txtcodigo.Text, mensaje1, asunto, conjunto);
                    }
                    Response.Redirect("NovedadesSaldo.aspx");
                }
                else
                {
                    error.Style.Add("display", "block");
                }
            }
            else
            {
                error1.Style.Add("display", "block");
            }

        }
        protected void btneliminar_Click(object sender, EventArgs e)
        {
            usuario.IdNov = id;
            mapeo.ElimnarNovSaldo(usuario);
            Response.Redirect("NovedadesSaldo.aspx");
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
            string Msm = " Tiene Respuesta de Novedad de Saldo";
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
        public void CargarImagen()
        {
            if (f1.HasFile == true)
            {
                DateTime time = DateTime.Now;
                string fecha = time.ToString("dddd, dd MMMM yyyy ss");
                string targetPath1 = Server.MapPath("../Descarga/SoliRespuesta/");
                foreach (HttpPostedFile file in f1.PostedFiles)
                {

                    string filename = Path.GetFileName(file.FileName);
                    string fileExtension = Path.GetExtension(filename);
                    string filenameConct1 = Path.GetFileName(txtcodigo.Text + fecha + filename);
                    if (fileExtension.ToLower() == ".pdf")
                    {
                        f1.SaveAs(targetPath1 + filenameConct1);
                        imag.Imagen = filenameConct1;
                        imag.IdNovedad = id;
                        mapeo.GuardarImagen(imag);
                    }
                    else
                    {
                        errorpdf = true;
                    }
                }
            }
        }
    }
}