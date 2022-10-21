using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace IngenieriaVisualPH.Propietario
{
    public partial class Formulario_web139 : System.Web.UI.Page
    {
        Datos.Conexion con = new Datos.Conexion();
        int id;
        protected void Page_Load(object sender, EventArgs e)
        {
            con.Abrir();
            id = Convert.ToInt32(Request.QueryString["Id"].ToString());
            if (IsPostBack) return;
            SqlCommand cmd = con.conexion.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "delete  from tblArriendo where Id=" + id + "";
            cmd.ExecuteNonQuery();
            con.Cerrar();
            Response.Redirect("ProArriVent.aspx");
        }
    }
}