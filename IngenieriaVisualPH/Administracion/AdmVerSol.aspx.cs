using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace IngenieriaVisualPH.Administracion
{
    public partial class Formulario_web1 : System.Web.UI.Page
    {
        Datos.MapeoSolicitudes mapeo = new Datos.MapeoSolicitudes();
        Datos.MapeoParqueadero mapeocar = new Datos.MapeoParqueadero();
        Datos.MapeoMudanzas mapeomud = new Datos.MapeoMudanzas();
        Datos.MapeoRegistros mapeoreg = new Datos.MapeoRegistros();
        Datos.MapeoChip mapeochip = new Datos.MapeoChip();
        Datos.MapeoSC mapeosc = new Datos.MapeoSC();
        Datos.MapeoUsuarios mapeousua = new Datos.MapeoUsuarios();
        Datos.MapeoNota nota = new Datos.MapeoNota();
        private string estado1 = "Abierta", estado2="Solicitud", estadonota="Cerrada";
        private int count1,count2,count3,count4,count5,count6,count7, count8, idnota;

        protected void Page_Load(object sender, EventArgs e)
        {
            CargarNota();
                
            DataTable dt= mapeo.MostrarPQRTabla();
            var result = dt.AsEnumerable().Where(myRow => myRow.Field<string>("Estado") == estado1).AsDataView();
            count1 = result.Count;
            lblpqr1.Text = count1.ToString();

            DataTable dt1 = mapeo.MostrarNovSaldoTabla();
            var result1 = dt1.AsEnumerable().Where(myRow => myRow.Field<string>("Estado") == estado1).AsDataView();
            count2 = result1.Count;
            lblsaldo.Text = count2.ToString();

            DataTable dt3 = mapeocar.MostrarSolParqTabla();
            var result3 = dt3.AsEnumerable().Where(myRow => myRow.Field<string>("Estado") == estado2).AsDataView();
            count3 = result3.Count;
            lbldoc.Text = count3.ToString();

            DataTable dt4 = mapeomud.MostrarSolMudaTabla();
            var result4 = dt4.AsEnumerable().Where(myRow => myRow.Field<string>("Estado") == estado2).AsDataView();
            count4 = result4.Count;
            lbltrasteo.Text = count4.ToString();

            DataTable dt5 = mapeoreg.MostrarCarteTabla();
            var result5 = dt5.AsEnumerable().Where(myRow => myRow.Field<string>("Estado") == estado2).AsDataView();
            count5 = result5.Count;
            lblcart.Text = count5.ToString();

            DataTable dt6 = mapeochip.MostrarChipTabla();
            var result6 = dt6.AsEnumerable().Where(myRow => myRow.Field<string>("Estado") == estado2).AsDataView();
            count6 = result6.Count;
            lblchip.Text = count6.ToString();

            DataTable dt7 = mapeosc.MostrarSCTabla();
            var result7 = dt7.AsEnumerable().Where(myRow => myRow.Field<string>("Estado") == estado2).AsDataView();
            count7 = result7.Count;
            lblsc.Text = count7.ToString();

            DataTable dt8 = mapeousua.TablaUsuario();
            var result8 = dt8.AsEnumerable().Where(myRow => myRow.Field<string>("AceptaTerminosyCondiciones") == "Si").AsDataView();
            count8 = result8.Count;
            lblreg.Text = count8.ToString();

            var result9 = dt8.AsEnumerable().Sum(myRow => myRow.Field<int?>("Conteo"));
            lblsesi.Text = result9.ToString();

            var result10 = dt8.AsEnumerable().Where(myRow => myRow.Field<string>("Npersonas")!="" && myRow.Field<string>("Npersonas") != null).AsDataView();
            int sumaMayor=0;
            int suma = 0;
            foreach (DataRowView item in result10)
            {
                suma = int.Parse(item["Npersonas"].ToString());
                sumaMayor = sumaMayor+suma;
                lblmayo.Text = sumaMayor.ToString();
            }

            var result11 = dt8.AsEnumerable().Where(myRow => myRow.Field<string>("NMenores") != "" && myRow.Field<string>("NMenores") != null).AsDataView();
            int sumaMenor = 0;
            int suma1 = 0;
            foreach (DataRowView item in result11)
            {
                suma1 = int.Parse(item["NMenores"].ToString());
                sumaMenor = sumaMenor + suma1;
                lblbmen.Text = sumaMenor.ToString();
            }

            var result12 = dt8.AsEnumerable().Where(myRow => myRow.Field<string>("Nmascotas") != "" && myRow.Field<string>("Nmascotas") != null).AsDataView();
            int sumamasc = 0;
            int suma2 = 0;
            foreach (DataRowView item in result12)
            {
                suma2 = int.Parse(item["Nmascotas"].ToString());
                sumamasc = sumamasc + suma2;
                lblmasc.Text = sumamasc.ToString();
            }       
        }

        protected void btnnota_Click(object sender, EventArgs e)
        {
            if(txtnota.Text!="")
            {
            DateTime time = DateTime.Now;
            nota.Guardar(txtnota.Text, estado1, time);
            Response.Redirect("AdmVerSol.aspx");
            }
        }

        protected void CargarNota()
        {
            DataTable tabla = nota.MostrarNota();
            var restabla = tabla.AsEnumerable().Where(row => row.Field<string>("Estado") == "Abierta").AsDataView();
            r1.DataSource = restabla;
            r1.DataBind();
        }
    }
}