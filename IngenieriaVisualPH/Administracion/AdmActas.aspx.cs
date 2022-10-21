using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data.SqlClient;
using System.Data;

namespace IngenieriaVisualPH.Administracion
{
    public partial class Formulario_web122 : System.Web.UI.Page
    {
        private Datos.Conexion con = new Datos.Conexion();
        Datos.MapeoDescargas mapeo = new Datos.MapeoDescargas();
        Datos.MapeoDescargas usuario = new Datos.MapeoDescargas();
        private bool error = false;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtfechaini.Text = DateTime.Now.ToString("yyyy-MM-dd");
                txtfechafinal.Text = DateTime.Now.ToString("yyyy-MM-dd");
            }
            MostrarDocumento();
        }

        protected void btnnot_Click(object sender, EventArgs e)
        {
            GuardarDocumento();
            DateTime time = DateTime.Now;
            if (error != true)
            {
                usuario._Fecha = time;
                usuario._Nombre = txtnom.Text;
                mapeo.GuardarActa(usuario);
                MostrarDocumento();
                error2.Style.Add("display", "none");
                div1.Style.Add("display", "block");
                txtnom.Text = "";
            }
            else
            {
                error2.Style.Add("display", "block");
                div1.Style.Add("display", "none");
            }
        }

        protected void GuardarDocumento()
        {
            //file1
            string file1 = Path.GetFileName(f1.PostedFile.FileName);
            string fileExtension1 = Path.GetExtension(file1);
            string targetPath1 = Server.MapPath("../Descarga/Acta/");
            if (fileExtension1.ToLower() == ".pdf")
            {
                f1.SaveAs(targetPath1 + file1);
                usuario._Acta = file1;
            }
            else
            {
                error = true;
            }
        }

        protected void MostrarDocumento()
        {
            con.Abrir();     
            SqlDataAdapter da = new SqlDataAdapter("Cargar_FechaActa", con.conexion);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add("@fechaini", SqlDbType.DateTime).Value = txtfechaini.Text;
            da.SelectCommand.Parameters.Add("@fechafinal", SqlDbType.DateTime).Value = txtfechafinal.Text;
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Cerrar();
            r1.DataSource = dt;
            r1.DataBind();
        }

        protected void txtDate_TextChanged(object sender, EventArgs e)
        {
            MostrarDocumento();
        }
    }
}