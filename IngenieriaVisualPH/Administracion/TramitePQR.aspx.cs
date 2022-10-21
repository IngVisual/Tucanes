using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.IO;

using System.Data;

namespace IngenieriaVisualPH.Administracion
{
    public partial class Formulario_web13 : System.Web.UI.Page
    {
        public Datos.Conexion con = new Datos.Conexion();
        Datos.MapeoSolicitudes mapeo = new Datos.MapeoSolicitudes();
        Modelo.EntidadImagenes imagenvar = new Modelo.EntidadImagenes();
        Modelo.EntidadesPQR pqr = new Modelo.EntidadesPQR();
        private int count1, count2;
        static Int32 applicationid = 0;
        static Int32 id = 0;
        private string codigo;
        protected void Page_Load(object sender, EventArgs e)
        {
            llamaTablaPqr();
        }

        public void llamaTablaPqr()
        {
            DataTable dt = mapeo.MostrarPQRTabla();
            var result = dt.AsEnumerable().Where(myRow => myRow.Field<string>("Estado") == "Abierta").AsDataView();
            count1 = result.Count;
            lblnot8.Text = count1.ToString();
            var result1 = dt.AsEnumerable().Where(myRow => myRow.Field<string>("Estado") == "En Proceso").AsDataView();
            count2 = result1.Count;
            Label1.Text = count2.ToString();
            r1.DataSource = result;
            r1.DataBind();
        }

        protected void txtbuscar_TextChanged(object sender, EventArgs e)
        {   if(txtbuscar.Text!="")
            {
            var codigoBus = new Modelo.EntidadesPQR();
            codigoBus.Codigo = int.Parse(txtbuscar.Text);
            DataTable dt = mapeo.MostrarPQRIndviCodigo(codigoBus);
            var result = dt.AsEnumerable().Where(myRow => myRow.Field<string>("Codigo") == txtbuscar.Text).AsDataView();
            r1.DataSource = result;
            r1.DataBind();
                error1.Style.Add("display", "none");
            }
            else
            {
                error1.Style.Add("display","block");
            }
        }

        protected void ddestado_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataTable dt = mapeo.MostrarPQRTabla();
            var result = dt.AsEnumerable().Where(myRow => myRow.Field<string>("Estado") == ddestado.Text).AsDataView();
            r1.DataSource = result;
            r1.DataBind();
        }

        protected void btnenviarpqr_Click(object sender, EventArgs e)
        {
            lblcodigo1.Text = ddltor1.Text + ddlapa1.Text;
            codigo = ddltor.Text + ddapa.Text;

            if (codigo != "TorreApartamento" && ddltor.Text != "Torre" && ddapa.Text != "Apartamento" && lblcodigo1.Text != codigo)
            {
                if (f1.HasFile != true)
                {                   
                    //guardar en DB
                    pqr.Codigo = int.Parse(codigo);
                    pqr.DescripcionPQR = txtobservacion.Text;
                    pqr.Estado = ddlista.Text;
                    pqr.Respuesta = lblrespuesta.Text;
                    pqr.FechaRespuesta = lblfecha.Text;
                    pqr.Nombre = txtnombre.Text;
                    pqr.Tipo = ddtipo.Text;
                    pqr.Codigo1 = lblcodigo1.Text;
                    pqr.Asignar = lblarea.Text;
                    mapeo.GuardarPQRSolo(pqr);
                    llamaTablaPqr();
                    error3.Style.Add("display", "block");
                    Div1.Style.Add("display", "none");
                    txtobservacion.Text = "";
                    txtnombre.Text = "";
                    ddtipo.Text = "";
                    ddltor1.DataTextField = "Torre";
                    ddlapa1.DataTextField = "Apartamento";
                    ddltor.DataTextField = "Torre";
                    ddapa.DataTextField = "Apartamento";
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
                                    error2.Style.Add("display", "none");
                                    pqr.Codigo = int.Parse(codigo);
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
                                    llamaTablaPqr();
                                    error3.Style.Add("display", "block");
                                    Div1.Style.Add("display", "none");
                                    txtobservacion.Text = "";
                                    txtnombre.Text = "";
                                    ddtipo.Text = "";
                                ddltor1.DataTextField = "Torre";
                                ddlapa1.DataTextField = "Apartamento";
                                ddltor.DataTextField = "Torre";
                                ddapa.DataTextField = "Apartamento";
                            }
                            }
                            else
                            {
                                throw new Exception("Solo esta permitido subir Imagenes .jpeg, .png y .jpg");
                            }                                            
                    }
                    error3.Style.Add("display", "block");
                    Div1.Style.Add("display", "none");
                    llamaTablaPqr();
                }
            }
            else
            {
                Div1.Style.Add("display", "block");
                ddltor1.DataTextField = "Torre";
                ddlapa1.DataTextField = "Apartamento";
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