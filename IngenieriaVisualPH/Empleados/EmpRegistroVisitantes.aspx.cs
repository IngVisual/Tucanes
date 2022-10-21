using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IngenieriaVisualPH.Empleados
{
    public partial class Formulario_web12 : System.Web.UI.Page
    {
        Datos.MapeoRegistros mapeo = new Datos.MapeoRegistros();
        Modelo.EntidadVisitantes usuario = new Modelo.EntidadVisitantes();
        DateTime time = DateTime.Now;
        private string codigo;
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void btnguardar_Click(object sender, EventArgs e)
        {
            codigo = ddltor.Text + ddapa.Text;

            if (codigo != "TorreApartamento"&& ddltor.Text!="Torre"&& ddapa.Text!="Apartamento")
            {
                    usuario.Codigo = int.Parse(codigo);
                    usuario.PlacaVehiculo = txtplaca.Text;
                    usuario.Vehiculo = ddvehiculo.Text;
                    usuario.FechaPro = time;
                    usuario.Observacion = ddobs.Text;
                    usuario.Usuario = txtuuario.Text;
                    mapeo.RegistroVisita(usuario);
                    txtuuario.Text = "";
                    txtplaca.Text = "";
                    ddvehiculo.Text = "";
                    ddobs.Text = "";
                    error1.Style.Add("display","block");
                    Div1.Style.Add("display", "none");
            }
            else
            {
                Div1.Style.Add("display", "block");
                error1.Style.Add("display", "none");
            }
        }
    }
}