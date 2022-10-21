using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IngenieriaVisualPH.Empleados
{
    public partial class Formulario_web16 : System.Web.UI.Page
    {
        string mensaje1 = "Recibo de Energia(LUZ) ya se encuentra en porteria";
        string mensaje2 = "Recibo del AGUA ya se encuentra en porteria";
        string mensaje3 = "Recibo del GAS ya se encuentra en porteria";
        string mensaje4 = "Recibo del PREDIAL ya se encuentra en porteria";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnluz_Click(object sender, EventArgs e)
        {
            Servicios.Push push = new Servicios.Push(mensaje1);
        }

        protected void btnagua_Click(object sender, EventArgs e)
        {
            Servicios.Push push1 = new Servicios.Push(mensaje2);
        }

        protected void btngas_Click(object sender, EventArgs e)
        {
            Servicios.Push push3 = new Servicios.Push(mensaje3);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Servicios.Push push4 = new Servicios.Push(mensaje4);
        }
    }
}