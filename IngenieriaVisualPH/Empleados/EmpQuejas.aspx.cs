using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.IO;

namespace IngenieriaVisualPH.Empleados
{
    public partial class Formulario_web13 : System.Web.UI.Page
    {
        public Datos.Conexion con = new Datos.Conexion();
        Datos.MapeoSolicitudes mapeo = new Datos.MapeoSolicitudes();
        Modelo.EntidadesPQR pqr = new Modelo.EntidadesPQR();
        Modelo.EntidadImagenes imagenvar = new Modelo.EntidadImagenes();
        static Int32 applicationid = 0;
        static Int32 id = 0; 
        private int codigo= 0012;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnenviarpqr_Click(object sender, EventArgs e)
        {
            lblcodigo1.Text = ddltor.Text + ddapa.Text;

            if (ddtipo.Text != "" && txtnombre.Text != "" && txtobservacion.Text != "" && lblcodigo1.Text != codigo.ToString())
            {
                if (f1.HasFile != true)
                {
                    //guardar en DB
                    lblMessage.Visible = false;
                    pqr.Codigo = codigo;
                    pqr.DescripcionPQR = txtobservacion.Text;
                    pqr.Estado = ddlista.Text;
                    pqr.Respuesta = lblrespuesta.Text;
                    pqr.FechaRespuesta = lblfecha.Text;
                    pqr.Nombre = txtnombre.Text;
                    pqr.Tipo = ddtipo.Text;
                    pqr.Codigo1 = lblcodigo1.Text;
                    pqr.Asignar = lblarea.Text;
                    mapeo.GuardarPQRSolo(pqr);
                    error.Style.Add("display", "block");
                    txtobservacion.Text = "";
                    txtnombre.Text = "";
                    ddtipo.Text = "";
                }
                else
                {
                    DateTime time = DateTime.Now;
                    string fecha = time.ToString("dddd, dd MMMM yyyy ss");
                    ObtenerIdMax();
                    con.Cerrar();
                    string targetPath = Server.MapPath("../NovedadPQR/");
                    foreach (HttpPostedFile file in f1.PostedFiles)
                    {
                        string filename = Path.GetFileName(file.FileName);
                        string fileExtension = Path.GetExtension(filename);
                        string filenameConct = Path.GetFileName(file.FileName + lblcodigo.Text + fecha + fileExtension);
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
                                //guardar en DB
                                lblMessage.Visible = false;
                                pqr.Codigo = codigo ;
                                pqr.DescripcionPQR = txtobservacion.Text;
                                pqr.Estado = ddlista.Text;
                                pqr.Respuesta = lblrespuesta.Text;
                                pqr.FechaRespuesta = lblfecha.Text;
                                pqr.Nombre = txtnombre.Text;
                                pqr.Tipo = ddtipo.Text;
                                pqr.Codigo1 = lblcodigo1.Text;
                                pqr.Asignar = lblarea.Text;
                                imagenvar.Nombre = filenameConct;
                                imagenvar.IdSolPQR = applicationid;
                                mapeo.GuardarPQR(pqr, imagenvar);
                                error.Style.Add("display", "block");
                                txtobservacion.Text = "";
                                txtnombre.Text = "";
                                ddtipo.Text = "";
                            }
                        }
                        else
                        {
                            lblMessage.Visible = true;
                            lblMessage.Text = "Solo permite imagenes .png , .jpg , .jpeg. Si es un .pdf, haga una captura de pantalla del pdf y adjunte la captura de pantalla";
                        }
                    }
                    error.Style.Add("display", "block");
                }
            }
            else
            {
                ddapa.DataTextField = "Apartamento";
                ddltor.DataTextField = "Torre";
            }
        }
        public void ObtenerIdMax()
        {
            con.Abrir();
            String query = "select Id from tblPQR";
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
                String query1 = "select max(Id) from tblPQR ";
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