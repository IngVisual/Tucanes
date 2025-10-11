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
    public partial class Formulario_web156 : System.Web.UI.Page
    {
        Datos.MapeoAlquilerParqueadero mapeo = new Datos.MapeoAlquilerParqueadero();
        Modelo.AlquilerParqueadero.Alquiler usuario = new Modelo.AlquilerParqueadero.Alquiler();
        private Datos.Conexion con = new Datos.Conexion();
        private int id;
        protected void Page_Load(object sender, EventArgs e)
        {
            id = Convert.ToInt32(Request.QueryString["Id"].ToString());
            if (IsPostBack) return;
            con.Abrir();
            SqlCommand cmd = con.conexion.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "select * from ParqTbl_Alquiler where IDalquiler=" + id + "";
            cmd.ExecuteNonQuery();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Cerrar();

            foreach (DataRow dr in dt.Rows)
            {
                ddestado.Text = dr["Estado"].ToString();
                txttotal.Text = dr["Total"].ToString();
                txtobserv.Text = dr["Observaciones"].ToString();
            }
        }

        protected void btnactualizar_Click(object sender, EventArgs e)
        {
            con.Abrir();
            SqlCommand cmd = con.conexion.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "update ParqTbl_Alquiler set Total=@Total ,Estado=@Estado,Observaciones=@Observaciones  where IDalquiler=@Id";
            cmd.Parameters.AddWithValue("@Id", id);
            cmd.Parameters.AddWithValue("@Total", txttotal.Text);
            cmd.Parameters.AddWithValue("@Estado", ddestado.Text);
            cmd.Parameters.AddWithValue("@Observaciones", txtobserv.Text);
            cmd.ExecuteNonQuery();
            con.Cerrar();
            Response.Redirect("AlquilerParqueadero.aspx");
        }
    }
}