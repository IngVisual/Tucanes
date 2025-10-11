using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using Servicios;
using static System.Net.Mime.MediaTypeNames;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.IO;

namespace IngenieriaVisualPH.Propietario
{
    public partial class Formulario_web18 : System.Web.UI.Page
    {
        Datos.MapeoRegistros mapeo = new Datos.MapeoRegistros();
        Modelo.EntidadBicicleta bicicleta = new Modelo.EntidadBicicleta();
        private Datos.Conexion con = new Datos.Conexion();
        Modelo.EntidadImagenes imag = new Modelo.EntidadImagenes();
        Datos.MapeoContrato mapeocont = new Datos.MapeoContrato();
        Modelo.EntidadContrato contrato = new Modelo.EntidadContrato();
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
            PoliticaBicicletero();
        }

        protected void btnactualizar_Click(object sender, EventArgs e)
        {
            if (txtcolor.Text == "" && txtmarca.Text == "" && txtxnombre.Text == "")
            {
                lblMessage.Visible = true;
                lblMessage.Text = "Falta la placa de su vehiculo dependiendo el tipo de parqueadero que necesita, ingrese nuevamente y finalice el registro";
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
            else if (FileUpload3.HasFile == false)
            {
                lblMessage.Visible = true;
                lblMessage.Text = "Debe ingresar todos los documentos. ingrese nuevamente y finalice el registro";
            }
            else
            {
                GuardarImagenes();
                Firma();
                ObtenerIdMax();
                con.Cerrar();
                GuardarDatos();
            }
        }
        public void GuardarDatos()
        {
            if (error == false)
            {
                bicicleta.Codigo = codigo;
                bicicleta.Estado = estado;
                bicicleta.Respuesta = respuesta;
                bicicleta.Marca = txtmarca.Text;
                bicicleta.Color = txtcolor.Text;
                bicicleta.Tipo = ddtipo.Text;
                bicicleta.Persona = ddper.Text;
                bicicleta.TipoSolicitante = ddtiposoli.Text;
                bicicleta.Serie = txtserie.Text;
                bicicleta.Nombre = txtxnombre.Text;
                imag.IdBicicleta = applicationid;
                imag.firmaBici = filePath;
                mapeo.RegistroCicla(bicicleta, imag);
                Response.Redirect("ProCiclaEditar.aspx");
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
            string targetPath1 = Server.MapPath("../SC/Bicicleta/cc/");

            //file2
            string file2 = Path.GetFileName(FileUpload2.PostedFile.FileName);
            string fileExtension2 = Path.GetExtension(file2);
            string filenameConct2 = Path.GetFileName(codigo + fecha + file2);
            string targetPath2 = Server.MapPath("../SC/Bicicleta/tp/");

            //file3
            string file3 = Path.GetFileName(FileUpload3.PostedFile.FileName);
            string fileExtension3 = Path.GetExtension(file3);
            string filenameConct3 = Path.GetFileName(codigo + fecha + file3);
            string targetPath3 = Server.MapPath("../SC/Bicicleta/bicifoto/");

            Stream strm1 = FileUpload1.PostedFile.InputStream;
            Stream strm2 = FileUpload2.PostedFile.InputStream;
            Stream strm3 = FileUpload3.PostedFile.InputStream;

            if (fileExtension1.ToLower() == ".png" || fileExtension1.ToLower() == ".jpg" || fileExtension1.ToLower() == ".jpeg")
            {
                if (fileExtension2.ToLower() == ".png" || fileExtension2.ToLower() == ".jpg" || fileExtension2.ToLower() == ".jpeg")
                {
                    if (fileExtension3.ToLower() == ".png" || fileExtension3.ToLower() == ".jpg" || fileExtension3.ToLower() == ".jpeg")
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
                            imag.cc = filenameConct1;
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
                            imag.tp = filenameConct2;
                        }
                        using (var image3 = System.Drawing.Image.FromStream(strm3))
                        {
                            var newWidth3 = (int)(image3.Width * 0.5);
                            // can given height of image as we want  
                            var newHeight3 = (int)(image3.Height * 0.5);
                            var thumbnailImg3 = new Bitmap(newWidth3, newHeight3);
                            var thumbGraph3 = Graphics.FromImage(thumbnailImg3);
                            thumbGraph3.CompositingQuality = CompositingQuality.HighQuality;
                            thumbGraph3.SmoothingMode = SmoothingMode.HighQuality;
                            thumbGraph3.InterpolationMode = InterpolationMode.HighQualityBicubic;
                            var imageRectangle3 = new Rectangle(0, 0, newWidth3, newHeight3);
                            thumbGraph3.DrawImage(image3, imageRectangle3);
                            thumbnailImg3.Save(targetPath3 + filenameConct3);
                            imag.bicifoto = filenameConct3;
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
            else
            {
                error = true;
            }
        }
        public void ObtenerIdMax()
        {
            con.Abrir();
            String query = "select Id from tblCicla";
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
                String query1 = "select max(Id) from tblCicla ";
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
        public void PoliticaBicicletero()
        {
            int IdContrato = 1;
            contrato.IdContrato = IdContrato;
            DataTable dt = mapeocont.MostrarContrato(contrato);
            foreach (DataRow item in dt.Rows)
            {
                lblmsg.Text = item["ContratoBicicletero"].ToString();
            }
        }
        public void Firma()
        {
            //Read the Base64 string from Hidden Field.
            string base64 = Request.Form[hfImageData.UniqueID].Split(',')[1];

            //Convert Base64 string to Byte Array.
            byte[] bytes = Convert.FromBase64String(base64);

            //Save the Byte Array as Image 
            filePath = string.Format("../SC/Bicicleta/firmaBici/" + fecha + "{0}.png", Path.GetRandomFileName());
            File.WriteAllBytes(Server.MapPath(filePath), bytes);
        }

    }
}