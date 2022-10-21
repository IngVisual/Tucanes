using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Net;

namespace IngenieriaVisualPH.Propietario
{
    public partial class Formulario_web159 : System.Web.UI.Page
    {
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