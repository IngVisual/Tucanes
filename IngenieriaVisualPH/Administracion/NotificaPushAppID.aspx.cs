using System;
using System.IO;
using System.Data;
using Datos;

namespace IngenieriaVisualPH.Administracion
{
    public partial class Formulario_web139 : System.Web.UI.Page
    {
        Datos.MapeoNotificaciones msg = new Datos.MapeoNotificaciones();
        Modelo.EntidadImagenes imag = new Modelo.EntidadImagenes();
        private Conexion acceso = new Conexion();
        private int id, codigo;
        DateTime time = DateTime.Now;
        private bool errorpdf = false;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void MostrarNotificacion()
        {
            if (txtbuscar.Text != "")
            {
                msg._Codigo = int.Parse(txtbuscar.Text);
                DataTable dt = msg.MostrarMsgCodigo(msg);
                r1.DataSource = dt;
                r1.DataBind();
                Div1.Style.Add("display", "none");
            }
            else
            {
                Div1.Style.Add("display", "block");
            }
        }

        private string Strcodigo;
        protected void BtnEnviar_Click(object sender, EventArgs e)
        {
            Strcodigo = ddltor.Text + ddapa.Text;
            if (Strcodigo.Length<=5)
            {
            if (txtmsg.Text != "" && txttitulo.Text != "")
            {
                id = msg.ObtenerIdMaxMsg();
                msg.GuardarInfMsg(txtmsg.Text, txttitulo.Text, time);
                codigo = int.Parse(Strcodigo);
                msg.GuardarInfoBandejaNoti(id, codigo);
                EnviarPush();
                txtmsg.Text = "";
                txttitulo.Text = "";
                Response.Redirect("NotificaPushAppID.aspx");
            }
            else
            {
                RequiredFieldValidator1.Text = "* Requerido";
                RequiredFieldValidator2.Text = "* Requerido";
            }
            }
            else
            {
                Div2.Style.Add("display", "block");
                Div1.Style.Add("display", "none");
            }

        }

        protected void BtnEnviar2_Click(object sender, EventArgs e)
        {
            Strcodigo = ddltor.Text + ddapa.Text;
            if (Strcodigo.Length <= 5)
            {
                VerificarImagen();
            if (errorpdf == false)
            {
                if (txtmsg.Text != "" && txttitulo.Text != "")
                {
                    id = msg.ObtenerIdMaxMsg();
                    CargarImagen();
                    msg.GuardarInfMsg(txtmsg.Text, txttitulo.Text, time);
                    codigo = int.Parse(Strcodigo);
                    msg.GuardarInfoBandejaNoti(id, codigo);
                    EnviarPush();
                    txtmsg.Text = "";
                    txttitulo.Text = "";
                    Response.Redirect("NotificaPushAppID.aspx");
                }
                else
                {
                    RequiredFieldValidator1.Text = "* Requerido";
                    RequiredFieldValidator2.Text = "* Requerido";
                }
            }
            else
            {
                error1.Style.Add("display", "block");
                Div1.Style.Add("display", "none");
            }
            }
            else
            {
                Div2.Style.Add("display", "block");
                Div1.Style.Add("display", "none");
            }
        }

        protected void VerificarImagen()
        {
            string filename = Path.GetFileName(f1.PostedFile.FileName);
            string fileExtension = Path.GetExtension(filename);
            if (f1.HasFile == true && fileExtension.ToLower() == ".pdf")
            {
                errorpdf = false;
            }
            else
            {
                errorpdf = true;
            }
        }

        public void CargarImagen()
        {
            string fecha = time.ToString("dddd, dd MMMM yyyy ss");
            string targetPath1 = Server.MapPath("../Descarga/Correo/");
            string filename = Path.GetFileName(f1.PostedFile.FileName);
            string fileExtension = Path.GetExtension(filename);
            string filenameConct1 = Path.GetFileName(fecha + filename);
            if (f1.HasFile == true && fileExtension.ToLower() == ".pdf")
            {
                f1.SaveAs(targetPath1 + filenameConct1);
                imag.Imagen = filenameConct1;
                imag.IdNotif = id;
                msg.GuardarImagen(imag);
            }
        }

        protected void check1_CheckedChanged(object sender, EventArgs e)
        {
            if (check1.Checked == true)
            {
                imagenSi.Style.Add("display", "block");
                BtnEnviar2.Visible = true;
                BtnEnviar.Visible = false;
            }
            else
            {
                imagenSi.Style.Add("display", "none");
                BtnEnviar2.Visible = false;
                BtnEnviar.Visible = true;
            }
        }

        protected void txtbuscar_TextChanged(object sender, EventArgs e)
        {
            MostrarNotificacion();
        }

        private string strpush;
        public void EnviarPush()
        {
            Datos.MapeoPush push = new Datos.MapeoPush();
            Modelo.EntidadPush usupush = new Modelo.EntidadPush();
            usupush.Codigo = int.Parse(Strcodigo);
            DataTable dt = push.MostrarPushCodigo(usupush);
            foreach (DataRow item in dt.Rows)
            {
                strpush = item["Push"].ToString();
                Servicios.Push SendPush = new Servicios.Push(Strcodigo, strpush, txtmsg.Text,txttitulo.Text);
            }
        }
    }
}