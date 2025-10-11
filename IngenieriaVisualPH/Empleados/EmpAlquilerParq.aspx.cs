using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Datos;
using Modelo.AlquilerParqueadero;

namespace IngenieriaVisualPH.Empleados
{
    public partial class Formulario_web119 : System.Web.UI.Page
    {
        MapeoAlquilerParqueadero alqparq = new MapeoAlquilerParqueadero();
        TipoAlquiler tipAlquiler = new TipoAlquiler();

        int TipoConsulta = 1;

        protected void Page_Load(object sender, EventArgs e)
        {
            MostrarTablaTipoAlqiler();
        }

        public void MostrarTablaTipoAlqiler()
        {
            tipAlquiler.tipConsulta = TipoConsulta;
            var tabla = alqparq.TablaTipoAlquiler(tipAlquiler);
            R1.DataSource = tabla;
            R1.DataBind();
        }
    }
}