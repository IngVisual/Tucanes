using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace IngenieriaVisualPH.Propietario
{
    public partial class Formulario_web163 : System.Web.UI.Page
    {
        Datos.MapeoNotificaciones notifi = new Datos.MapeoNotificaciones();
        Datos.MapeoNotificaciones notifi1 = new Datos.MapeoNotificaciones();
        private int id=0, id2;
        private string Strid2;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                lblcodigo.Text = Session["cod"].ToString();
            }
            catch (Exception)
            {
                throw new Exception("Tiempo de sesion finalizado, por favor ingrese nuevamente a la app");
            }
            try
            {
                id = Convert.ToInt32(Request.QueryString["Id"].ToString());
                if (IsPostBack) return;
                notifi.ActualizarInfoNotifica(id);
                DataTable dt = notifi.MostrarInfoNotifiTablaID(id);
                foreach (DataRow item in dt.Rows)
                {
                    lblasuto.Text = item["Asunto"].ToString();
                    lblmsg.Text = item["Mensaje"].ToString();
                    lblfecha.Text = item["Fecha"].ToString();
                    Strid2 = item["Id"].ToString();
                    id2 = int.Parse(item["Id"].ToString());
                }
                if(Strid2!="")
                {        
                notifi1._IdNot = id2;
                DataTable dt1 = notifi1.MostrarNotifiPDF(notifi1);
                if (dt1.Rows.Count > 0)
                {
                    r1.Visible = true;
                    r1.DataSource = dt;
                    r1.DataBind();
                }
            }
            }
            catch
            {

            }
        }
    }
}