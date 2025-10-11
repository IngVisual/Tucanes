using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Datos;
using Modelo.AlquilerParqueadero;

namespace IngenieriaVisualPH.Empleados
{
    public partial class Formulario_web117 : System.Web.UI.Page
    {
        MapeoAlquilerParqueadero mosalqu = new MapeoAlquilerParqueadero();
        Alquiler alquiler = new Alquiler();
        int TipoConsulta = 5;

        protected void Page_Load(object sender, EventArgs e)
        {
            GenerarTablaAlquiler();
        }

        public void GenerarTablaAlquiler()
        {
            alquiler.tipoConsulta = TipoConsulta;
            var dt = mosalqu.TablaAlquiler(alquiler);
            r1.DataSource = dt;
            r1.DataBind();
        }
    }
}