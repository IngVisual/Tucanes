using System;
using System.Collections.Generic;
using System.IO;
using System.Data;
using Datos;
using System.Data.SqlClient;

namespace IngenieriaVisualPH.Administracion
{
    public partial class Formulario_web138 : System.Web.UI.Page
    {
        private Datos.Conexion con = new Datos.Conexion();
        Datos.MapeoNotificaciones msg = new Datos.MapeoNotificaciones();
        Modelo.EntidadImagenes imag = new Modelo.EntidadImagenes();
        private Conexion acceso = new Conexion();
        private int id;
        DateTime time = DateTime.Now;
        private bool errorpdf = false;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtfechaini.Text = DateTime.Now.AddMonths(-3).ToString("yyyy-MM-dd");
                txtfechafinal.Text = DateTime.Now.AddDays(1).ToString("yyyy-MM-dd");
                MostrarNotificacion();
            }
        }

        protected void MostrarNotificacion()
        {
            con.Abrir();
            SqlDataAdapter da = new SqlDataAdapter("Cargar_NotificacionesFecha", con.conexion);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add("@fechaini", SqlDbType.DateTime).Value = txtfechaini.Text;
            da.SelectCommand.Parameters.Add("@fechafinal", SqlDbType.DateTime).Value = txtfechafinal.Text;
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Cerrar();
            r1.DataSource = dt;
            r1.DataBind();
        }

        protected void BtnEnviar_Click(object sender, EventArgs e)
        {
            if (txtmsg.Text != "" && txttitulo.Text != "")
            {
                id = msg.ObtenerIdMaxMsg();
                msg.GuardarInfMsg(txtmsg.Text, txttitulo.Text, time);
                DataTable dt = acceso.Leer("sp_TablaUsuarioCodigo", null);
                foreach (DataRow item in dt.Rows)
                {
                    int codigo = int.Parse(item["Codigo"].ToString());
                    msg.GuardarInfoBandejaNoti(id, codigo);
                }
                Servicios.Push SendPush = new Servicios.Push(txtmsg.Text, txttitulo.Text);
                txtmsg.Text = "";
                txttitulo.Text = "";
                Response.Redirect("NotificaPushApp.aspx");
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
                    DataTable dt = acceso.Leer("sp_TablaUsuarioCodigo", null);
                    foreach (DataRow item in dt.Rows)
                    {
                        int codigo = int.Parse(item["Codigo"].ToString());
                        msg.GuardarInfoBandejaNoti(id, codigo);
                    }
                    Servicios.Push SendPush = new Servicios.Push(txtmsg.Text, txttitulo.Text);

                    txtmsg.Text = "";
                    txttitulo.Text = "";
                    Response.Redirect("NotificaPushApp.aspx");
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

        protected void txtDate_TextChanged(object sender, EventArgs e)
        {
            MostrarNotificacion();
        }

    }

}