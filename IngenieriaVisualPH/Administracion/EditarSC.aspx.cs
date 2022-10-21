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
    public partial class Formulario_web131 : System.Web.UI.Page
    {
        Datos.MapeoSaldos mapeo = new Datos.MapeoSaldos();
        Datos.MapeoOtrosPagos mapeo2 = new Datos.MapeoOtrosPagos();
        Modelo.EntidadValores valores = new Modelo.EntidadValores();
        Datos.Conexion con = new Datos.Conexion();
        private int id, idAdm;
        private string Tipo;
        protected void Page_Load(object sender, EventArgs e)
        {
            con.Abrir();
            id = Convert.ToInt32(Request.QueryString["Id"].ToString());
            if (IsPostBack) return;
            SqlCommand cmd = con.conexion.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "select ValorSC,SalCom  from tblValorSC where IdSC=" + id + "";
            cmd.ExecuteNonQuery();
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            foreach (DataRow dr in dt.Rows)
            {
                txtvasc.Text = dr["ValorSC"].ToString();
                txtsc.Text = dr["SalCom"].ToString();
            }
            con.Cerrar();
        }

        protected void btnsc_Click(object sender, EventArgs e)
        {
            Tipo = "SC";
            idAdm = 0;
            valores.Idsp = id;
            valores.Id = idAdm;
            valores.Tipo = Tipo;
            valores.ValorAdm = int.Parse(txtvasc.Text);
            valores.Observ = txtsc.Text;
            mapeo2.ActualizarValor(valores);
            Response.Redirect("Configuracion.aspx");
        }
    }
}