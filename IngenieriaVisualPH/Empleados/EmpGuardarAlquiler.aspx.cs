using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Modelo.AlquilerParqueadero;
using Datos;

namespace IngenieriaVisualPH.Empleados
{
    public partial class Formulario_web120 : System.Web.UI.Page
    {
        private int id, codigoint, dias = 0, horas = 0, TipoConsulta = 2;
        private string Strcodigo, estado = "EN_PROCESO";
        MapeoAlquilerParqueadero regalqu = new MapeoAlquilerParqueadero();
        Alquiler modAlq = new Alquiler();

        protected void Page_Load(object sender, EventArgs e)
        {
            id = Convert.ToInt32(Request.QueryString["IDtipoAlq"].ToString());
            if (IsPostBack) return;
        }

        public bool RegistarPredio()
        {
            Strcodigo = ddltor.Text + ddapa.Text;

            if (Strcodigo != "TorreApartamento" && ddltor.Text != "Torre" && ddapa.Text != "Apartamento")
            {
                codigoint = Convert.ToInt32(Strcodigo);
                return true;
            }
            else
            {
                error2.Style.Add("display", "block");
                return false;
            }
        }

        protected void btnguardar_Click(object sender, EventArgs e)
        {
            DateTime utcNow = DateTime.UtcNow;
            TimeZoneInfo colombiaTimeZone = TimeZoneInfo.FindSystemTimeZoneById("SA Pacific Standard Time");
            DateTime colombiaTime = TimeZoneInfo.ConvertTimeFromUtc(utcNow, colombiaTimeZone);
            DateTime fechaini = colombiaTime;
            DateTime fe = fechaini;
            var condicion = RegistarPredio();
            if (condicion)
            {
                modAlq.Codigo = int.Parse(Strcodigo);
                modAlq.IDtipoAlq = id;
                modAlq.FechaIni = fe;
                modAlq.Placa = txtplaca.Text.Trim();
                modAlq.Marca = txtmarca.Text.Trim();
                modAlq.Nombre = txtnombre.Text.Trim();
                modAlq.Dias = dias;
                modAlq.Horas = horas;
                modAlq.Estado = estado;
                modAlq.NumParqueadero = int.Parse(ddnumparq.Text.Trim());
                modAlq.tipoConsulta = TipoConsulta;
                regalqu.GuardarAlquilerParqueadero(modAlq);
                Response.Redirect("VerTablaAlquiler.aspx");
            }
        }
    }
}