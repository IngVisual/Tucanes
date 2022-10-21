using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace IngenieriaVisualPH.Propietario
{
    public partial class Formulario_web140 : System.Web.UI.Page
    {
        Datos.MapeoRegistros mapeo = new Datos.MapeoRegistros();
        Modelo.EntidadCartelera usuario = new Modelo.EntidadCartelera();
        string estado = "Autorizado";
        protected void Page_Load(object sender, EventArgs e)
        {
            usuario.Estado = estado;
            DataTable dt = mapeo.MostrarCarte(usuario);
            r1.DataSource = dt;
            r1.DataBind();
            DataTable dt1 = mapeo.MostrarArrie();
            r2.DataSource = dt1;
            r2.DataBind();
        }
    }
}