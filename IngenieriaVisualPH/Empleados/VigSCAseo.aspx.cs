using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace IngenieriaVisualPH.Empleados
{
    public partial class Formulario_web113 : System.Web.UI.Page
    {
        Datos.MapeoSC mapeo = new Datos.MapeoSC();
        Modelo.EntidadSC usuario = new Modelo.EntidadSC();
        private string Estado = "Autorizado";

        protected void Page_Load(object sender, EventArgs e)
        {
            usuario.Estado = Estado;
            DataTable dt = mapeo.MostrarSCEstado(usuario);
            r1.DataSource = dt;
            r1.DataBind();
        }
    }
}