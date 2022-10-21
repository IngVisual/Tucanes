using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;    

namespace IngenieriaVisualPH.Propietario
{
    public partial class Formulario_web149 : System.Web.UI.Page
    {
        private int codigo;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                codigo = int.Parse(Session["cod"].ToString());
            }
            catch (Exception)
            {
                throw new Exception("Tiempo de sesion finalizado, por favor ingrese nuevamente a la app");
            }
            if(!IsPostBack)
            { 
            Datos.MapeoNotificaciones notifi = new Datos.MapeoNotificaciones();
            DataTable dt = notifi.MostrarInfoNotifiTabla10(codigo);
            r1.DataSource = dt;
            r1.DataBind();
            };
        }

        protected void btnactualizar_Click(object sender, EventArgs e)
        {
            Datos.MapeoNotificaciones notifi = new Datos.MapeoNotificaciones();
            DataTable dt = notifi.MostrarInfoNotifiTabla(codigo);
            r1.DataSource = dt;
            r1.DataBind();
        }
    }
}