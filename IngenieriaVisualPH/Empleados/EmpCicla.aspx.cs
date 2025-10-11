using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace IngenieriaVisualPH.Empleados
{
    public partial class Formulario_web14 : System.Web.UI.Page
    {
        Datos.MapeoRegistros mapeo = new Datos.MapeoRegistros();
        Modelo.EntidadBicicleta usuario = new Modelo.EntidadBicicleta();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            try
            {
                usuario.Codigo = int.Parse(txtbuscar.Text);
                DataTable dt = mapeo.Mostrar_UnaSolBicicodigo(usuario);
                var result = dt.AsEnumerable().Where(myRow => myRow.Field<string>("Estado") == "Autorizado").AsDataView();
                r1.DataSource = result;
                r1.DataBind();
            }
            catch (Exception)
            {

            }
        }
    }
}