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
    public partial class Formulario_web117 : System.Web.UI.Page
    {
        Datos.MapeoRegistros mapeo = new Datos.MapeoRegistros();
        Modelo.EntidadRegistroGeneral usuario = new Modelo.EntidadRegistroGeneral();
        private Datos.Conexion con = new Datos.Conexion();
        private int id;
        protected void Page_Load(object sender, EventArgs e)
        {
            id = Convert.ToInt32(Request.QueryString["Id"].ToString());
            if (IsPostBack) return;
            con.Abrir();
            SqlCommand cmd = con.conexion.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "select * from tblCarteleras where IdCartelera=" + id + "";
            cmd.ExecuteNonQuery();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Cerrar();

            foreach (DataRow dr in dt.Rows)
            {
                txtcodigo.Text = dr["Codigo"].ToString();
                txtnom.Text = dr["Nombre"].ToString();
                txtfecha1.Text = dr["Fecha"].ToString();
                ddestado.Text = dr["Estado"].ToString();
            }
        }

        protected void btnactualizar_Click(object sender, EventArgs e)
        {
                con.Abrir();
                SqlCommand cmd = new SqlCommand("ActualizarCartelera", con.conexion);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Estado", ddestado.Text);
                cmd.Parameters.AddWithValue("@IdCartelera", id);
                cmd.ExecuteNonQuery();
                con.Cerrar();
                Response.Redirect("AdmCartelera.aspx");
        }

        protected void btneliminar_Click(object sender, EventArgs e)
        {
            con.Abrir();
            SqlCommand cmd = con.conexion.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "delete  from tblCarteleras where Id = " + id + "";
            cmd.ExecuteNonQuery();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            con.Cerrar();
            Response.Redirect("AdmCartelera.aspx");

        }
    }
}