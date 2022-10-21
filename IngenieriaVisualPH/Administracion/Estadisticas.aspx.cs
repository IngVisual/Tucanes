using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace IngenieriaVisualPH.Administracion
{
    public partial class Formulario_web135 : System.Web.UI.Page
    {
        Datos.MapeoSolicitudes mapeo = new Datos.MapeoSolicitudes();
        Datos.MapeoParqueadero mapeocar = new Datos.MapeoParqueadero();
        Datos.MapeoMudanzas mapeomud = new Datos.MapeoMudanzas();
        Datos.MapeoRegistros mapeoreg = new Datos.MapeoRegistros();
        Datos.MapeoChip mapeochip = new Datos.MapeoChip();
        Datos.MapeoSC mapeosc = new Datos.MapeoSC();
        Datos.MapeoUsuarios mapeousua = new Datos.MapeoUsuarios();
        private string estado1 = "Abierta", estado2 = "Solicitud";
        private int count1, count2, count3, count4, count5, count6, count7, count8,
        count9, count10, count11, count12, count13, count14, count21, count22, count23, count24, count25, count26, count27, count28, count29, count30, count31, count32, count33, count34, count35,
        count36,count40, count41, count42, count43, count44, count45, count46, count47, count48, count49, count50, count51, count52, count53, count54, count55;
        protected void Page_Load(object sender, EventArgs e)
        {
            //tabla de pqr
            DataTable dt = mapeo.MostrarPQRTabla();
            var result31 = dt.AsEnumerable().Where(myRow => myRow.Field<string>("Estado") == "Abierta").AsDataView();
            count1 = result31.Count;
            lblpqrab.Text = count1.ToString();

            var result32 = dt.AsEnumerable().Where(myRow => myRow.Field<string>("Estado") == "En Proceso").AsDataView();
            count2 = result32.Count;
            lblpqrproc.Text = count2.ToString();

            var result33 = dt.AsEnumerable().Where(myRow => myRow.Field<string>("Estado") == "Cerrada").AsDataView();
            count3 = result33.Count;
            lblpqrcer.Text = count3.ToString();

            //tabla llamados de atencion
            var result34 = dt.AsEnumerable().Where(myRow => myRow.Field<string>("Codigo1") != "TorreApartamento" && myRow.Field<string>("Codigo1") != "" && myRow.Field<string>("Codigo1") != null && myRow.Field<string>("Estado") != "Queja Cerrada").AsDataView();
            count4 = result34.Count;
            lblllaapli.Text = count4.ToString();

            var result35 = dt.AsEnumerable().Where(myRow => myRow.Field<string>("Codigo1") != "TorreApartamento" && myRow.Field<string>("Codigo1") != "" && myRow.Field<string>("Codigo1") != null && myRow.Field<string>("Estado") == "Queja Cerrada").AsDataView();
            count5 = result35.Count;
            lblllacerr.Text = count5.ToString();

            //tabla denovedad des saldo
            DataTable dt1 = mapeo.MostrarNovSaldoTabla();
            var result1 = dt1.AsEnumerable().Where(myRow => myRow.Field<string>("Estado") == estado1).AsDataView();

            var result56 = dt1.AsEnumerable().Where(myRow => myRow.Field<string>("Estado") == "Abierta").AsDataView();
            count6 = result56.Count;
            lblnovabi.Text = count6.ToString();

            var result57 = dt1.AsEnumerable().Where(myRow => myRow.Field<string>("Estado") == "En Proceso").AsDataView();
            count7 = result57.Count;
            lblnovpro.Text = count7.ToString();

            var result58 = dt1.AsEnumerable().Where(myRow => myRow.Field<string>("Estado") == "Cerrada").AsDataView();
            count8 = result58.Count;
            lblnovcerr.Text = count8.ToString();

            //TABLA DE MUDANZAS
            DataTable dt4 = mapeomud.MostrarSolMudaTabla();
            var result4 = dt4.AsEnumerable().Where(myRow => myRow.Field<string>("Estado") == estado2).AsDataView();

            var result59 = dt4.AsEnumerable().Where(myRow => myRow.Field<string>("Estado") == "Solicitud").AsDataView();
            count21 = result59.Count;
            lblmudsol.Text = count21.ToString();

            var result60 = dt4.AsEnumerable().Where(myRow => myRow.Field<string>("Estado") == "Autorizado").AsDataView();
            count22 = result60.Count;
            lblmudaut.Text = count22.ToString();

            var result61 = dt4.AsEnumerable().Where(myRow => myRow.Field<string>("Estado") == "No Autorizado").AsDataView();
            count23 = result61.Count;
            lblmudnoaut.Text = count23.ToString();

            var result62 = dt4.AsEnumerable().Where(myRow => myRow.Field<string>("Estado") == "Novedad").AsDataView();
            count24 = result62.Count;
            lblmudnov.Text = count24.ToString();

            var result63 = dt4.AsEnumerable().Where(myRow => myRow.Field<string>("Estado") == "Finalizado").AsDataView();
            count25 = result63.Count;
            lblmudfin.Text = count25.ToString();

            //TABLA DE PARQUEADEOS
            DataTable dt3 = mapeocar.MostrarSolParqTabla();
            var result3 = dt3.AsEnumerable().Where(myRow => myRow.Field<string>("Estado") == estado2).AsDataView();

            var result65 = dt3.AsEnumerable().Where(myRow => myRow.Field<string>("Estado") == "Solicitud").AsDataView();
            count26 = result65.Count;
            lblparsol.Text = count26.ToString();

            var result66 = dt3.AsEnumerable().Where(myRow => myRow.Field<string>("Estado") == "Autorizado").AsDataView();
            count27 = result66.Count;
            lblparaut.Text = count27.ToString();

            var result67 = dt3.AsEnumerable().Where(myRow => myRow.Field<string>("Estado") == "No Autorizado").AsDataView();
            count28 = result67.Count;
            lblparnoaut.Text = count28.ToString();

            var result68 = dt3.AsEnumerable().Where(myRow => myRow.Field<string>("Estado") == "En Lista, Esperando Cupo").AsDataView();
            count29 = result68.Count;
            lblparlis.Text = count29.ToString();

            var result69 = dt3.AsEnumerable().Where(myRow => myRow.Field<string>("Estado") == "Aprobado para Sorteo").AsDataView();
            count30 = result69.Count;
            lblparsorte.Text = count30.ToString();

            DataTable dt5 = mapeoreg.MostrarCarteTabla();
            var result5 = dt5.AsEnumerable().Where(myRow => myRow.Field<string>("Estado") == estado2).AsDataView();

            DataTable dt6 = mapeochip.MostrarChipTabla();
            var result6 = dt6.AsEnumerable().Where(myRow => myRow.Field<string>("Estado") == estado2).AsDataView();

            //tabla de salon comunal
            DataTable dt7 = mapeosc.MostrarSCTabla();
            var result7 = dt7.AsEnumerable().Where(myRow => myRow.Field<string>("Estado") == estado2).AsDataView();

            var result70 = dt7.AsEnumerable().Where(myRow => myRow.Field<string>("Estado") == "Solicitud").AsDataView();
            count31 = result70.Count;
            lblscsol.Text = count31.ToString();

            var result71 = dt7.AsEnumerable().Where(myRow => myRow.Field<string>("Estado") == "Autorizado").AsDataView();
            count32 = result71.Count;
            lblscaut.Text = count32.ToString();

            var result72 = dt7.AsEnumerable().Where(myRow => myRow.Field<string>("Estado") == "No Autorizado").AsDataView();
            count33 = result72.Count;
            lblscnoaut.Text = count33.ToString();

            var result73 = dt7.AsEnumerable().Where(myRow => myRow.Field<string>("Estado") == "Reservado").AsDataView();
            count34 = result73.Count;
            lblscres.Text = count34.ToString();

            var result74 = dt7.AsEnumerable().Where(myRow => myRow.Field<string>("Estado") == "Novedad").AsDataView();
            count35= result74.Count;
            lblscnov.Text = count35.ToString();

            var result75 = dt7.AsEnumerable().Where(myRow => myRow.Field<string>("Estado") == "Finalizado").AsDataView();
            count36 = result75.Count;
            lblscfin.Text = count36.ToString();

            // primara tabla de estadisticas generales
            var result13 = dt.AsEnumerable().Where(myRow => myRow.Field<string>("Codigo") != "").AsDataView();
            count9 = result13.Count;
            lblpqr.Text = count9.ToString();

            var result14 = dt.AsEnumerable().Where(myRow => myRow.Field<string>("Codigo1") != "TorreApartamento" && myRow.Field<string>("Codigo1") != "" && myRow.Field<string>("Codigo1") != null).AsDataView();
            count10 = result14.Count;
            lblllama.Text = count10.ToString();
            lblpqrllam.Text = count10.ToString();

            var result15 = dt1.AsEnumerable().Where(myRow => myRow.Field<string>("Codigo") != "" && myRow.Field<string>("Codigo") != null).AsDataView();
            count11 = result15.Count;
            lblsaldo2.Text = count11.ToString();

            var result16 = dt4.AsEnumerable().Where(myRow => myRow.Field<string>("Codigo") != "" && myRow.Field<string>("Codigo") != null).AsDataView();
            count12 = result16.Count;
            lblmuda2.Text = count12.ToString();

            var result17 = dt7.AsEnumerable().Where(myRow => myRow.Field<string>("Codigo") != "" && myRow.Field<string>("Codigo") != null).AsDataView();
            count13 = result17.Count;
            lblsc2.Text = count13.ToString();

            var result18 = dt3.AsEnumerable().Where(myRow => myRow.Field<string>("Codigo") != "" && myRow.Field<string>("Codigo") != null).AsDataView();
            count14 = result18.Count;
            lblparqu2.Text = count14.ToString();

            //torta
            Torta();
        }

        protected string Torta()
        {
            DataTable dt = mapeo.MostrarPQRTabla();
            var result = dt.AsEnumerable().Where(myRow => myRow.Field<string>("Tipo") == "Ruido").AsDataView();
            string dato1;
            count40 = result.Count;
            dato1 = count40.ToString();
            var result1 = dt.AsEnumerable().Where(myRow => myRow.Field<string>("Tipo") == "Mantenimiento").AsDataView();
            string dato2;
            count41 = result1.Count;
            dato2 = count41.ToString();
            var result2 = dt.AsEnumerable().Where(myRow => myRow.Field<string>("Tipo") == "Vandalismo o robos").AsDataView();
            string dato3;
            count42 = result2.Count;
            dato3 = count42.ToString();
            var result3 = dt.AsEnumerable().Where(myRow => myRow.Field<string>("Tipo") == "Fumigacion").AsDataView();
            string dato4;
            count43 = result3.Count;
            dato4 = count43.ToString();
            var result4 = dt.AsEnumerable().Where(myRow => myRow.Field<string>("Tipo") == "Bebidas alcoholicas o estupefacientes").AsDataView();
            string dato5;
            count44 = result4.Count;
            dato5 = count44.ToString();
            var result5 = dt.AsEnumerable().Where(myRow => myRow.Field<string>("Tipo") == "Mascotas").AsDataView();
            string dato6;
            count45 = result5.Count;
            dato6 = count45.ToString();
            var result6 = dt.AsEnumerable().Where(myRow => myRow.Field<string>("Tipo") == "Estetica del conjunto").AsDataView();
            string dato7;
            count46 = result6.Count;
            dato7 = count46.ToString();
            var result7 = dt.AsEnumerable().Where(myRow => myRow.Field<string>("Tipo") == "Vigilancia").AsDataView();
            string dato8;
            count47 = result7.Count;
            dato8 = count47.ToString();
            var result8 = dt.AsEnumerable().Where(myRow => myRow.Field<string>("Tipo") == "Shoot de basura").AsDataView();
            string dato9;
            count48 = result8.Count;
            dato9 = count48.ToString();
            var result9 = dt.AsEnumerable().Where(myRow => myRow.Field<string>("Tipo") == "Privacidad").AsDataView();
            string dato10;
            count49 = result9.Count;
            dato10 = count49.ToString();
            var result10 = dt.AsEnumerable().Where(myRow => myRow.Field<string>("Tipo") == "Agresion verbal o fisica").AsDataView();
            string dato11;
            count50 = result10.Count;
            dato11 = count50.ToString();
            var result11 = dt.AsEnumerable().Where(myRow => myRow.Field<string>("Tipo") == "Novedad de saldo").AsDataView();
            string dato12;
            count51 = result11.Count;
            dato12 = count51.ToString();
            var result12 = dt.AsEnumerable().Where(myRow => myRow.Field<string>("Tipo") == "Parqueaderos").AsDataView();
            string dato13;
            count52 = result12.Count;
            dato13 = count52.ToString();
            var result13 = dt.AsEnumerable().Where(myRow => myRow.Field<string>("Tipo") == "Zonas comunes").AsDataView();
            string dato14;
            count53 = result13.Count;
            dato14 = count53.ToString();
            var result14 = dt.AsEnumerable().Where(myRow => myRow.Field<string>("Tipo") == "Porteria").AsDataView();
            string dato15;
            count54 = result14.Count;
            dato15 = count54.ToString();

            DataTable Datos = new DataTable();
            Datos.Columns.Add(new DataColumn("Tipo de PQR", typeof(string)));
            Datos.Columns.Add(new DataColumn("Cantidad", typeof(string)));
            Datos.Rows.Add(new Object[] { "", 0 });
            Datos.Rows.Add(new Object[] { "Porteria", dato15 });
            Datos.Rows.Add(new Object[] { "Zonas comunes", dato14 });
            Datos.Rows.Add(new Object[] { "Parqueaderos", dato13 });
            Datos.Rows.Add(new Object[] { "Novedad de saldo", dato12 });
            Datos.Rows.Add(new Object[] { "Agresion verbal o fisica", dato11 });
            Datos.Rows.Add(new Object[] { "Privacidad", dato10 });
            Datos.Rows.Add(new Object[] { "Shoot de basura", dato9 });
            Datos.Rows.Add(new Object[] { "Vigilancia", dato8 });
            Datos.Rows.Add(new Object[] { "Estetica del conjunto", dato7 });
            Datos.Rows.Add(new Object[] { "Mascotas", dato6 });
            Datos.Rows.Add(new Object[] { "Bebidas alcoholicas o estupefacientes", dato5 });
            Datos.Rows.Add(new Object[] { "Fumigacion", dato4 });
            Datos.Rows.Add(new Object[] { "Vandalismo o robos", dato3 });
            Datos.Rows.Add(new Object[] { "Mantenimiento ", dato2 });
            Datos.Rows.Add(new Object[] { "Ruido", dato1 });
            Datos.Rows.Add(new Object[] { "", 0 });

            string strdatos;

            strdatos = "[['Tipo de PQR', 'Cantidad'],";
            foreach (DataRow dr in Datos.Rows)
            {
                strdatos = strdatos + "[";
                strdatos = strdatos + "'" + dr[0] + "'" + "," + dr[1];
                strdatos = strdatos + "],";
            }
            strdatos = strdatos + "]";

            return strdatos;

        }

    }
}