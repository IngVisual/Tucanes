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
    public partial class Formulario_web115 : System.Web.UI.Page
    {
        int id;
        Datos.Conexion con = new Datos.Conexion();
        protected void Page_Load(object sender, EventArgs e)
        {
            con.Abrir();
            id = 1;
            SqlCommand cmd2 = con.conexion.CreateCommand();
            cmd2.CommandType = CommandType.Text;
            cmd2.CommandText = "select * from tblCarrusel where Id=" + id + "";
            cmd2.ExecuteNonQuery();
            DataTable dt2 = new DataTable();
            SqlDataAdapter da2 = new SqlDataAdapter(cmd2);
            da2.Fill(dt2);
            foreach (DataRow dr2 in dt2.Rows)
            {
                lblimg1.Text = dr2["img1"].ToString();
                lblimg2.Text = dr2["img2"].ToString();
                lblimg3.Text = dr2["img3"].ToString();
                lblimg4.Text = dr2["img4"].ToString();
                lblimg5.Text = dr2["img5"].ToString();
                lblimg6.Text = dr2["img6"].ToString();
                lblimg7.Text = dr2["img7"].ToString();
                lblimg8.Text = dr2["img8"].ToString();
            }
            r2.DataSource = dt2;
            r2.DataBind();
            con.Cerrar();
        }

        protected void btnactualizar_Click(object sender, EventArgs e)
        {
            con.Abrir();
            string path1 = "";
            string path2 = "";
            string path3 = "";
            string path4 = "";
            string path5 = "";
            string path6 = "";
            string path7 = "";
            string path8 = "";
            if (f1.FileName.ToString() != "")
            {
                f1.SaveAs(Request.PhysicalApplicationPath + "/Carrusel/" + f1.FileName.ToString());
                path1 = "Carrusel/" + f1.FileName.ToString();
                SqlCommand cmd = con.conexion.CreateCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = " update tblCarrusel set img1 ='" + path1.ToString() + "' where Id=" + id + "";
                cmd.ExecuteNonQuery();
            }
            if (f2.FileName.ToString() != "")
            {
                f2.SaveAs(Request.PhysicalApplicationPath + "/Carrusel/" + f2.FileName.ToString());
                path2 = "Carrusel/" + f2.FileName.ToString();
                SqlCommand cmd = con.conexion.CreateCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = " update tblCarrusel set img2 ='" + path2.ToString() + "' where Id=" + id + "";
                cmd.ExecuteNonQuery();
                cmd.ExecuteNonQuery();
            }
            if (f3.FileName.ToString() != "")
            {
                f3.SaveAs(Request.PhysicalApplicationPath + "/Carrusel/" + f3.FileName.ToString());
                path3 = "Carrusel/" + f3.FileName.ToString();
                SqlCommand cmd = con.conexion.CreateCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = " update tblCarrusel set img3='" + path3.ToString() + "' where Id=" + id + "";
                cmd.ExecuteNonQuery();
                cmd.ExecuteNonQuery();
            }
            if (f4.FileName.ToString() != "")
            {
                f4.SaveAs(Request.PhysicalApplicationPath + "/Carrusel/" + f4.FileName.ToString());
                path4 = "Carrusel/" + f4.FileName.ToString();
                SqlCommand cmd = con.conexion.CreateCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = " update tblCarrusel set img4 ='" + path4.ToString() + "' where Id=" + id + "";
                cmd.ExecuteNonQuery();
                cmd.ExecuteNonQuery();
            }
            if (f5.FileName.ToString() != "")
            {
                f5.SaveAs(Request.PhysicalApplicationPath + "/Carrusel/" + f5.FileName.ToString());
                path5 = "Carrusel/" + f5.FileName.ToString();
                SqlCommand cmd = con.conexion.CreateCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = " update tblCarrusel set img5 ='" + path5.ToString() + "' where Id=" + id + "";
                cmd.ExecuteNonQuery();
                cmd.ExecuteNonQuery();
            }
            if (f6.FileName.ToString() != "")
            {
                f6.SaveAs(Request.PhysicalApplicationPath + "/Carrusel/" + f6.FileName.ToString());
                path6 = "Carrusel/" + f6.FileName.ToString();
                SqlCommand cmd = con.conexion.CreateCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = " update tblCarrusel set img6 ='" + path6.ToString() + "' where Id=" + id + "";
                cmd.ExecuteNonQuery();
                cmd.ExecuteNonQuery();
            }
            if (f7.FileName.ToString() != "")
            {
                f7.SaveAs(Request.PhysicalApplicationPath + "/Carrusel/" + f7.FileName.ToString());
                path7 = "Carrusel/" + f7.FileName.ToString();
                SqlCommand cmd = con.conexion.CreateCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = " update tblCarrusel set img7 ='" + path7.ToString() + "' where Id=" + id + "";
                cmd.ExecuteNonQuery();
                cmd.ExecuteNonQuery();
            }
            if (f8.FileName.ToString() != "")
            {
                f8.SaveAs(Request.PhysicalApplicationPath + "/Carrusel/" + f8.FileName.ToString());
                path8 = "Carrusel/" + f8.FileName.ToString();
                SqlCommand cmd = con.conexion.CreateCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = " update tblCarrusel set img8 ='" + path8.ToString() + "' where Id=" + id + "";
                cmd.ExecuteNonQuery();
                cmd.ExecuteNonQuery();
            }
            con.Cerrar();
            Response.Redirect("AdmCarrusel.aspx");
        }
    }
}