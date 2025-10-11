using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Datos;
using Modelo.AlquilerParqueadero;

namespace IngenieriaVisualPH.Propietario
{
    public partial class Formulario_web166 : System.Web.UI.Page
    {
        MapeoAlquilerParqueadero mosalqu = new MapeoAlquilerParqueadero();
        Alquiler alquiler = new Alquiler();
        int TipoConsulta = 6;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                lblcodigo.Text = Session["cod"].ToString();
            }
            catch (Exception)
            {
                throw new Exception("Tiempo de sesion finalizado, por favor ingrese nuevamente a la app");
            }
            GenerarTablaAlquiler();
        }

        public void GenerarTablaAlquiler()
        {
            alquiler.Codigo = int.Parse(lblcodigo.Text);
            alquiler.tipoConsulta = TipoConsulta;
            var dt = mosalqu.TablaAlquilerCodigo(alquiler);
            r1.DataSource = dt;
            r1.DataBind();
        }
    }
}