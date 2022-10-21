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
    public partial class Propietario : System.Web.UI.MasterPage
    {
        Datos.Conexion con = new Datos.Conexion();
        int codigo;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                lblcodigo.Text = Session["cod"].ToString();
                codigo = int.Parse(lblcodigo.Text);
            }
            catch (Exception)
            {
                throw new Exception("Tiempo de sesion finalizado, por favor ingrese nuevamente a la app");
            }
            Session["cod"] = lblcodigo.Text;
            Session["conj"] = lblconjunto.Text;

            Datos.MapeoCorreo correo = new Datos.MapeoCorreo();
            DataTable dt = correo.MostrarInfoCorreo(codigo);
            var result = dt.AsEnumerable().Where(p=>p.Field<string>("Leido")=="no");
            var count1 = result.Count();
            lblressol.Text = count1.ToString();

            Datos.MapeoNotificaciones notifi = new Datos.MapeoNotificaciones();
            DataTable dt1 = notifi.MostrarInfoNotifi(codigo);
            var result1 = dt1.AsEnumerable().Where(p => p.Field<string>("Leido") == "no");
            var count2 = result1.Count();
            lblmsg.Text = count2.ToString();

            Datos.MapeoSolicitudes mapeo = new Datos.MapeoSolicitudes();
            Modelo.EntidadesPQR pqr1 = new Modelo.EntidadesPQR();
            pqr1.Codigo1 = lblcodigo.Text;
            DataTable dt3 = mapeo.MostrarPQRLLamado(pqr1);
            var result3 = dt3.AsEnumerable().Where(p => p.Field<string>("Estado") == "Cerrada");
            var count3 = result3.Count();
            lblnoti1.Text = count3.ToString();
        }
    }
}