using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace IngenieriaVisualPH.Propietario
{
    public partial class Formulario_web151 : System.Web.UI.Page
    {
        Datos.Conexion con = new Datos.Conexion();
        Datos.MapeoQuejas mapeo = new Datos.MapeoQuejas();
        Modelo.EntidadQuejas usuario = new Modelo.EntidadQuejas();
        private int codigo;
        private string estado= "Abierta";
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                codigo = int.Parse(Session["cod"].ToString());
            }
            catch (Exception)
            {
                throw new Exception("Tiempo de sesion finalizado, por favor ingrese nuevamente a la app");
            }
            obtenerDatos();
            con.Cerrar();
            MostrarQuejaCodigo();

        }
        protected string obtenerDatos()
        {
            int count = 0;
            int count1 = 0;
            int count2 = 0;
            int count4 = 0;
            int count5 = 0;
            int count6 = 0;
            int count7 = 0;
            int count8 = 0;
            int count9 = 0;
            int count10 = 0;
            int count11 = 0;
            int count12 = 0;
            int count13 = 0;
            int count14 = 0;
            int count15 = 0;

            con.Abrir();

            string dato1;
            SqlCommand cmd = con.conexion.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "select * from tblPQR where Tipo='Ruido'";
            cmd.ExecuteNonQuery();
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            count = Convert.ToInt32(dt.Rows.Count.ToString());
            dato1 = count.ToString();

            string dato2;
            SqlCommand cmd1 = con.conexion.CreateCommand();
            cmd1.CommandType = CommandType.Text;
            cmd1.CommandText = "select * from tblPQR where Tipo='Mantenimiento'";
            cmd1.ExecuteNonQuery();
            DataTable dt1 = new DataTable();
            SqlDataAdapter da1 = new SqlDataAdapter(cmd1);
            da1.Fill(dt1);
            count1 = Convert.ToInt32(dt1.Rows.Count.ToString());
            dato2 = count1.ToString();

            string dato3;
            SqlCommand cmd2 = con.conexion.CreateCommand();
            cmd2.CommandType = CommandType.Text;
            cmd2.CommandText = "select * from tblPQR where Tipo='Vandalismo o robos'";
            cmd2.ExecuteNonQuery();
            DataTable dt2 = new DataTable();
            SqlDataAdapter da2 = new SqlDataAdapter(cmd2);
            da2.Fill(dt2);
            count2 = Convert.ToInt32(dt2.Rows.Count.ToString());
            dato3 = count2.ToString();

            string dato4;
            SqlCommand cmd4 = con.conexion.CreateCommand();
            cmd4.CommandType = CommandType.Text;
            cmd4.CommandText = "select * from tblPQR where Tipo='Fumigacion'";
            cmd4.ExecuteNonQuery();
            DataTable dt4 = new DataTable();
            SqlDataAdapter da4 = new SqlDataAdapter(cmd4);
            da4.Fill(dt4);
            count4 = Convert.ToInt32(dt4.Rows.Count.ToString());
            dato4 = count4.ToString();


            string dato5;
            SqlCommand cmd5 = con.conexion.CreateCommand();
            cmd5.CommandType = CommandType.Text;
            cmd5.CommandText = "select * from tblPQR where Tipo='Bebidas alcoholicas o estupefacientes'";
            cmd5.ExecuteNonQuery();
            DataTable dt5 = new DataTable();
            SqlDataAdapter da5 = new SqlDataAdapter(cmd5);
            da5.Fill(dt5);
            count5 = Convert.ToInt32(dt5.Rows.Count.ToString());
            dato5 = count5.ToString();


            string dato6;
            SqlCommand cmd6 = con.conexion.CreateCommand();
            cmd6.CommandType = CommandType.Text;
            cmd6.CommandText = "select * from tblPQR where Tipo='Mascotas'";
            cmd6.ExecuteNonQuery();
            DataTable dt6 = new DataTable();
            SqlDataAdapter da6 = new SqlDataAdapter(cmd6);
            da6.Fill(dt6);
            count6 = Convert.ToInt32(dt6.Rows.Count.ToString());
            dato6 = count6.ToString();

            string dato7;
            SqlCommand cmd7 = con.conexion.CreateCommand();
            cmd7.CommandType = CommandType.Text;
            cmd7.CommandText = "select * from tblPQR where Tipo='Estetica del conjunto'";
            cmd7.ExecuteNonQuery();
            DataTable dt7 = new DataTable();
            SqlDataAdapter da7 = new SqlDataAdapter(cmd7);
            da7.Fill(dt7);
            count7 = Convert.ToInt32(dt7.Rows.Count.ToString());
            dato7 = count7.ToString();

            string dato8;
            SqlCommand cmd8 = con.conexion.CreateCommand();
            cmd8.CommandType = CommandType.Text;
            cmd8.CommandText = "select * from tblPQR where Tipo='Vigilancia'";
            cmd8.ExecuteNonQuery();
            DataTable dt8 = new DataTable();
            SqlDataAdapter da8 = new SqlDataAdapter(cmd8);
            da8.Fill(dt8);
            count8 = Convert.ToInt32(dt8.Rows.Count.ToString());
            dato8 = count8.ToString();

            string dato9;
            SqlCommand cmd9 = con.conexion.CreateCommand();
            cmd9.CommandType = CommandType.Text;
            cmd9.CommandText = "select * from tblPQR where Tipo='Shoot de basura'";
            cmd9.ExecuteNonQuery();
            DataTable dt9 = new DataTable();
            SqlDataAdapter da9 = new SqlDataAdapter(cmd9);
            da9.Fill(dt9);
            count9 = Convert.ToInt32(dt9.Rows.Count.ToString());
            dato9 = count9.ToString();

            string dato10;
            SqlCommand cmd10 = con.conexion.CreateCommand();
            cmd10.CommandType = CommandType.Text;
            cmd10.CommandText = "select * from tblPQR where Tipo='Privacidad'";
            cmd10.ExecuteNonQuery();
            DataTable dt10 = new DataTable();
            SqlDataAdapter da10 = new SqlDataAdapter(cmd10);
            da10.Fill(dt10);
            count10 = Convert.ToInt32(dt10.Rows.Count.ToString());
            dato10 = count10.ToString();

            string dato11;
            SqlCommand cmd11 = con.conexion.CreateCommand();
            cmd11.CommandType = CommandType.Text;
            cmd11.CommandText = "select * from tblPQR where Tipo='Agresion verbal o fisica'";
            cmd11.ExecuteNonQuery();
            DataTable dt11 = new DataTable();
            SqlDataAdapter da11 = new SqlDataAdapter(cmd11);
            da11.Fill(dt11);
            count11 = Convert.ToInt32(dt11.Rows.Count.ToString());
            dato11 = count11.ToString();

            string dato12;
            SqlCommand cmd12 = con.conexion.CreateCommand();
            cmd12.CommandType = CommandType.Text;
            cmd12.CommandText = "select * from tblPQR where Tipo='Novedad de saldo'";
            cmd12.ExecuteNonQuery();
            DataTable dt12 = new DataTable();
            SqlDataAdapter da12 = new SqlDataAdapter(cmd12);
            da12.Fill(dt12);
            count12 = Convert.ToInt32(dt12.Rows.Count.ToString());
            dato12 = count12.ToString();

            string dato13;
            SqlCommand cmd13 = con.conexion.CreateCommand();
            cmd13.CommandType = CommandType.Text;
            cmd13.CommandText = "select * from tblPQR where Tipo='Parqueaderos'";
            cmd13.ExecuteNonQuery();
            DataTable dt13 = new DataTable();
            SqlDataAdapter da13 = new SqlDataAdapter(cmd13);
            da13.Fill(dt13);
            count13 = Convert.ToInt32(dt13.Rows.Count.ToString());
            dato13 = count13.ToString();

            string dato14;
            SqlCommand cmd14 = con.conexion.CreateCommand();
            cmd14.CommandType = CommandType.Text;
            cmd14.CommandText = "select * from tblPQR where Tipo='Zonas comunes'";
            cmd14.ExecuteNonQuery();
            DataTable dt14 = new DataTable();
            SqlDataAdapter da14 = new SqlDataAdapter(cmd14);
            da14.Fill(dt14);
            count14 = Convert.ToInt32(dt14.Rows.Count.ToString());
            dato14 = count14.ToString();

            string dato15;
            SqlCommand cmd15 = con.conexion.CreateCommand();
            cmd15.CommandType = CommandType.Text;
            cmd15.CommandText = "select * from tblPQR where Tipo='Porteria'";
            cmd15.ExecuteNonQuery();
            DataTable dt15 = new DataTable();
            SqlDataAdapter da15 = new SqlDataAdapter(cmd15);
            da15.Fill(dt15);
            count15 = Convert.ToInt32(dt15.Rows.Count.ToString());
            dato15 = count15.ToString();

            DataTable Datos = new DataTable();

            Datos.Columns.Add(new DataColumn("Convivencia", typeof(string)));
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

            strdatos = "[['Convivencia', 'Cantidad'],";
            foreach (DataRow dr in Datos.Rows)
            {
                strdatos = strdatos + "[";
                strdatos = strdatos + "'" + dr[0] + "'" + "," + dr[1];
                strdatos = strdatos + "],";
            }
            strdatos = strdatos + "]";

            return strdatos;
        }

        protected void MostrarQuejaCodigo()
        {
            Datos.MapeoSolicitudes mapeo = new Datos.MapeoSolicitudes();
            Modelo.EntidadesPQR pqr1 = new Modelo.EntidadesPQR();
            pqr1.Codigo1 = codigo.ToString();
            DataTable dt = mapeo.MostrarPQRLLamadoCerrada(pqr1);
            var result3 = dt.AsEnumerable().Where(p => p.Field<string>("Estado") == "Cerrada");
            var count3 = result3.Count();
            lblsuma.Text = count3.ToString();
            lblcodigo.Text = codigo.ToString();
            r1.DataSource = dt;
            r1.DataBind();
        }

    }
}