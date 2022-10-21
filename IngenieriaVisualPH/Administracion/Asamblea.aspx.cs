using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;

namespace IngenieriaVisualPH.Administracion
{
    public partial class Formulario_web123 : System.Web.UI.Page
    {
        Datos.MapeoDescargas mapeo = new Datos.MapeoDescargas();
        Datos.MapeoDescargas usuario = new Datos.MapeoDescargas();
        private bool error=false;
        protected void Page_Load(object sender, EventArgs e)
        {
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
              mapeo.GuardarDocumento(usuario);
              MostrarDocumento();
              error2.Style.Add("display", "none");
              div1.Style.Add("display", "block");
              txtnom.Text = "";
            }
            else{
              error2.Style.Add("display", "block");
              div1.Style.Add("display", "none");
            }
        }

        protected void GuardarDocumento()
        {
            //file1
            string file1 = Path.GetFileName(f1.PostedFile.FileName);
            string fileExtension1 = Path.GetExtension(file1);
            string targetPath1 = Server.MapPath("../Descarga/Documento/");
            if (fileExtension1.ToLower() == ".pdf")
            {
                f1.SaveAs(targetPath1 + file1);
                usuario._Documento = file1;
            }
            else
            {
                error = true;
            }
        }

        protected void MostrarDocumento()
        {
            DataTable dt = mapeo.MostrarDocAdm();
            r1.DataSource = dt;
            r1.DataBind();
        }
    }
}