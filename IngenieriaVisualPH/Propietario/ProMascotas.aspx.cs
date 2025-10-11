using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Drawing.Drawing2D;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IngenieriaVisualPH.Propietario
{
    public partial class Formulario_web171 : System.Web.UI.Page
    {
        Datos.MapeoMascotas mapeo = new Datos.MapeoMascotas();
        Modelo.EntidadMascota mascota = new Modelo.EntidadMascota();
        private Datos.Conexion con = new Datos.Conexion();
        Modelo.EntidadImagenes imag = new Modelo.EntidadImagenes();
        int codigo;
        string estado = "Solicitud";
        string respuesta = "Pendiente";
        static Int32 applicationid = 0;
        static Int32 id = 0;
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
        }
        protected void btnactualizar_Click(object sender, EventArgs e)
        {
            if (txtnucar.Text == "" && txtnomencarg.Text == "" && txtnombre.Text == "")
            {
                lblMessage.Visible = true;
                lblMessage.Text = "Debe registrar todos los datos";
            }
            else if (FileUpload1.HasFile == false)
            {
                lblMessage.Visible = true;
                lblMessage.Text = "Debe ingresar todos los documentos. ingrese nuevamente y finalice el registro";

            }
            else if (FileUpload2.HasFile == false)
            {
                lblMessage.Visible = true;
                lblMessage.Text = "Debe ingresar todos los documentos. ingrese nuevamente y finalice el registro";
            }
            else
            {
                GuardarImagenes();
                ObtenerIdMax();
                con.Cerrar();
                GuardarDatos();
            }
        }
        public void GuardarDatos()
        {
            if (error == false)
            {
                mascota.Codigo = codigo;
                mascota.Estado = estado;
                mascota.Respuesta = respuesta;
                mascota.Especie = ddespecie.Text;
                mascota.Nombre = txtnombre.Text;
                mascota.TipoEncargado = ddtipoencar.Text;
                mascota.NombreEncargado = txtnomencarg.Text;
                mascota.NumeroCarnet = txtnucar.Text;
                mascota.Sexo = ddsexo.Text;
                mascota.Raza = txtraza.Text;
                mascota.Color = txtcolor.Text;
                mascota.RazaEspecial = ddespe.Text;
                mascota.Esterilizado = ddesteri.Text;
                mascota.Discapacidad = dddiscapa.Text;
                mascota.Edad = txtedad.Text;
                mascota.Telefono = txttel.Text;
                mascota.Correo = txtcorreo.Text;
                imag.IdMascota = applicationid;
                mapeo.RegistroMascota(mascota, imag);
                Response.Redirect("VerMascotas.aspx");
            }
            else
            {
                lblMessage.Visible = true;
                lblMessage.Text = "Solo permite imagenes .png , .jpg , .jpeg. Si es un .pdf, haga una captura de pantalla del pdf y adjunte la captura de pantalla,Ingrese nuevamente y finalice el registro";
            }
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

            //file2
            string file2 = Path.GetFileName(FileUpload2.PostedFile.FileName);
            string fileExtension2 = Path.GetExtension(file2);
            string filenameConct2 = Path.GetFileName(codigo + fecha + file2);
            string targetPath2 = Server.MapPath("../SC/Mascota/FotoMascota/");


            Stream strm1 = FileUpload1.PostedFile.InputStream;
            Stream strm2 = FileUpload2.PostedFile.InputStream;

            if (fileExtension1.ToLower() == ".png" || fileExtension1.ToLower() == ".jpg" || fileExtension1.ToLower() == ".jpeg")
            {
                if (fileExtension2.ToLower() == ".png" || fileExtension2.ToLower() == ".jpg" || fileExtension2.ToLower() == ".jpeg")
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
                    using (var image2 = System.Drawing.Image.FromStream(strm2))
                    {
                        var newWidth2 = (int)(image2.Width * 0.5);
                        // can given height of image as we want  
                        var newHeight2 = (int)(image2.Height * 0.5);
                        var thumbnailImg2 = new Bitmap(newWidth2, newHeight2);
                        var thumbGraph2 = Graphics.FromImage(thumbnailImg2);
                        thumbGraph2.CompositingQuality = CompositingQuality.HighQuality;
                        thumbGraph2.SmoothingMode = SmoothingMode.HighQuality;
                        thumbGraph2.InterpolationMode = InterpolationMode.HighQualityBicubic;
                        var imageRectangle2 = new Rectangle(0, 0, newWidth2, newHeight2);
                        thumbGraph2.DrawImage(image2, imageRectangle2);
                        thumbnailImg2.Save(targetPath2 + filenameConct2);
                        imag.FotoMascota = filenameConct2;
                    }
                }
                else
                {
                    error = true;
                }
            }
            else
            {
                error = true;
            }
        }
        public void ObtenerIdMax()
        {
            con.Abrir();
            String query = "select Id from tblMascota";
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
                String query1 = "select max(Id) from tblMascota";
                SqlCommand cmd1 = new SqlCommand();
                cmd1.CommandText = query1;
                cmd1.Connection = con.conexion;
                SqlDataAdapter da1 = new SqlDataAdapter();
                da1.SelectCommand = cmd1;
                DataSet ds1 = new DataSet();
                da1.Fill(ds1);
                id = Convert.ToInt32(ds1.Tables[0].Rows[0][0].ToString());
                applicationid = id + 1;
            }
        }
    }
}