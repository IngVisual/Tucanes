using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.IO;

namespace IngenieriaVisualPH.Propietario
{
    public partial class Formulario_web165 : System.Web.UI.Page
    {
        private Datos.Conexion con = new Datos.Conexion();
        Datos.MapeoContrato mapeocont = new Datos.MapeoContrato();
        Datos.MapeoPush push = new Datos.MapeoPush();
        Datos.MapeoMudanzas mapeoMudanza = new Datos.MapeoMudanzas();
        Modelo.EntidadContrato contrato = new Modelo.EntidadContrato();
        Modelo.EntidadMudanzas mudanzas = new Modelo.EntidadMudanzas();
        Modelo.EntidadPush usupush = new Modelo.EntidadPush();
        Modelo.EntidadImagenes imag = new Modelo.EntidadImagenes();
        Datos.MapeoUsuarios mapeoDatos = new Datos.MapeoUsuarios();
        Modelo.EntidadUsuario usuario = new Modelo.EntidadUsuario();

        public string date;
        int codigo;
        string estado = "Solicitud";
        string respuesta = "Pendiente";
        static Int32 applicationid = 0;
        static Int32 idMudanza = 2;
        bool error3, error2;
        string conjunto;
        string asunto = "POLITICA Y COMPROMISO DE MUDANZAS";
        string Email, Propietario, filePath, StrCodigo, strpush, fecha;
        string Msm = "Realizo una solicitud de ingreso Material de Construcción";

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                codigo = int.Parse(Session["cod"].ToString());
                conjunto = Session["conj"].ToString();
            }
            catch (Exception)
            {
                throw new Exception("Tiempo de sesion finalizado, por favor ingrese nuevamente a la app");
            }
            StrCodigo = codigo.ToString();
            PoliticaMudanza();
            MostrarDatos();
            usuario.Codigo = codigo;
            DataTable dt = mapeoDatos.LeerUsuario(usuario);
            if (dt != null)
            {
                if (!IsPostBack)
                {
                    Msg();
                }
            }
            date = Request.QueryString["date"].ToString();
            if (IsPostBack) return;
            txtfechaini.Text = date;
            txtfechafin.Text = date;
        }

        protected void Msg()
        {
            Datos.MapeoMsg mapeomsg = new Datos.MapeoMsg();
            Modelo.EntidadMsg msg = new Modelo.EntidadMsg();
            msg._Id = 1;
            DataTable dt = mapeomsg.MostrarMsg(msg);
            foreach (DataRow item in dt.Rows)
            {
                lblmsg22.Text = item["MsgMud"].ToString();
            }
            if (lblmsg22.Text != "")
            {
                mensaje.Style.Add("display", "block");
            }
            else { mensaje.Style.Add("display", "none"); }
        }

        public void PoliticaMudanza()
        {
            int IdContrato = 1;
            contrato.IdContrato = IdContrato;
            DataTable dt = mapeocont.MostrarContrato(contrato);
            foreach (DataRow item in dt.Rows)
            {
                lblmsg.Text = item["ContratoMudanza"].ToString();
            }
        }

        public void ObtenerIdMax()
        {
            con.Abrir();
            String query = "select id from tblMudanzas";
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = query;
            cmd.Connection = con.conexion;
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            DataSet ds = new DataSet();
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count < 1)
            {
                applicationid = 1;

            }
            else
            {
                String query1 = "select max(id) from tblMudanzas ";
                SqlCommand cmd1 = new SqlCommand();
                cmd1.CommandText = query1;
                cmd1.Connection = con.conexion;
                SqlDataAdapter da1 = new SqlDataAdapter();
                da1.SelectCommand = cmd1;
                DataSet ds1 = new DataSet();
                da1.Fill(ds1);
                applicationid = Convert.ToInt32(ds1.Tables[0].Rows[0][0].ToString());
                applicationid = applicationid + 1;
            }
        }

        public void MostrarDatos()
        {
            usuario.Codigo = codigo;
            DataTable dt = mapeoDatos.LeerUsuario(usuario);
            foreach (DataRow item in dt.Rows)
            {
                Email = item["Email"].ToString();
                Propietario = item["NombrePropietario"].ToString();
            }
            lblpro.Text = Propietario;
            lblpropie.Text = Propietario;
        }

        public void Firma()
        {
            //Read the Base64 string from Hidden Field.
            string base64 = Request.Form[hfImageData.UniqueID].Split(',')[1];

            //Convert Base64 string to Byte Array.
            byte[] bytes = Convert.FromBase64String(base64);

            //Save the Byte Array as Image 
            filePath = string.Format("../Mudanzas/Firma/" + fecha + "{0}.png", Path.GetRandomFileName());
            File.WriteAllBytes(Server.MapPath(filePath), bytes);
        }

        public void GuardarImagen()
        {
            lblMessage.Visible = false;
            lblMessage3.Visible = false;
            DateTime time = DateTime.Now;
            fecha = time.ToString("dddd, dd MMMM yyyy ss");

            //file1
            string file1 = Path.GetFileName(FileUpload1.PostedFile.FileName);
            string fileExtension1 = Path.GetExtension(file1);
            string filenameConct1 = Path.GetFileName(codigo + fecha + file1);
            string targetPath1 = Server.MapPath("../Mudanzas/Cedula/");
            Stream strm1 = FileUpload1.PostedFile.InputStream;

            if (fileExtension1.ToLower() == ".png" || fileExtension1.ToLower() == ".jpg" || fileExtension1.ToLower() == ".jpeg")
            {
                using (var image1 = System.Drawing.Image.FromStream(strm1))
                {
                    var newWidth1 = (int)(image1.Width * 0.5);
                    // can given height of image as we want  
                    var newHeight1 = (int)(image1.Height * 0.5);
                    var thumbnailImg1 = new Bitmap(newWidth1, newHeight1);
                    var thumbGraph1 = Graphics.FromImage(thumbnailImg1);
                    thumbGraph1.CompositingQuality = CompositingQuality.HighQuality;
                    thumbGraph1.SmoothingMode = SmoothingMode.HighQuality;
                    thumbGraph1.InterpolationMode = InterpolationMode.HighQualityBicubic;
                    var imageRectangle1 = new Rectangle(0, 0, newWidth1, newHeight1);
                    thumbGraph1.DrawImage(image1, imageRectangle1);
                    thumbnailImg1.Save(targetPath1 + filenameConct1);
                    imag.Cedula = filenameConct1;
                }
            }
            else
            {
                error3 = true;
            }

            //file2
            string file2 = Path.GetFileName(FileUpload2.PostedFile.FileName);
            string fileExtension2 = Path.GetExtension(file2);
            string filenameConct2 = Path.GetFileName(codigo + fecha + file2);
            string targetPath2 = Server.MapPath("../Mudanzas/DocumentoPDF/");
            if (fileExtension2.ToLower() == ".pdf")
            {
                FileUpload2.SaveAs(targetPath2 + filenameConct2);
                imag.DocumentoPDF = filenameConct2;
            }
            else
            {
                error2 = true;
            }
        }

        public void EnviarPush()
        {
            usupush.Codigo = codigo;
            DataTable dt = push.MostrarPush(usupush);
            foreach (DataRow item in dt.Rows)
            {
                strpush = item["Push"].ToString();
                Servicios.Push SendPush = new Servicios.Push(codigo.ToString(), strpush, Msm);
            }
        }

        public void GuardarSolSalArt()
        {
            if (error3 == false && error2 == false)
            {
                mudanzas.Codigo = codigo;
                mudanzas.Estado = estado;
                mudanzas.Respuesta = respuesta;
                mudanzas.FechaIniMud = Convert.ToDateTime(txtfechaini.Text);
                mudanzas.FechaFinMud = Convert.ToDateTime(txtfechafin.Text);
                mudanzas.Autorizado = Propietario;
                mudanzas.Cedula = txtcedula.Text;
                mudanzas.IdTipoMud = idMudanza;
                mudanzas.Encargado = txtencargado.Text;
                mudanzas.Observacion = txtarticulos.Text;
                imag.IdSolMud = applicationid;
                imag.Firma = filePath;
                mapeoMudanza.GuardarMudIng(mudanzas, imag);
                Servicios.Email email = new Servicios.Email(Email, StrCodigo, lblmsg.Text, asunto, conjunto, Propietario, txtcedula.Text);
                EnviarPush();
                Response.Redirect("ProTabResSal.aspx");
            }
            else
            {
                lblMessage2.Visible = false;
                lblMessage.Visible = true;
                lblMessage3.Visible = false;
                lblMessage.Text = "(CEDULA) Solo permite imagenes .png , .jpg , .jpeg. /// (DOCUMENTACION PDF) Solo permite formato .pdf,      Ingrese nuevamente y finalice el registro";
            }
        }

        protected void btnenviardocuemnto_Click(object sender, EventArgs e)
        {
            if (txtarticulos.Text == "" || txtcedula.Text == "" || txtencargado.Text == "" || txtfechafin.Text == "" ||
               txtfechaini.Text == "" || FileUpload1.HasFile == false || FileUpload2.HasFile == false )
            {
                lblMessage.Visible = false;
                lblMessage2.Visible = true;
                lblMessage3.Visible = false;
                lblMessage2.Text = "Debe llenar todos los datos requeridos.  Ingrese nuevamente y finalice la solicitud";
            }
            else
            {
                ObtenerIdMax();
                con.Cerrar();
                Firma();
                GuardarImagen();
                GuardarSolSalArt();
            }
        }
    }
}