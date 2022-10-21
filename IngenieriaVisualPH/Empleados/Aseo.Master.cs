using System;
using System.Data;

namespace IngenieriaVisualPH.Empleados
{
    public partial class Aseo : System.Web.UI.MasterPage
    {
        int count1 = 0;
        Datos.MapeoSC mapeo1 = new Datos.MapeoSC();
        Modelo.EntidadSC usuario1 = new Modelo.EntidadSC();
        private string Estado1 = "Autorizado";

        protected void Page_Load(object sender, EventArgs e)
        {

            usuario1.Estado = Estado1;
            DataTable dt1 = mapeo1.MostrarSCEstado(usuario1);
            count1 = Convert.ToInt32(dt1.Rows.Count.ToString());
            lblnoti1.Text = count1.ToString();
            lblnoti2.Text = count1.ToString();
            r3.DataSource = dt1;
            r3.DataBind();
        }
        public string gettwentycharacters(object myvalues)
        {
            string a;
            a = Convert.ToString(myvalues.ToString());
            string b = "";

            if (a.Length >= 15)
            {
                b = a.Substring(0, 15);
                return b.ToString() + ",,";
            }
            else
            {
                b = a.ToString();
                return b.ToString();
            }
        }
    }
}