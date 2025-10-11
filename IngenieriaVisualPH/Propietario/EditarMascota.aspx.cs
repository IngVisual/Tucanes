using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Drawing.Drawing2D;
using System.Drawing;
using System.IO;
using static System.Net.Mime.MediaTypeNames;

namespace IngenieriaVisualPH.Propietario
{
    public partial class Formulario_web168 : System.Web.UI.Page
    {
        Datos.MapeoMascotas mapeo = new Datos.MapeoMascotas();
        Modelo.EntidadMascota usuario = new Modelo.EntidadMascota();
        Modelo.EntidadImagenes imag = new Modelo.EntidadImagenes();
        private Datos.Conexion con = new Datos.Conexion();
        private int id, codigo;
        bool error;
        string conjunto, filePath, fecha;
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
            id = Convert.ToInt32(Request.QueryString["Id"].ToString());
            if (IsPostBack) return;
        }

        protected void btnactualizar_Click(object sender, EventArgs e)
        {
            GuardarImagenes();
            GuardarDatos();
        }
        public void GuardarImagenes()
        {
            lblMessage.Visible = false;
            DateTime time = DateTime.Now;
            fecha = time.ToString("dddd, dd MMMM yyyy ss");

            //file1
            string file1 = Path.GetFileName(FileUpload1.PostedFile.FileName);
            string fileExtension1 = Path.GetExtension(file1);
            string filenameConct1 = Path.GetFileName(codigo + fecha + file1);
            string targetPath1 = Server.MapPath("../SC/Mascota/Carnet/");



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
                    imag.Carnet = filenameConct1;
                }
            }
            else
            {
                error = true;
            }
        }
        public void GuardarDatos()
        {
            if (error == false)
            {
                imag.IdMascota = id;
                mapeo.ActualizarCarnet(imag);
                Response.Redirect("VerMascotas.aspx");
            }
            else
            {
                lblMessage.Visible = true;
                lblMessage.Text = "Solo permite imagenes .png , .jpg , .jpeg. Si es un .pdf, haga una captura de pantalla del pdf y adjunte la captura de pantalla.";
            }
        }
    }
}