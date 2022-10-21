using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace IngenieriaVisualPH.Registro
{
    public partial class RegistroCitofonia : System.Web.UI.Page
    {
        Datos.MapeoUsuarios mapeo = new Datos.MapeoUsuarios();
        Modelo.EntidadUsuario usuario = new Modelo.EntidadUsuario();

        protected void Page_Load(object sender, EventArgs e)
        {
            lblconjunto.Text = "TUCANES";
            lblmensaje1.Text = "Como propietario del PREDIO: <span>" + lblcodigo.Text + "</span> del conjunto residencial<span> " + lblconjunto.Text + "</span> declaro que me hago " +
               "responsable por el comportamiento y convivencia de mis arrendatarios o propietarios y sus visitantes, comprometiéndome a colaborar para que cumplamos la normatividad;" +
               " asumiendo la responsabilidad sobre llamados de atención y/ o sanciones que se impongan como consecuencia de los comportamientos contrarios a la convivencia.Y que me comprometo" +
               " a hacer entrega de la llave de acceso a la puerta principal de la torre, así como los chips de ingreso al conjunto residencial.<br/> " +
               "<br/> De igual forma acepto como una causal de terminación de contrato de arrendamiento para restituir el inmueble por parte de los arrendatarios, la imposición de tres (3)" +
               " llamados de atención convivencial y/o la imposición de sanción económica " +
               "<br/>  Conforme a la ley 1581 de 2012, autorizó al conjunto residencial, al tratamiento de los datos personales consignados en la presente aplicación. la informacion registrada en la aplicación solo se utilizara con fines de comunicacion interna entre la administracion, porteria, contabilidad y residentes sobre los procesos del conjunto residencial.";
            lblasunto.Text = "POLITICA DE CONVIVENCIA CONJUNTO " + lblconjunto.Text + " ";
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

        public void MostrarUsuario(DataTable dt)
        {
            foreach (DataRow item in dt.Rows)
            {
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

        protected void btnactualizar_Click1(object sender, EventArgs e)
        {
            if (txtcelular.Text != "" && txtemail.Text != "" && ddesatdo.Text != ""&&ddNpersonas.Text!=""&&ddmenores.Text!=""&&ddmascotas.Text!="")
            {
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
                usuario.NomMayores = txtnomadul.Text;
                usuario.NomMenores = txtmennom.Text;
                usuario.NomProhibidoIng = txtsanc.Text;
                int fila = mapeo.ActualizarUsuario(usuario);
                if (fila == 1)
                {
                    Servicios.Email email = new Servicios.Email(usuario.Email, lblcodigo.Text ,lblmensaje1.Text,lblasunto.Text,lblconjunto.Text);
                    Response.Redirect("~/Login.aspx");
                }
            }
            else { error1.Style.Add("display", "block"); }
        }
    }
}