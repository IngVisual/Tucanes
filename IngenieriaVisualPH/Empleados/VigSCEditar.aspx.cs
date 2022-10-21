using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace IngenieriaVisualPH.Empleados
{
    public partial class Formulario_web111 : System.Web.UI.Page
    {
        Datos.MapeoSC mapeo = new Datos.MapeoSC();
        Modelo.EntidadSC usuario = new Modelo.EntidadSC();
        Datos.Conexion con = new Datos.Conexion();
        int id;
        protected void Page_Load(object sender, EventArgs e)
        {
            con.Abrir();
            id = Convert.ToInt32(Request.QueryString["Id"].ToString());
            if (IsPostBack) return;
            SqlCommand cmd = con.conexion.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "select Id,Estado,Codigo  from tblSalonComunal where Id=" + id + "";
            cmd.ExecuteNonQuery();
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            foreach (DataRow dr in dt.Rows)
            {
                lblcodigo.Text = dr["Codigo"].ToString();
            }
            con.Cerrar();
        }
        protected void ddestado_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddestado.Text == "Novedad" && txtobservacion.Text == "")
            {
                error1.Style.Add("display", "block");
                ddestado.Text = "Autorizado";
            }
            else
            {
                usuario._Id = id;
                usuario.Estado = ddestado.Text;
                usuario._ObservacionAdm = txtobservacion.Text;
                mapeo.ActualizarMudanzaSC(usuario);
                Response.Redirect("VigSC.aspx");
            }
        }
    }
}