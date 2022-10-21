using System;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;

namespace IngenieriaVisualPH.Administracion
{
    public partial class Formulario_web124 : System.Web.UI.Page
    {
        Datos.MapeoSolicitudes mapeo = new Datos.MapeoSolicitudes();
        Modelo.EntidadesNovedadSaldo usuario = new Modelo.EntidadesNovedadSaldo();
        private string id;
        protected void Page_Load(object sender, EventArgs e)
        {
            id = Request.QueryString["Id"].ToString();
            MostrarPDF(id);
        }
        protected void MostrarPDF(string Id)
        {
            string FilePath = Server.MapPath("../Descarga/Correo/" + Id);
            if (Id.ToString() != "")
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
        }
    }
}