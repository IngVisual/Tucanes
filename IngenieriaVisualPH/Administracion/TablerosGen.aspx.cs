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
    public partial class Formulario_web134 : System.Web.UI.Page
    {
        Datos.MapeoGeneral mapeo = new Datos.MapeoGeneral();
        private string _tipo;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtfechaini.Text = DateTime.Now.ToString("yyyy-MM-dd");
                txtfechafinal.Text = DateTime.Now.ToString("yyyy-MM-dd");
            }
        }

        protected void btnconsulta_Click(object sender, EventArgs e)
        {
            if (ddestado.Text == "Apartamentos")
            {
                _tipo = "Apartamentos";
                MostrarTablas(_tipo, Convert.ToDateTime(txtfechaini.Text), Convert.ToDateTime(txtfechafinal.Text).AddHours(24));
            }
            else if (ddestado.Text == "PQRS")
            {
                _tipo = "PQRS";
                MostrarTablas(_tipo, Convert.ToDateTime(txtfechaini.Text), Convert.ToDateTime(txtfechafinal.Text).AddHours(24));
            }
            else if (ddestado.Text == "Novedades de Saldo")
            {
                _tipo = "Saldo";
                MostrarTablas(_tipo, Convert.ToDateTime(txtfechaini.Text), Convert.ToDateTime(txtfechafinal.Text).AddHours(24));
            }
            else if (ddestado.Text == "Solicitudes de Mudanzas")
            {
                _tipo = "Mudanza";
                MostrarTablas(_tipo, Convert.ToDateTime(txtfechaini.Text), Convert.ToDateTime(txtfechafinal.Text).AddHours(24));
            }
            else if (ddestado.Text == "Solicitudes de Parqueaderos")
            {
                _tipo = "SolParqueadero";
                MostrarTablas(_tipo, Convert.ToDateTime(txtfechaini.Text), Convert.ToDateTime(txtfechafinal.Text).AddHours(24));
            }
            else if (ddestado.Text == "Solicitudes de SALON SOCIAL")
            {
                _tipo = "SC";
                MostrarTablas(_tipo, Convert.ToDateTime(txtfechaini.Text), Convert.ToDateTime(txtfechafinal.Text).AddHours(24));
            }
            else if (ddestado.Text == "Solicitudes de Chips")
            {
                _tipo = "Chip";
                MostrarTablas(_tipo, Convert.ToDateTime(txtfechaini.Text), Convert.ToDateTime(txtfechafinal.Text).AddHours(24));
            }
            else if (ddestado.Text == "Registro de Visitantes")
            {
                _tipo = "Visitantes";
                MostrarTablas(_tipo, Convert.ToDateTime(txtfechaini.Text), Convert.ToDateTime(txtfechafinal.Text).AddHours(24));
            }
            else if (ddestado.Text == "Registro General")
            {
                _tipo = "General";
                MostrarTablas(_tipo, Convert.ToDateTime(txtfechaini.Text), Convert.ToDateTime(txtfechafinal.Text).AddHours(24));
            }
            else if (ddestado.Text == "Registro de Bicicletas")
            {
                _tipo = "Bicicletas";
                MostrarTablas(_tipo, Convert.ToDateTime(txtfechaini.Text), Convert.ToDateTime(txtfechafinal.Text).AddHours(24));
            }
            else if (ddestado.Text == "Tablero de Parqueaderos")
            {
                _tipo = "Parqueadero";
                MostrarTablas(_tipo, Convert.ToDateTime(txtfechaini.Text), Convert.ToDateTime(txtfechafinal.Text).AddHours(24));
            }
            else if (ddestado.Text == "Tablero de Notificaciones")
            {
                _tipo = "Notificaciones";
                MostrarTablas(_tipo, Convert.ToDateTime(txtfechaini.Text), Convert.ToDateTime(txtfechafinal.Text).AddHours(24));
            }
            else if (ddestado.Text == "Tablero de Alquiler Parqueadero")
            {
                _tipo = "AlquilerParqueadero";
                MostrarTablas(_tipo, Convert.ToDateTime(txtfechaini.Text), Convert.ToDateTime(txtfechafinal.Text).AddHours(24));
            }
            else if (ddestado.Text == "Tablero de Caja Menor Parqueaderos")
            {
                _tipo = "CajaMenor";
                MostrarTablas(_tipo, Convert.ToDateTime(txtfechaini.Text), Convert.ToDateTime(txtfechafinal.Text).AddHours(24));
            }
            else if (ddestado.Text == "Tablero de Mascotas")
            {
                _tipo = "Mascotas";
                MostrarTablas(_tipo, Convert.ToDateTime(txtfechaini.Text), Convert.ToDateTime(txtfechafinal.Text).AddHours(24));
            }
        }

        public void ExportarExcel(DataTable tabla)
        {
            Response.ClearContent();
            // Specify the default file name using "content-disposition" RESPONSE header
            Response.AppendHeader("content-disposition", "attachment; filename=TablerosPH.xls");
            // Set excel as the HTTP MIME type
            Response.ContentType = "application/excel";
            // Create an instance of stringWriter for writing information to a string
            StringWriter stringWriter = new StringWriter();
            // Create an instance of HtmlTextWriter class for writing markup 
            // characters and text to an ASP.NET server control output stream
            HtmlTextWriter htw = new HtmlTextWriter(stringWriter);
            GridView excel = new GridView();
            excel.DataSource = tabla;
            excel.DataBind();
            excel.RenderControl(new HtmlTextWriter(htw));
            Response.Write(stringWriter.ToString());
            Response.End();
            Response.Redirect("TableroGen.aspx");
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Confirms that an HtmlForm control is rendered for the specified ASP.NET 
             server control at run time. */
        }

        protected void MostrarTablas(string tipo, DateTime fechini, DateTime fechafin)
        {
            mapeo._Tipo = tipo;
            mapeo._FechaIni = fechini;
            mapeo._FechaFin = fechafin;
            DataTable dt= mapeo.MostrarTableros(mapeo);
            ExportarExcel(dt);
        }
    }
}