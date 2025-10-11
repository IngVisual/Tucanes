using Datos;
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
    public partial class Formulario_web150 : System.Web.UI.Page
    {
        MapeoAlquilerParqueadero alqparq = new MapeoAlquilerParqueadero();
        TipoAlquiler tipAlquiler = new TipoAlquiler();
        CajaMenor cajamenor = new CajaMenor();

        int TipoConsulta = 8;
        protected void Page_Load(object sender, EventArgs e)
        {
            MostrarTablaUserGuardas();
        }

        public void MostrarTablaUserGuardas()
        {
            tipAlquiler.tipConsulta = TipoConsulta;
            var tabla = alqparq.TablaTipoAlquiler(tipAlquiler);
            DataTable dt = new DataTable();
            r1.DataSource = tabla;
            r1.DataBind();
        }
        protected void btnguardar_Click(object sender, EventArgs e)
        {
            cajamenor.Nombre = txtuser.Text;
            cajamenor.Activo = true;
            alqparq.GuardarUsuario(cajamenor);
            Response.Redirect("AlquilerParqCMAddUser.aspx");
        }
    }
}