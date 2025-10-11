using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LogicaNeg;
using Modelo.AlquilerParqueadero;

namespace IngenieriaVisualPH.Empleados
{
    public partial class Formulario_web116 : System.Web.UI.Page
    {
        ParqAlquiler LogAlquiler = new ParqAlquiler();
        TipoAlquiler Alquiler = new TipoAlquiler();
        int id;
        string email;

        protected void Page_Load(object sender, EventArgs e)
        {
            id = Convert.ToInt16(Request.QueryString["id"].ToString());
            if (IsPostBack) return;
            CalcularTotal(id);
        }

        public void CalcularTotal(int id)
        {
            var Alquiler = LogAlquiler.CalcularTotalAlquiler(id);
            foreach (var item in Alquiler)
            {
                lbltotal.Text = item.Total.ToString();
                lbltipoAlquiler.Text = item._TipoAlquiler.ToString();
                lblplaca.Text = item.Placa.ToString();
                lblnombre.Text = item.Nombre.ToString();
                lblmarca.Text = item.Marca.ToString();
                lblfechfin.Text = item.FechaFin.ToString();
                lblfechini.Text = item.FechaIni.ToString();
                lblhoras.Text = item.Horas.ToString();
                lblcodigo.Text = item.Codigo.ToString();
            }
        }

        protected void btnguardar_Click(object sender, EventArgs e)
        {
            Guardar();
        }

        public void Guardar()
        {
            try
            {
                Alquiler.IDalquiler = id;
                Alquiler.Total = int.Parse(lbltotal.Text);
                Alquiler.FechaFin = DateTime.Parse(lblfechfin.Text);
                Alquiler.Horas = int.Parse(lblhoras.Text);
                Alquiler.Observaciones = txtobser.Text;
                Alquiler.Estado = ddestado.Text;
                LogAlquiler.GuardarPago(Alquiler);
                var email = BuscarEmail();
                if (email != "" && email != null)
                {
                    string asunto = "Alquiler Parqueadero de Visitante";
                    Servicios.Email email1 = new Servicios.Email(lblcodigo.Text, asunto, lbltotal.Text, lblfechini.Text, lblfechfin.Text, txtobser.Text, lblhoras.Text, email, ddestado.Text, lbltipoAlquiler.Text);
                }
                else { Response.Redirect("AlquilerResultados.aspx"); }
                Response.Redirect("AlquilerResultados.aspx");
            }
            catch (Exception)
            {
                throw;
            }
        }
        public string BuscarEmail()
        {
            var mapeo = new Datos.MapeoUsuarios();
            var usuario = new Modelo.EntidadUsuario();
            usuario.Codigo = int.Parse(lblcodigo.Text);
            DataTable dt = mapeo.LeerUsuario(usuario);
            foreach (DataRow item in dt.Rows)
            {
                email = item["Email"].ToString();
            }
            return email;

        }
    }
}