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
    public partial class Formulario_web155 : System.Web.UI.Page
    {
        Datos.MapeoRegistros mapeo = new Datos.MapeoRegistros();
        Modelo.EntidadBicicleta usuario = new Modelo.EntidadBicicleta();
        private Datos.Conexion con = new Datos.Conexion();
        private int id;
        protected void Page_Load(object sender, EventArgs e)
        {

            id = Convert.ToInt32(Request.QueryString["Id"].ToString());
            if (IsPostBack) return;
            con.Abrir();
            SqlCommand cmd = con.conexion.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "select * from tblCicla where Id=" + id + "";
            cmd.ExecuteNonQuery();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Cerrar();

            foreach (DataRow dr in dt.Rows)
            {
                txtcod.Text = dr["Codigo"].ToString();
                txtnum.Text = dr["ObservacionAdm"].ToString();
                ddestado.Text = dr["Estado"].ToString();
            }
        }

        protected void btnactualizar_Click(object sender, EventArgs e)
        {
            con.Abrir();
            SqlCommand cmd = con.conexion.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "update tblCicla set ObservacionAdm=@ObservacionAdm ,Estado=@Estado  where Id=@Id";
            cmd.Parameters.AddWithValue("@Id", id);
            cmd.Parameters.AddWithValue("@ObservacionAdm", txtnum.Text);
            cmd.Parameters.AddWithValue("@Estado", ddestado.Text);
            cmd.ExecuteNonQuery();
            con.Cerrar();
            Response.Redirect("AdmEspacioBicicletero.aspx");
        }
    }
}