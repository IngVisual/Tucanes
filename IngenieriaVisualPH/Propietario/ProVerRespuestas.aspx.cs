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
    public partial class Formulario_web161 : System.Web.UI.Page
    {
        Datos.Conexion con = new Datos.Conexion();
        private static int id, codigo;
        private static string tipo;
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
            id = Convert.ToInt32(Request.QueryString["Id"].ToString());
            tipo = Request.QueryString["Tipo"].ToString();
            if (IsPostBack) return;

            if (tipo == "Respuesta de PQR")
            {
                Response.Redirect("RespuestaPQRPropietario.aspx?Id=" + id + "");
            }else if (tipo == "Respuesta Solicitud de Chip")
            {
                Response.Redirect("ProTabResChip.aspx?Id=" + id + "");
            }else if (tipo == "Respuesta de Parqueadero")
            {
                Response.Redirect("ProTabResPar.aspx?Id=" + id + "");
            }else if (tipo == "Respuesta de Mudanza o Articulos")
            {
                Response.Redirect("ProTabResSal.aspx?Id=" + id + "");
            }else if (tipo == "Respuesta Novedad de Saldo")
            {
                Response.Redirect("ProTabResPag.aspx?Id=" + id + "");
            }else if (tipo == "Respuesta de Salon Comunal")
            {
                Response.Redirect("ProTabResSC.aspx?Id=" + id + "");
            }
        }
    }
}