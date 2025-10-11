using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Drawing;
using System.Drawing.Drawing2D;

namespace IngenieriaVisualPH.Propietario
{
    public partial class Formulario_web145 : System.Web.UI.Page
    {
        private Datos.Conexion con = new Datos.Conexion();
        Datos.MapeoChip mapeochip = new Datos.MapeoChip();
        Modelo.EntidadChip chip = new Modelo.EntidadChip();
        Datos.MapeoOtrosPagos mapeo2 = new Datos.MapeoOtrosPagos();
        Modelo.EntidadImagenes imag = new Modelo.EntidadImagenes();
        int codigo;
        string estado = "Solicitud";
        string respuesta = "Pendiente";
        static Int32 applicationid = 0, applicationid2 = 0, idestado = 0;
        bool error;
        string conjunto;
        string asunto = "SOLICTUD DE CHIP";
        string Email;

        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable dt = mapeo2.MostrarvalorChip();
            r1.DataSource = dt;
            r1.DataBind();
            try
            {
                codigo = int.Parse(Session["cod"].ToString());
                conjunto = Session["conj"].ToString();
            }
            catch (Exception)
            {
                throw new Exception("Tiempo de sesion finalizado, por favor ingrese nuevamente a la app");
            }
            MostrarDatos();
            ObtenerId();
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
                lblmsg2.Text = item["MsgChip"].ToString();
            }
            if (lblmsg2.Text != "")
            {
                mensaje.Style.Add("display", "block");
            }
            else { mensaje.Style.Add("display", "none"); }
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
        public void ObtenerId()
        {
            chip.Codigo = codigo;
            chip.Estado = estado;
            int valor = 1; //Se bloquea metodo que evalua si la solictud ya tiene carga un recibo /*mapeochip.EvaluarEstadoChip(chip);*/
            if(valor==1)
            {
                chip.Codigo = codigo;
                chip.Estado = estado;
                //DataTable dt1 = mapeochip.BuscarEstadoChip(chip);
                //foreach (DataRow item in dt1.Rows)
                //{
                //    idestado = int.Parse(item["IdMax"].ToString());
                //}
            }
            else
            {
                //idestado = 0;
            }
            if (valor>0)
            {
                FileUpload2.Visible = false;
                FileUpload2.Enabled = false;
                btnsave.Visible = false;
                btnsave2.Visible = true;
                //MostrarImagenRecibo(idestado);
            }
            else
            {
                imagenrec.Style.Add("display","none");
                btnsave.Visible = true;
                btnsave2.Visible = false;
            }
        }

        protected void btnsave_Click(object sender, EventArgs e)
        {
            //GuardarRegistroConRecibo();
        }
        protected void btnsave2_Click(object sender, EventArgs e)
        {
            GuardarRegistroSinRecibo();
        }
        //public void GuardarRegistroConRecibo()
        //{
        //    ObtenerIdMaxRecibo();
        //    con.Cerrar(); //entrega el mayor id + 1 de tblrecibo
        //    GuardarImagen1();
        //    ObtenerIdMaxSolChip();
        //    con.Cerrar(); //entrega el mayor id + 1 de tblChip
        //    RegistroConRecibo();
        //}
        public void GuardarRegistroSinRecibo()
        {
            ObtenerIdMaxSolChip();
            con.Cerrar(); //entrega el mayor id + 1 de tblChip
            GuardarImagen2();
            RegistroSinRecibo();
        }
        //public void ObtenerIdMaxRecibo()
        //{
        //    con.Abrir();
        //    String query = "select IdChipIR from tblChipImagenRecibo";
        //    SqlCommand cmd = new SqlCommand();
        //    cmd.CommandText = query;
        //    cmd.Connection = con.conexion;
        //    SqlDataAdapter da = new SqlDataAdapter();
        //    da.SelectCommand = cmd;
        //    DataSet ds = new DataSet();
        //    da.Fill(ds);
        //    if (ds.Tables[0].Rows.Count < 1)
        //    {
        //        applicationid = 1;
        //    }
        //    else
        //    {
        //        String query1 = "select max(IdChipIR) from tblChipImagenRecibo ";
        //        SqlCommand cmd1 = new SqlCommand();
        //        cmd1.CommandText = query1;
        //        cmd1.Connection = con.conexion;
        //        SqlDataAdapter da1 = new SqlDataAdapter();
        //        da1.SelectCommand = cmd1;
        //        DataSet ds1 = new DataSet();
        //        da1.Fill(ds1);
        //        applicationid = Convert.ToInt32(ds1.Tables[0].Rows[0][0].ToString());
        //        applicationid = applicationid + 1;
        //    }
        //}//obtener id tblRecibo
        public void ObtenerIdMaxSolChip()
        {
            con.Abrir();
            String query = "select Id from tblChip";
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = query;
            cmd.Connection = con.conexion;
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            DataSet ds = new DataSet();
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count < 1)
            {
                applicationid2 = 1;
            }
            else
            {
                String query1 = "select max(Id) from tblChip ";
                SqlCommand cmd1 = new SqlCommand();
                cmd1.CommandText = query1;
                cmd1.Connection = con.conexion;
                SqlDataAdapter da1 = new SqlDataAdapter();
                da1.SelectCommand = cmd1;
                DataSet ds1 = new DataSet();
                da1.Fill(ds1);
                applicationid2 = Convert.ToInt32(ds1.Tables[0].Rows[0][0].ToString());
                applicationid2 = applicationid2 + 1;
            }
        }//obtener id tblChip
        //public void GuardarImagen1()
        //{
        //    lblMessage.Visible = false;
        //    DateTime time = DateTime.Now;
        //    string fecha = time.ToString("dddd, dd MMMM yyyy ss");

        //    //file1
        //    string file1 = Path.GetFileName(FileUpload1.PostedFile.FileName);
        //    string fileExtension1 = Path.GetExtension(file1);
        //    string filenameConct1 = Path.GetFileName(codigo + fecha + file1);
        //    string targetPath1 = Server.MapPath("../Chip/Documento/");


        //    //file2
        //    string file2 = Path.GetFileName(FileUpload2.PostedFile.FileName);
        //    string fileExtension2 = Path.GetExtension(file2);
        //    string filenameConct2 = Path.GetFileName(codigo + fecha + file2);
        //    string targetPath2 = Server.MapPath("../Chip/Recibo/");

        //    Stream strm1 = FileUpload1.PostedFile.InputStream;
        //    Stream strm2 = FileUpload2.PostedFile.InputStream;

        //    if (fileExtension1.ToLower() == ".png" || fileExtension1.ToLower() == ".jpg" || fileExtension1.ToLower() == ".jpeg")
        //    {
        //        if (fileExtension2.ToLower() == ".png" || fileExtension2.ToLower() == ".jpg" || fileExtension2.ToLower() == ".jpeg")
        //        {
        //            using (var image1 = System.Drawing.Image.FromStream(strm1))
        //            {
        //                var newWidth1 = (int)(image1.Width * 0.5);
        //                // can given height of image as we want  
        //                var newHeight1 = (int)(image1.Height * 0.5);
        //                var thumbnailImg1 = new Bitmap(newWidth1, newHeight1);
        //                var thumbGraph1 = Graphics.FromImage(thumbnailImg1);
        //                thumbGraph1.CompositingQuality = CompositingQuality.HighQuality;
        //                thumbGraph1.SmoothingMode = SmoothingMode.HighQuality;
        //                thumbGraph1.InterpolationMode = InterpolationMode.HighQualityBicubic;
        //                var imageRectangle1 = new Rectangle(0, 0, newWidth1, newHeight1);
        //                thumbGraph1.DrawImage(image1, imageRectangle1);
        //                thumbnailImg1.Save(targetPath1 + filenameConct1);
        //                imag.DocumentoChip = filenameConct1;
        //            }
        //            using (var image2 = System.Drawing.Image.FromStream(strm2))
        //            {
        //                var newWidth2 = (int)(image2.Width * 0.5);
        //                // can given height of image as we want  
        //                var newHeight2 = (int)(image2.Height * 0.5);
        //                var thumbnailImg2 = new Bitmap(newWidth2, newHeight2);
        //                var thumbGraph2 = Graphics.FromImage(thumbnailImg2);
        //                thumbGraph2.CompositingQuality = CompositingQuality.HighQuality;
        //                thumbGraph2.SmoothingMode = SmoothingMode.HighQuality;
        //                thumbGraph2.InterpolationMode = InterpolationMode.HighQualityBicubic;
        //                var imageRectangle2 = new Rectangle(0, 0, newWidth2, newHeight2);
        //                thumbGraph2.DrawImage(image2, imageRectangle2);
        //                thumbnailImg2.Save(targetPath2 + filenameConct2);
        //                imag.ReciboChip = filenameConct2;
        //            }
        //        }
        //        else
        //        {
        //            error = true;
        //        }
        //    }
        //    else
        //    {
        //        error = true;
        //    }
        //}// guaradr imagen si no existe id en tbl recibo
        public void GuardarImagen2()
        {
            lblMessage.Visible = false;
            DateTime time = DateTime.Now;
            string fecha = time.ToString("dddd, dd MMMM yyyy ss");

            //file1
            string file1 = Path.GetFileName(FileUpload1.PostedFile.FileName);
            string fileExtension1 = Path.GetExtension(file1);
            string filenameConct1 = Path.GetFileName(codigo + fecha + file1);
            string targetPath1 = Server.MapPath("../Chip/Documento/");

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
                        imag.DocumentoChip = filenameConct1;
                    }
                }
                else
                {
                    error = true;
                }
        }//guaradr imagen si existe id en tbl recibo
        //public void RegistroConRecibo()//registrar datos + recibo + documento
        //{
        //    if (error == false)
        //    {
        //        chip.Codigo = codigo;
        //        chip.Estado = estado;
        //        chip._Respuesta = respuesta;
        //        chip._Tipo = ddtipo.Text;
        //        chip._Destinado = ddcanti.Text;
        //        chip._Nombre = txtnombre.Text;
        //        chip._Documento = txtcedula.Text;
        //        chip._Perdida = txtperdida.Text;
        //        chip._Nuevo = ddnuevo.Text;
        //        chip._IdRec = applicationid;
        //        imag.IdChip = applicationid2;
        //        mapeochip.RegistroChipConRecibo(chip,imag);
        //        error3.Style.Add("display","block");
        //    }
        //    else
        //    {
        //        lblMessage.Visible = true;
        //        lblMessage.Text = "(Recibo o Documento) Solo permite imagenes .png , .jpg , .jpeg.// Si es un .pdf, haga una captura de pantalla del pdf y adjunte la captura de pantalla,Ingrese nuevamente y finalice el registro";
        //    }
        //}
        public void RegistroSinRecibo()//registrar datos + documento
        {
            if (error == false)
            {
                chip.Codigo = codigo;
                chip.Estado = estado;
                chip._Respuesta = respuesta;
                chip._Tipo = ddtipo.Text;
                chip._Destinado = ddcanti.Text;
                chip._Nombre = txtnombre.Text;
                chip._Documento = txtcedula.Text;
                chip._Perdida = txtperdida.Text;
                chip._Nuevo = ddnuevo.Text;
                //chip._IdRec = idestado;
                imag.IdChip = applicationid2;
                mapeochip.RegistroChipSinRecibo(chip, imag);
                Response.Redirect("ProTabResChip.aspx");
            }
            else
            {
                lblMessage.Visible = true;
                lblMessage.Text = "(Documento) Solo permite imagenes .png , .jpg , .jpeg. Si es un .pdf, haga una captura de pantalla del pdf y adjunte la captura de pantalla,Ingrese nuevamente y finalice el registro";
            }
        }
        //public void MostrarImagenRecibo(int id_estado)
        //{
        //    imagenrec.Style.Add("display", "block");
        //    f2.Style.Add("display", "none");
        //    imag.IdChipRec = id_estado;
        //    DataTable dt1=  mapeochip.BuscarRecibo(imag);
        //    repet1.DataSource = dt1;
        //    repet1.DataBind();
        //}
    }
}