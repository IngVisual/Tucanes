using System;
using System.Data;

namespace IngenieriaVisualPH.Empleados
{
    public partial class Empleados : System.Web.UI.MasterPage
    {
        int count1 = 0;
        int count2 = 0;
        Datos.MapeoMudanzas mapeo = new Datos.MapeoMudanzas();
        Modelo.EntidadMudanzas usuario = new Modelo.EntidadMudanzas();
        private string Estado = "Autorizado";

        Datos.MapeoSC mapeo1 = new Datos.MapeoSC();
        Modelo.EntidadSC usuario1 = new Modelo.EntidadSC();
        private string Estado1 = "Autorizado";

        protected void Page_Load(object sender, EventArgs e)
        {
            usuario.Estado = Estado;
            DataTable dt = mapeo.MostrarMudanzaEstado(usuario);
            count2 = Convert.ToInt32(dt.Rows.Count.ToString());
            lblnotif1.Text = count2.ToString();
            lblnotif2.Text = count2.ToString();
            r4.DataSource = dt;
            r4.DataBind();

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