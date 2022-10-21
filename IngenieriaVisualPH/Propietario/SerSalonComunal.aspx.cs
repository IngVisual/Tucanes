using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace IngenieriaVisualPH.Propietario
{
    public partial class Formulario_web141 : System.Web.UI.Page
    {
        LogicaNeg.CSolictudSC sc = new LogicaNeg.CSolictudSC();
        Modelo.EntidadSC SC = new Modelo.EntidadSC();
        Modelo.EntidadContrato contrato = new Modelo.EntidadContrato();
        Modelo.EntidadPush usupush = new Modelo.EntidadPush();
        Datos.MapeoPush push = new Datos.MapeoPush();
        int codigo, id;
        bool error;
        string estado = "Solicitud", respuesta="Pendiente";
        string conjunto, strpush, fecha;
        string asunto = "POLITICA Y COMPROMISO, ALQUILER DE SALON COMUNAL";
        string Email;
        string Msm = "Realizo una solicitud de Salon Comunal";
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                codigo = int.Parse(Session["cod"].ToString());
                conjunto = Session["conj"].ToString();
                id = int.Parse(Session["id"].ToString());
            }
            catch (Exception)
            {
                throw new Exception("Tiempo de sesion finalizado, por favor ingrese nuevamente a la app");
            }
            PoliticaSC();
            MostrarDatos();
        }
        public void MostrarDatos()
        {
            Datos.MapeoUsuarios mapeoDatos = new Datos.MapeoUsuarios();
            Modelo.EntidadUsuario usuario = new Modelo.EntidadUsuario();
            usuario.Codigo = codigo;
            DataTable dt = mapeoDatos.LeerUsuario(usuario);
            foreach (DataRow item in dt.Rows)
            {
                Email = item["Email"].ToString();
            }
        }
        public void PoliticaSC()
        {
            int IdContrato = 1;
            DataTable dt = sc.MostrarContrato(IdContrato);
            foreach (DataRow item in dt.Rows)
            {
                lblmsg.Text = item["ContratoSC"].ToString();
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
        public void guardarImagenSC()
        {

            lblmensaje.Visible = false;
            DateTime time = DateTime.Now;
            fecha = time.ToString("dddd, dd MMMM yyyy ss");

            //file1
            string file1 = Path.GetFileName(FileUpload1.PostedFile.FileName);
            string fileExtension1 = Path.GetExtension(file1);
            string filenameConct1 = Path.GetFileName(codigo + fecha + file1);
            string targetPath1 = Server.MapPath("../SC/Recibo/");
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
                    GuardarSolSC(filenameConct1);
                }
            }
            else
            {
                error = true;
            }
        }

        protected void btnsave_Click(object sender, EventArgs e)
        {
            guardarImagenSC();
            if (error== false)
            { 
            EnviarPush();
            Servicios.Email email = new Servicios.Email(Email, codigo.ToString(), lblmsg.Text, asunto, conjunto, txtnombre.Text, txtcedula.Text,ddcanti.Text);
            Response.Redirect("ProTabResSC.aspx");
            }
            else
            {
            lblmensaje.Visible = true;
            lblmensaje.Text = "Solo permite imagenes .png , .jpg , .jpeg./// Si es un .pdf, haga una captura de pantalla del pdf y adjunte la captura de pantalla. Ingrese nuevamente para finalizar la solicitud";
            }
        }

        public void GuardarSolSC(string ruta)
        {
            sc.RegistrarSolSC(estado, respuesta, id, ruta, txtobservacion.Text, ddcanti.Text,txtnombre.Text,txtcedula.Text);
        }



    }
}