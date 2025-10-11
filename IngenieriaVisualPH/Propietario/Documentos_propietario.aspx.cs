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
    public partial class Formulario_web126 : System.Web.UI.Page
    {
        private Datos.Conexion con = new Datos.Conexion();
        Datos.MapeoContrato mapeocont = new Datos.MapeoContrato();
        Datos.MapeoParqueadero mapeoparq = new Datos.MapeoParqueadero();
        Modelo.EntidadContrato contrato = new Modelo.EntidadContrato();
        Modelo.EntidadParqueadero vehiculo = new Modelo.EntidadParqueadero();
        Modelo.EntidadImagenes imag = new Modelo.EntidadImagenes();
        
        int codigo;
        string StrCodigo;
        string estado = "Solicitud";
        string respuesta = "Pendiente";
        static Int32 applicationid = 0;
        static Int32 id = 0;
        bool error;
        string conjunto;
        string asunto = "POLITICA Y COMPROMISO DE PARQUEADEROS";
        string Email;
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
            PoliticaParqueadero();
            if (!IsPostBack)
            {
                Msg();
            }
        }
        protected void Msg()
        {
            Datos.MapeoMsg mapeomsg = new Datos.MapeoMsg();
            Modelo.EntidadMsg msg = new Modelo.EntidadMsg();
            msg._Id = 1;
            DataTable dt = mapeomsg.MostrarMsg(msg);
            foreach (DataRow item in dt.Rows)
            {
                lblmsg2.Text = item["MsgParqueadero"].ToString();
            }
            if (lblmsg2.Text != "")
            {
                mensaje.Style.Add("display","block");
            }
            else { mensaje.Style.Add("display", "none"); }
        }
        public void PoliticaParqueadero()
        {
            int IdContrato = 1;
            contrato.IdContrato = IdContrato;
            DataTable dt = mapeocont.MostrarContrato(contrato);
            foreach (DataRow item in dt.Rows)
            {
                lblmsg.Text = item["ContratoParqueadero"].ToString();
            }
        }
        public void GuardarDatos()
        {
            if(error==false)
            {            
            vehiculo.Codigo = codigo;
            vehiculo.Estado = estado;
            vehiculo.Respuesta = respuesta;
            vehiculo.Destino = ddcanti.Text;
            vehiculo.PlacaCarro = txtplacacar.Text;
            vehiculo.PlacaMoto = txtplacamot.Text;
            vehiculo.PLacaCarroMoto = txtcarmot.Text;
            vehiculo.Color = txtcolor.Text;
            vehiculo.TP = txttarjeta.Text;
            imag.IdSolParq = applicationid;
            BuscarTP();
                if(lbltp.Text!=txttarjeta.Text)
                {
                    mapeoparq.GuardarDatosParque(vehiculo, imag);
                    Response.Redirect("ProTabResPar.aspx");
                }
                else
                {
                    lblMessage.Visible = true;
                    lblMessage.Text = "Ya realizo una solicitud con esa tarjeta de propiedad y debe esperar respuesta de Administracion, si desea volver a enviar la solicitud, debe eliminar la que tiene cargada. Vaya a respuestas de Parqueadero y eliminela";
                }
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
            string fecha = time.ToString("dddd, dd MMMM yyyy ss");

            //file1
            string file1 = Path.GetFileName(FileUpload1.PostedFile.FileName);   
            string fileExtension1 = Path.GetExtension(file1);
            string filenameConct1 = Path.GetFileName(codigo + fecha + file1);
            string targetPath1 = Server.MapPath("../Parqueadero/Cedula/");


            //file2
            string file2 = Path.GetFileName(FileUpload2.PostedFile.FileName);
            string fileExtension2 = Path.GetExtension(file2);
            string filenameConct2 = Path.GetFileName(codigo + fecha + file2);
            string targetPath2 = Server.MapPath("../Parqueadero/Soat/");

            //file3
            string file3 = Path.GetFileName(FileUpload3.PostedFile.FileName);
            string fileExtension3 = Path.GetExtension(file3);
            string filenameConct3 = Path.GetFileName(codigo + fecha + file3);
            string targetPath3 = Server.MapPath("../Parqueadero/TarjetaP/");

            //file4
            string file4 = Path.GetFileName(FileUpload4.PostedFile.FileName);
            string fileExtension4 = Path.GetExtension(file4);
            string filenameConct4 = Path.GetFileName(codigo + fecha + file4);
            string targetPath4 = Server.MapPath("../Parqueadero/Tecnomecanica/");

            //file5
            string file5 = Path.GetFileName(FileUpload5.PostedFile.FileName);
            string fileExtension5 = Path.GetExtension(file5);
            string filenameConct5 = Path.GetFileName(codigo + fecha + file5);
            string targetPath5 = Server.MapPath("../Parqueadero/Vehiculo/");

            Stream strm1 = FileUpload1.PostedFile.InputStream;         
            Stream strm2 = FileUpload2.PostedFile.InputStream;
            Stream strm3 = FileUpload3.PostedFile.InputStream;
            Stream strm4 = FileUpload4.PostedFile.InputStream;           
            Stream strm5 = FileUpload5.PostedFile.InputStream;            

            if (fileExtension1.ToLower() == ".png" || fileExtension1.ToLower() == ".jpg" || fileExtension1.ToLower() == ".jpeg")
            {
                if (fileExtension2.ToLower() == ".png" || fileExtension2.ToLower() == ".jpg" || fileExtension2.ToLower() == ".jpeg")
                {
                    if (fileExtension3.ToLower() == ".png" || fileExtension3.ToLower() == ".jpg" || fileExtension3.ToLower() == ".jpeg")
                    {
                        if(fileExtension4.ToLower() == ".png" || fileExtension4.ToLower() == ".jpg" || fileExtension4.ToLower() == ".jpeg")
                        {
                            if (fileExtension5.ToLower() == ".png" || fileExtension5.ToLower() == ".jpg" || fileExtension5.ToLower() == ".jpeg")
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
                                    imag.Soat = filenameConct2;
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
                                    imag.TarjetaP = filenameConct3;
                                }
                                using (var image4 = System.Drawing.Image.FromStream(strm4))
                                {
                                    var newWidth4 = (int)(image4.Width * 0.5);
                                    // can given height of image as we want  
                                    var newHeight4 = (int)(image4.Height * 0.5);
                                    var thumbnailImg4 = new Bitmap(newWidth4, newHeight4);
                                    var thumbGraph4 = Graphics.FromImage(thumbnailImg4);
                                    thumbGraph4.CompositingQuality = CompositingQuality.HighQuality;
                                    thumbGraph4.SmoothingMode = SmoothingMode.HighQuality;
                                    thumbGraph4.InterpolationMode = InterpolationMode.HighQualityBicubic;
                                    var imageRectangle4 = new Rectangle(0, 0, newWidth4, newHeight4);
                                    thumbGraph4.DrawImage(image4, imageRectangle4);
                                    thumbnailImg4.Save(targetPath4 + filenameConct4);
                                    imag.TecnoM = filenameConct4;
                                }
                                using (var image5 = System.Drawing.Image.FromStream(strm5))
                                {
                                    var newWidth5 = (int)(image5.Width * 0.5);
                                    // can given height of image as we want  
                                    var newHeight5 = (int)(image5.Height * 0.5);
                                    var thumbnailImg5 = new Bitmap(newWidth5, newHeight5);
                                    var thumbGraph5 = Graphics.FromImage(thumbnailImg5);
                                    thumbGraph5.CompositingQuality = CompositingQuality.HighQuality;
                                    thumbGraph5.SmoothingMode = SmoothingMode.HighQuality;
                                    thumbGraph5.InterpolationMode = InterpolationMode.HighQualityBicubic;
                                    var imageRectangle5 = new Rectangle(0, 0, newWidth5, newHeight5);
                                    thumbGraph5.DrawImage(image5, imageRectangle5);
                                    thumbnailImg5.Save(targetPath5 + filenameConct5);
                                    imag.Vehiculo = filenameConct5;
                                    error = false;
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
            String query = "select Id from tblDocumento";
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
                String query1 = "select max(Id) from tblDocumento ";
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

        public void BuscarTP()
        {
            DataTable dt = mapeoparq.MostrarSolParqTabla();
            var result = dt.AsEnumerable().Where(myRow => myRow.Field<string>("TP") == txttarjeta.Text).AsDataView();
            foreach (DataRow item in dt.Rows)
            {
                lbltp.Text = item["TP"].ToString();                
            }
        }
        protected void btnenviardocuemnto_Click(object sender, EventArgs e)
        {
            if (txtcarmot.Text == "" && txtplacacar.Text == "" && txtplacamot.Text == "")
            {
                lblMessage.Visible = true;
                lblMessage.Text = "Falta la placa de su vehiculo dependiendo el tipo de parqueadero que necesita, ingrese nuevamente y finalice el registro";
            }else if(FileUpload1.HasFile==false)
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
            else if (FileUpload4.HasFile == false)
            {
                lblMessage.Visible = true;
                lblMessage.Text = "Debe ingresar todos los documentos. ingrese nuevamente y finalice el registro";
            }
            else if (FileUpload5.HasFile == false)
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
    }
}