using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IngenieriaVisualPH.Propietario
{
    public partial class Formulario_web172 : System.Web.UI.Page
    {
        Datos.MapeoMascotas mapeo = new Datos.MapeoMascotas();
        Modelo.EntidadMascota usuario = new Modelo.EntidadMascota();
        private int codigo;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                codigo = int.Parse(Session["cod"].ToString());
            }
            catch (Exception)
            {
                throw new Exception("Tiempo de sesion finalizado, por favor ingrese nuevamente a la app");
            }
            usuario.Codigo = codigo;
            DataTable dt = mapeo.MostrarMascotaCodigo(usuario);
            var result = dt.AsEnumerable().Where(myRow => myRow.Field<string>("Estado") != "Eliminado").AsDataView();
            r1.DataSource = result;
            r1.DataBind();
        }
    }
}