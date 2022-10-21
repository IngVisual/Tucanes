using System;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;

namespace IngenieriaVisualPH.Administracion
{
    public partial class Formulario_web126 : System.Web.UI.Page
    {
        Datos.Conexion con = new Datos.Conexion();
        int id;
        private string rutaPDF;
        protected void Page_Load(object sender, EventArgs e)
        {
            con.Abrir();
            id = Convert.ToInt32(Request.QueryString["Id"].ToString());
            if (IsPostBack) return;
            SqlCommand cmd = con.conexion.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "select Acta from tblActa where Id=" + id + "";
            cmd.ExecuteNonQuery();
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            foreach (DataRow dr in dt.Rows)
            {
                rutaPDF = dr["Acta"].ToString();
            }
            string FilePath = Server.MapPath("../Descarga/Acta/" + rutaPDF);
            if (rutaPDF.ToString() != "")
            {
                WebClient User = new WebClient();
                Byte[] FileBuffer = User.DownloadData(FilePath);
                if (FileBuffer != null)
                {
                    Response.ContentType = "application/pdf";
                    Response.AddHeader("content-length", FileBuffer.Length.ToString());
                    Response.BinaryWrite(FileBuffer);
                }
            }
            con.Cerrar();
        }
    }
}