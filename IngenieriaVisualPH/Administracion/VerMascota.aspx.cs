using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IngenieriaVisualPH.Administracion
{
    public partial class Formulario_web158 : System.Web.UI.Page
    {
        Datos.MapeoMascotas mapeo = new Datos.MapeoMascotas();
        Modelo.EntidadMascota usuario = new Modelo.EntidadMascota();
        Datos.MapeoCorreo mapeoCorreo = new Datos.MapeoCorreo();
        private int id;
        private string conjunto;
        private string Asunto = "Registro de Mascota";
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                conjunto = Session["conj"].ToString();
            }
            catch (Exception)
            {
                throw new Exception("Tiempo de sesion finalizado, por favor ingrese nuevamente a la app");
            }
            id = Convert.ToInt32(Request.QueryString["Id"].ToString());
            if (IsPostBack) return;
            usuario.Id = id;
            DataTable dt = mapeo.MostrarMascotaId(usuario);
            r1.DataSource = dt;
            r1.DataBind();
            r2.DataSource = dt;
            r2.DataBind();
            foreach (DataRow dr in dt.Rows)
            {
                lblcodigo.Text = dr["Codigo"].ToString();
                var fechares = dr["FechaRespuesta"].ToString();
                if (fechares == "")
                { lblfecha.Text = dr["FechaRespuesta"].ToString(); }
                else
                {
                    var fecharespuesta = Convert.ToDateTime(dr["FechaRespuesta"].ToString());
                    lblfecha.Text = Convert.ToString(fecharespuesta.ToString("dd/MM/yyyy"));
                }
                ddestado.Text = dr["Estado"].ToString();
                ddesec.Text = dr["RazaEspecial"].ToString();
                txtres.Text = dr["Respuesta"].ToString();
            }
        }

        protected void btnactualizar_Click1(object sender, EventArgs e)
        {
            var fecha = DateTime.Now.ToString();
            if (ddestado.Text != "" && txtres.Text != "")
            {
                usuario.Id = id;
                usuario.FechaRespuesta = fecha;
                usuario.Estado = ddestado.Text;
                usuario.Respuesta = txtres.Text;
                usuario.RazaEspecial = ddesec.Text;
                mapeo.ActualizarSolMascota(usuario);
                BuscarEmail();
                if (lblemail1.Text != "")
                {
                    string asunto = "Respuesta REGISTRO DE MASCOTA";
                    string mensaje1 = "Tiene una respuesta de Mascota en la aplicación de su Conjunto Residencial. <a style='color:#138496;' href=\"https://conjuntoid012.somee.com/Login.aspx?ReturnUrl=%2fPropietario%2fHome.aspx\"><u><strong>Link de la Aplicacion</strong></u></a>";
                    Servicios.Email email1 = new Servicios.Email(lblemail1.Text, lblcodigo.Text, mensaje1, asunto, conjunto);
                }
                Response.Redirect("AdmMascotas.aspx");
            }
            else
            {
                error.Style.Add("display", "block");
            }
        }
        public void BuscarEmail()
        {
            var mapeo = new Datos.MapeoUsuarios();
            var usuario = new Modelo.EntidadUsuario();
            usuario.Codigo = int.Parse(lblcodigo.Text);
            DataTable dt = mapeo.LeerUsuario(usuario);
            foreach (DataRow item in dt.Rows)
            {
                lblemail1.Text = item["Email"].ToString();
            }
        }
    }
}