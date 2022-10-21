using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace IngenieriaVisualPH.Administracion
{
    public partial class Formulario_web142 : System.Web.UI.Page
    {
        Datos.MapeoParqueaderos mapeo = new Datos.MapeoParqueaderos();
        Modelo.EntidadesParqueadero usuario = new Modelo.EntidadesParqueadero();
        private Datos.Conexion con = new Datos.Conexion();
        private int id;
        protected void Page_Load(object sender, EventArgs e)
        {

            id = Convert.ToInt32(Request.QueryString["Id"].ToString());
            if (IsPostBack) return;
            con.Abrir();
            SqlCommand cmd = con.conexion.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "select * from tblParqueaderos where Id=" + id + "";
            cmd.ExecuteNonQuery();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Cerrar();

            foreach (DataRow dr in dt.Rows)
            {
                txtpar.Text = dr["Parqueadero"].ToString();
                txtcod.Text = dr["Codigo"].ToString();
                txtp1.Text = dr["PlacaVehiculo1"].ToString();
                txtp2.Text = dr["PlacaVehiculo2"].ToString();
                txtp3.Text = dr["PlacaVehiculo3"].ToString();
                txtp4.Text = dr["PlacaVehiculo4"].ToString();
                txtobs.Text = dr["Obseravacion"].ToString();
            }
        }

        protected void btnactualizar_Click(object sender, EventArgs e)
        {
            con.Abrir();
            SqlCommand cmd = con.conexion.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "update tblParqueaderos set Codigo=@Codigo ,PlacaVehiculo1=@PlacaVehiculo1 ,PlacaVehiculo2=@PlacaVehiculo2 ,PlacaVehiculo3=@PlacaVehiculo3 ,PlacaVehiculo4=@PlacaVehiculo4 ,Obseravacion=@Obseravacion  where Id=@Id";
            cmd.Parameters.AddWithValue("@Id", id);
            cmd.Parameters.AddWithValue("@Codigo", txtcod.Text);
            cmd.Parameters.AddWithValue("@PlacaVehiculo1", txtp1.Text);
            cmd.Parameters.AddWithValue("@PlacaVehiculo2", txtp2.Text);
            cmd.Parameters.AddWithValue("@PlacaVehiculo3", txtp3.Text);
            cmd.Parameters.AddWithValue("@PlacaVehiculo4", txtp4.Text);
            cmd.Parameters.AddWithValue("@Obseravacion", txtobs.Text);
            cmd.ExecuteNonQuery();
            con.Cerrar();
            Response.Redirect("AdmParqueadero.aspx");
        }
    }
}