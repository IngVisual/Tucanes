using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IngenieriaVisualPH.Administracion
{
    public partial class Formulario_web146 : System.Web.UI.Page
    {
        Datos.Conexion con = new Datos.Conexion();
        int id;
        string activo;
        protected void Page_Load(object sender, EventArgs e)
        {
            con.Abrir();
            id = Convert.ToInt32(Request.QueryString["Id"].ToString());
            activo = Request.QueryString["Activo"].ToString();
            if (IsPostBack) return;
            SqlCommand cmd = con.conexion.CreateCommand();
            cmd.CommandType = CommandType.Text;
            if (activo == "True") { cmd.CommandText = "update ParqTbl_TipAlquiler set Activo = 0 where IDtipoAlq=" + id + ""; }
            else { cmd.CommandText = "update ParqTbl_TipAlquiler set Activo = 1 where IDtipoAlq=" + id + ""; }
            cmd.ExecuteNonQuery();
            con.Cerrar();
            Response.Redirect("AlquilerParqueaderoConfig.aspx");
        }
    }
}