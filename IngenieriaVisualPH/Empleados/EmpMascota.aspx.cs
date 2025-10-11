using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IngenieriaVisualPH.Empleados
{
    public partial class Formulario_web123 : System.Web.UI.Page
    {
        Datos.MapeoMascotas mapeo = new Datos.MapeoMascotas();
        Modelo.EntidadMascota usuario = new Modelo.EntidadMascota();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            try
            {
                usuario.Codigo = int.Parse(txtbuscar.Text);
                DataTable dt = mapeo.MostrarMascotaCodigo(usuario);
                var result = dt.AsEnumerable().Where(myRow => myRow.Field<string>("Estado") == "Registrado").AsDataView();
                r1.DataSource = result;
                r1.DataBind();
            }
            catch (Exception)
            {

            }
        }
    }
}