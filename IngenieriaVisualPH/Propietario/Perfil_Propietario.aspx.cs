using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace IngenieriaVisualPH.Propietario
{
    public partial class Formulario_web11 : System.Web.UI.Page
    {
        Datos.MapeoUsuarios mapeo = new Datos.MapeoUsuarios();
        Modelo.EntidadUsuario usuario = new Modelo.EntidadUsuario();
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
            usuario.Codigo = int.Parse(lblcodigo.Text);
            DataTable dt = mapeo.LeerUsuario(usuario);
            if (dt != null)
            {
                if (!IsPostBack)
                {
                    MostrarUsuario(dt);
                }
            }
        }

        protected void btnEditar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Actualizar_Propietario.aspx");
            Session["cod"] = lblcodigo.Text;           
        }
        public void MostrarUsuario(DataTable dt)
        {
            foreach (DataRow item in dt.Rows)
            {
                lblnombre.Text = item["NombrePropietario"].ToString();
                lblapa.Text = item["Codigo"].ToString();
                lblcelular.Text = item["Celular"].ToString();
                lblestado.Text = item["Estado"].ToString();
                lblotrocelular.Text = item["OtroCelular"].ToString();
                lblemail.Text = item["Email"].ToString();
                lblcelarriendo.Text = item["CelularArr"].ToString();
            }
        }
    }
}