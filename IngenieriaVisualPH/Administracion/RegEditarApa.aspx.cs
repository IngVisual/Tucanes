using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace IngenieriaVisualPH.Administracion
{
    public partial class Formulario_web12 : System.Web.UI.Page
    {
        Datos.MapeoUsuarios mapeo = new Datos.MapeoUsuarios();
        Modelo.EntidadUsuario usuario = new Modelo.EntidadUsuario();
        int id;
        protected void Page_Load(object sender, EventArgs e)
        {
            id = Convert.ToInt32(Request.QueryString["Id"].ToString());
            if (IsPostBack) return;
            usuario.Codigo = id;
            DataTable dt = mapeo.LeerUsuario(usuario);
            if (dt != null)
            {
                if (!IsPostBack)
                {
                    MostrarUsuario(dt);
                }
            }
        }

        public void MostrarUsuario(DataTable dt)
        {
            foreach (DataRow item in dt.Rows)
            {
                txtnombre.Text = item["NombrePropietario"].ToString();
                lblcodigo.Text = item["Codigo"].ToString();
                txtcontraseña.Text = item["CCPropietario"].ToString();
                txtcelular.Text = item["Celular"].ToString();
                txtotrocelular.Text = item["OtroCelular"].ToString();
                txtemail.Text = item["Email"].ToString();
                ddesatdo.Text = item["Estado"].ToString();
                txtcelarr.Text = item["CelularArr"].ToString();
                ddNpersonas.Text = item["Npersonas"].ToString();
                ddmascotas.Text = item["Nmascotas"].ToString();
                txtrazas.Text = item["Razas"].ToString();
                ddmenores.Text = item["NMenores"].ToString();
                txtnomadul.Text = item["NombMayores"].ToString();
                txtmennom.Text = item["NombMenores"].ToString();
                txtsanc.Text = item["NombProhibidoIngreso"].ToString();
            }
        }
        protected void btnactualizar_Click(object sender, EventArgs e)
        {
            if (txtcelular.Text != "" && txtemail.Text != "" && ddesatdo.Text != "" && ddNpersonas.Text != "" && ddmenores.Text != "" && ddmascotas.Text != "" && txtcontraseña.Text != "")
            {
                usuario.CCPropietario = txtcontraseña.Text;
                usuario.Celular = txtcelular.Text;
                usuario.OtroCelular = txtotrocelular.Text;
                usuario.CelularArr = txtcelarr.Text;
                usuario.Estado = ddesatdo.Text;
                usuario.Email = txtemail.Text;
                usuario.AceptaTerminosyCondiciones = DropDownList1.Text;
                usuario.Npersonas = ddNpersonas.Text;
                usuario.Nmascotas = ddmascotas.Text;
                usuario.NMenores = ddmenores.Text;
                usuario.Razas = txtrazas.Text;
                usuario.Codigo = int.Parse(lblcodigo.Text);
                usuario.NombrePropietario = txtnombre.Text;
                usuario.NomMayores = txtnomadul.Text;
                usuario.NomMenores = txtmennom.Text;
                usuario.NomProhibidoIng = txtsanc.Text;
                int fila = mapeo.ActualizarUsuarioPassword(usuario);
                if (fila == 1)
                {
                    Response.Redirect("Registro_Apartamentos.aspx");
                }
            }
            else { error1.Style.Add("display", "block"); }
        }
    }
}