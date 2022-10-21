using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace IngenieriaVisualPH.Propietario
{
    public partial class Formulario_web157 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        private DataSet GetData()
        {
            string CS = ConfigurationManager.ConnectionStrings["DBCSRES"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM [tblRestaurante] WHERE Ciudad= 'CIUDAD VERDE' and Tipo='Restaurante'", con);
                DataSet ds = new DataSet();
                da.Fill(ds);
                return ds;
            }
        }
        private DataSet GetData1()
        {
            string CS = ConfigurationManager.ConnectionStrings["DBCSRES"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM [tblRestaurante] WHERE Ciudad= 'CIUDAD VERDE' and Tipo='Servicio'", con);
                DataSet ds = new DataSet();
                da.Fill(ds);
                return ds;
            }
        }
        private DataSet GetData2()
        {
            string CS = ConfigurationManager.ConnectionStrings["DBCSRES"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM [tblRestaurante] WHERE Ciudad= 'CIUDAD VERDE' and Tipo='Productos'", con);
                DataSet ds = new DataSet();
                da.Fill(ds);
                return ds;
            }
        }
        private DataSet GetData3()
        {
            string CS = ConfigurationManager.ConnectionStrings["DBCSRES"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM [tblRestaurante] WHERE Ciudad= 'CIUDAD VERDE' and Tipo='Entretenimiento'", con);
                DataSet ds = new DataSet();
                da.Fill(ds);
                return ds;
            }
        }
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            DataSet ds = GetData1();
            GridView1.DataSource = ds;
            GridView1.DataBind();
            Repeater1.DataSource = ds;
            Repeater1.DataBind();
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            DataSet ds = GetData();
            GridView1.DataSource = ds;
            GridView1.DataBind();
            Repeater1.DataSource = ds;
            Repeater1.DataBind();
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            DataSet ds = GetData2();
            GridView1.DataSource = ds;
            GridView1.DataBind();
            Repeater1.DataSource = ds;
            Repeater1.DataBind();
        }

        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            DataSet ds = GetData3();
            GridView1.DataSource = ds;
            GridView1.DataBind();
            Repeater1.DataSource = ds;
            Repeater1.DataBind();
        }
    }
}