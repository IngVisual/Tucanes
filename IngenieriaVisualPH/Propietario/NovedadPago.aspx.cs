using System;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.IO;
using System.Web;

namespace IngenieriaVisualPH.Propietario
{
    public partial class Formulario_web116 : System.Web.UI.Page
    {
        public Datos.Conexion con = new Datos.Conexion();
        Datos.MapeoSolicitudes mapeo = new Datos.MapeoSolicitudes();
        Modelo.EntidadesNovedadSaldo novedad = new Modelo.EntidadesNovedadSaldo();
        Modelo.EntidadImagenes imagenNovedad = new Modelo.EntidadImagenes();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                lblcodigo.Text = Session["cod"].ToString();
            }
            catch (Exception)
            {
                throw new Exception("Tiempo de sesion finalizado, por favor ingrese nuevamente a la app");
            }
        }

        protected void btnsave_Click(object sender, EventArgs e)
        {
            if (fileupload1.HasFile==true && txtobservacion.Text!="")
            {               
                DateTime time = DateTime.Now;
                string fecha= time.ToString("dddd, dd MMMM yyyy ss");
                ObtenerIdMax();
                con.Cerrar();
                string targetPath = Server.MapPath("../NovedadSaldos/");
                foreach (HttpPostedFile file in fileupload1.PostedFiles)
                {
                    string filename = Path.GetFileName(file.FileName);
                    string fileExtension = Path.GetExtension(filename);
                    string filenameConct = Path.GetFileName(file.FileName+lblcodigo.Text+fecha+fileExtension);
                    if (fileExtension.ToLower() == ".png" || fileExtension.ToLower() == ".jpg" || fileExtension.ToLower() == ".jpeg")
                    {
                    Stream imagen = file.InputStream;
                    using (var image = System.Drawing.Image.FromStream(imagen))
                        {
                        var newWidth = (int)(image.Width * 0.5);
                        // can given height of image as we want  
                        var newHeight = (int)(image.Height * 0.5);
                        var thumbnailImg = new Bitmap(newWidth, newHeight);
                        var thumbGraph = Graphics.FromImage(thumbnailImg);
                        thumbGraph.CompositingQuality = CompositingQuality.HighQuality;
                        thumbGraph.SmoothingMode = SmoothingMode.HighQuality;
                        thumbGraph.InterpolationMode = InterpolationMode.HighQualityBicubic;
                        var imageRectangle = new Rectangle(0, 0, newWidth, newHeight);
                        thumbGraph.DrawImage(image, imageRectangle);
                        thumbnailImg.Save(targetPath + filenameConct);
                        lblmensaje.Visible = false;
                        novedad.Codigo = int.Parse(lblcodigo.Text);
                        novedad.Obseraciones = txtobservacion.Text;
                        novedad.Estado = lblestado.Text;
                        novedad.Respuesta = lblresp.Text;
                        novedad.FechaRes = lblfecha.Text;
                        imagenNovedad.Nombre = filenameConct;
                        imagenNovedad.IdNovSaldo = applicationid;
                        mapeo.GuardarNovedadSaldo(novedad,imagenNovedad);
                        error.Style.Add("display", "block");
                        txtobservacion.Text = "";
                        }
                    }
                    else
                    {
                        lblmensaje.Visible = true;
                        lblmensaje.Text = "Solo permite imagenes .png , .jpg , .jpeg. Si es un .pdf, haga una captura de pantalla del pdf y adjunte la captura de pantalla";
                    }
                }
            }
            else
            {
                lblmensaje.Visible = true;
                lblmensaje.Text = "Seleccione sus recibos, Describa la observacion de su novedad con el saldo";
            }
        }

        static Int32 applicationid=0;
        static Int32 id = 0;
        public void ObtenerIdMax()
        {
            con.Abrir();
            String query = "select Id from NovedadSaldo";
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
                String query1 = "select max(Id) from NovedadSaldo ";
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