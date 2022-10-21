using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace IngenieriaVisualPH.Administracion
{
    public partial class Formulario_web136 : System.Web.UI.Page
    {
        Datos.Conexion con = new Datos.Conexion();
        private int id;
        private string Estadoa3= "Cerrada";
        protected void Page_Load(object sender, EventArgs e)
        {
            con.Abrir();
            id = Convert.ToInt32(Request.QueryString["Id"].ToString());
            if (IsPostBack) return;
            SqlCommand cmd = con.conexion.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "select * from tblNota where Id=" + id + "";
            cmd.ExecuteNonQuery();
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            con.Cerrar();

            Datos.MapeoNota nota = new Datos.MapeoNota();
            nota.Actualizar(id, Estadoa3);
            Response.Redirect("AdmVerSol.aspx");
        }
    }
}