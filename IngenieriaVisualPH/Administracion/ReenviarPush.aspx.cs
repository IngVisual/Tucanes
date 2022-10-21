using System;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;

namespace IngenieriaVisualPH.Administracion
{
    public partial class Formulario_web143 : System.Web.UI.Page
    {
        Datos.MapeoSolicitudes mapeo = new Datos.MapeoSolicitudes();
        Modelo.EntidadesNovedadSaldo usuario = new Modelo.EntidadesNovedadSaldo();
        private string Asunto, Msg;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["Asunto"] == null) return;
                if (Request.QueryString["Msg"] == null) return;
                Asunto = Request.QueryString["Asunto"].ToString();
                Msg = Request.QueryString["Msg"].ToString();
                ReenviarPush(Msg, Asunto);
            } 
        }
        protected void ReenviarPush(string Msg, string Asunto)
        {
            Servicios.Push SendPush = new Servicios.Push(Msg, Asunto);
            Response.Redirect("NotificaPushApp.aspx");
        }
    }
}