using Datos;
using IngenieriaVisualPH.Empleados;
using Modelo.AlquilerParqueadero;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IngenieriaVisualPH.Administracion
{
    public partial class Formulario_web148 : System.Web.UI.Page
    {
        MapeoAlquilerParqueadero alqparq = new MapeoAlquilerParqueadero();
        TipoAlquiler tipAlquiler = new TipoAlquiler();

        int TipoConsulta = 7;

        protected void Page_Load(object sender, EventArgs e)
        {
            MostrarTablaTipoAlqiler();
        }

        public void MostrarTablaTipoAlqiler()
        {
            tipAlquiler.tipConsulta = TipoConsulta;
            var tabla = alqparq.TablaTipoAlquiler(tipAlquiler);
            DataTable dt = new DataTable();
            R1.DataSource = tabla;
            R1.DataBind();
        }

        protected void btnguardar_Click(object sender, EventArgs e)
        {
            tipAlquiler.IDTiParq = 1;
            tipAlquiler.IDtipoVeh = Convert.ToInt32(ddtipveh.SelectedValue);
            tipAlquiler.IDtar = Convert.ToInt32(ddvalor.SelectedValue);
            tipAlquiler.IDTiptar = 2;
            tipAlquiler.IDtipodia = 1;
            tipAlquiler.IDfree = Convert.ToInt32(ddcantfree.SelectedValue);
            tipAlquiler.IDtarHorFija = 12;
            tipAlquiler.Activo = true;
            tipAlquiler._TipoAlquiler = "Alquiler parqueadero visitante " + ddtipveh.SelectedItem + "-Tarifa Fija 1Hr -Valor Tarifa " + ddvalor.SelectedItem + "- Gratis " + ddcantfree.SelectedItem + " Hr";
            alqparq.RegistroAlquilerParq(tipAlquiler);
            error.Style.Add("display", "block");

        }
    }
}