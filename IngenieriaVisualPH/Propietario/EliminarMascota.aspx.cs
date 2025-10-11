using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IngenieriaVisualPH.Propietario
{
    public partial class Formulario_web169 : System.Web.UI.Page
    {
        Datos.MapeoMascotas mapeo = new Datos.MapeoMascotas();
        Modelo.EntidadMascota usuario = new Modelo.EntidadMascota();
        private Datos.Conexion con = new Datos.Conexion();
        private int id;
        private string estado = "Eliminado";
        protected void Page_Load(object sender, EventArgs e)
        {
            id = Convert.ToInt32(Request.QueryString["Id"].ToString());
            if (IsPostBack) return;
            con.Abrir();
            SqlCommand cmd = con.conexion.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "update tblMascota set Estado=@Estado  where Id=@Id";
            cmd.Parameters.AddWithValue("@Id", id);
            cmd.Parameters.AddWithValue("@Estado", estado);
            cmd.ExecuteNonQuery();
            con.Cerrar();
            Response.Redirect("VerMascotas.aspx");

        }
    }
}