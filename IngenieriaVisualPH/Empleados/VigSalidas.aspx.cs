using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace IngenieriaVisualPH.Empleados
{
    public partial class Formulario_web19 : System.Web.UI.Page
    {
        Datos.MapeoMudanzas mapeo = new Datos.MapeoMudanzas();
        Modelo.EntidadMudanzas usuario = new Modelo.EntidadMudanzas();
        private string Estado = "Autorizado";

        protected void Page_Load(object sender, EventArgs e)
        {
            usuario.Estado = Estado;
            DataTable dt = mapeo.MostrarMudanzaEstado(usuario);
            r1.DataSource = dt;
            r1.DataBind();
        }

    }
}