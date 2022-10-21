using System;
using System.IO;
using System.Data;
using Datos;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace IngenieriaVisualPH.Administracion
{
    public partial class Formulario_web140 : System.Web.UI.Page
    {
        Datos.MapeoNotificaciones msg = new Datos.MapeoNotificaciones();
        Modelo.EntidadImagenes imag = new Modelo.EntidadImagenes();
        private Conexion acceso = new Conexion();
        private int id, codigo;
        DateTime time = DateTime.Now;
        private bool errorpdf = false;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void Check()
        {
            var checkedIDs = from GridViewRow msgRow in GridView1.Rows
                             where ((CheckBox)msgRow.FindControl("CheckBox1")).Checked
                             select int.Parse(GridView1.DataKeys[msgRow.RowIndex].Value.ToString());
            BuscarCodigo(checkedIDs);
        }

        public void BuscarCodigo(IEnumerable<int> id2)
        {
            foreach (var item in id2)
            {
                int codigo = int.Parse(item.ToString());
                msg.GuardarInfoBandejaNoti(id,codigo);
            }
        }

        protected void BtnEnviar_Click(object sender, EventArgs e)
        {

            if (txtmsg.Text != "" && txttitulo.Text != "")
            {
                id = msg.ObtenerIdMaxMsg();
                msg.GuardarInfMsg(txtmsg.Text, txttitulo.Text, time);
                Check();
                txtmsg.Text = "";
                txttitulo.Text = "";
                Response.Redirect("NotificaPushAppGroup.aspx");
            }
            else
            {
                RequiredFieldValidator1.Text = "* Requerido";
                RequiredFieldValidator2.Text = "* Requerido";
            }
        }

        protected void BtnEnviar2_Click(object sender, EventArgs e)
        {
            VerificarImagen();
            if (errorpdf == false)
            {
                if (txtmsg.Text != "" && txttitulo.Text != "")
                {
                    id = msg.ObtenerIdMaxMsg();
                    CargarImagen();
                    msg.GuardarInfMsg(txtmsg.Text, txttitulo.Text, time);
                    Check();
                    txtmsg.Text = "";
                    txttitulo.Text = "";
                    Response.Redirect("NotificaPushAppGroup.aspx");
                }
                else
                {
                    RequiredFieldValidator1.Text = "* Requerido";
                    RequiredFieldValidator2.Text = "* Requerido";
                }
            }
            else
            {
                error1.Style.Add("display", "block");
            }
        }

        protected void VerificarImagen()
        {
            string filename = Path.GetFileName(f1.PostedFile.FileName);
            string fileExtension = Path.GetExtension(filename);
            if (f1.HasFile == true && fileExtension.ToLower() == ".pdf")
            {
                errorpdf = false;
            }
            else
            {
                errorpdf = true;
            }
        }

        public void CargarImagen()
        {
            string fecha = time.ToString("dddd, dd MMMM yyyy ss");
            string targetPath1 = Server.MapPath("../Descarga/Correo/");
            string filename = Path.GetFileName(f1.PostedFile.FileName);
            string fileExtension = Path.GetExtension(filename);
            string filenameConct1 = Path.GetFileName(fecha + filename);
            if (f1.HasFile == true && fileExtension.ToLower() == ".pdf")
            {
                f1.SaveAs(targetPath1 + filenameConct1);
                imag.Imagen = filenameConct1;
                imag.IdNotif = id;
                msg.GuardarImagen(imag);
            }
        }

        protected void check1_CheckedChanged(object sender, EventArgs e)
        {
            if (check1.Checked == true)
            {
                imagenSi.Style.Add("display", "block");
                BtnEnviar2.Visible = true;
                BtnEnviar.Visible = false;
            }
            else
            {
                imagenSi.Style.Add("display", "none");
                BtnEnviar2.Visible = false;
                BtnEnviar.Visible = true;
            }
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            Check();
        }

    }
}
