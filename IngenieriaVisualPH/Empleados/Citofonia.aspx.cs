using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace IngenieriaVisualPH.Empleados
{
    public partial class Formulario_web11 : System.Web.UI.Page
    {
        private Datos.Conexion con =new Datos.Conexion();
        Datos.MapeoUsuarios mapeo = new Datos.MapeoUsuarios();
        Modelo.EntidadUsuario usuario = new Modelo.EntidadUsuario();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtfechaini.Text = DateTime.Now.ToString("yyyy-MM-dd");
                txtfechafinal.Text = DateTime.Now.ToString("yyyy-MM-dd");
            }
        }

        protected void txtbuscar_TextChanged(object sender, EventArgs e)
        {
            teclado.Style.Add("display","none");
            telefonos.Style.Add("display", "block");

            BuscarCodigo();
            string cel1 = txttel1.Text;
            string tel1 = Label1.Text;
            if (Label1.Text != "" & txttel1.Text != "")
            {
                HyperLink1.Text = tel1 + cel1;
                HyperLink1.NavigateUrl = tel1 + cel1;
                lblok.Visible = true;
            }
            string cel2 = txttel2.Text;
            string tel2 = Label2.Text;
            if (Label2.Text != "" & txttel2.Text != "")
            {
                HyperLink2.Text = tel2 + cel2;
                HyperLink2.NavigateUrl = tel2 + cel2;
                lblok1.Visible = true;
            }
            string cel3 = txttel3.Text;
            string tel3 = Label3.Text;
            if (Label3.Text != "" & txttel3.Text != "")
            {
                HyperLink3.Text = tel3 + cel3;
                HyperLink3.NavigateUrl = tel3 + cel3;
                lblok2.Visible = true;
            }
            BindGidView();
            buscar();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Citofonia.aspx");
        }

        public void BuscarCodigo()
        {
            usuario.Codigo = int.Parse(txtbuscar.Text);
            DataTable dt = mapeo.LeerUsuario(usuario);
            foreach (DataRow item in dt.Rows)
            {
                txttel1.Text = item["Celular"].ToString();
                txttel2.Text = item["OtroCelular"].ToString();
                txttel3.Text = item["CelularArr"].ToString();
                lblpro.Text = item["NombProhibidoIngreso"].ToString();
                lblmay.Text = item["NombMayores"].ToString();
                lblmen.Text = item["NombMenores"].ToString();
            }
        }

        private void BindGidView()
        {
            try
            {
                con.Abrir();
                SqlCommand cmd = new SqlCommand("select * from tblIngresoVis", con.conexion);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);
                DataTable dt = ds.Tables[0];
                GridView1.DataSource = dt;
                if (dt.Rows.Count > 0)
                {
                    GridView1.Visible = true;
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                }
                else
                {
                    GridView1.Visible = false;
                }
                con.Cerrar();
            }
            catch (Exception error)
            {

            }
        }
        private void buscar()
        {
            con.Abrir();
            SqlDataAdapter da = new SqlDataAdapter("Cargar_FechaVisita", con.conexion);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add("@fechaini", SqlDbType.DateTime).Value = txtfechaini.Text;
            da.SelectCommand.Parameters.Add("@fechafinal", SqlDbType.DateTime).Value = txtfechafinal.Text;
            da.SelectCommand.Parameters.Add("@Codigo", SqlDbType.Text).Value = txtbuscar.Text;
            DataSet ds = new DataSet();
            da.Fill(ds);
            DataTable dt = ds.Tables[0];
            GridView1.DataSource = dt;
            if (dt.Rows.Count > 0)
            {
                GridView1.Visible = true;
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
            else
            {
                GridView1.Visible = false;
            }
            con.Cerrar();
        }

    }
}