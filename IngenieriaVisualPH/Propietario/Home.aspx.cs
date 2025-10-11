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
    public partial class Formulario_web1 : System.Web.UI.Page
    {
        Datos.MapeoUsuarios mapeo = new Datos.MapeoUsuarios();
        Datos.MapeoSaldos mapeosaldo = new Datos.MapeoSaldos();
        Modelo.EntidadUsuario usuario = new Modelo.EntidadUsuario();
        private int codigo;
        int id;
        Datos.Conexion con = new Datos.Conexion();
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
            usuario.Codigo = codigo;
            DataTable dt = mapeo.LeerUsuario(usuario);
            foreach (DataRow item in dt.Rows)
            {
                lblnombre.Text = item["NombrePropietario"].ToString();
                lbltelpro1.Text = item["Celular"].ToString();
                lbltelpro2.Text = item["OtroCelular"].ToString();
                lblcorreo.Text = item["Email"].ToString();
                lblestado.Text = item["Estado"].ToString();
                lbltelarre.Text = item["CelularArr"].ToString();
            }
            //Se retira en la tercera version.
            //MostrarSaldo();
            MostrarParqueadero();
            MostrarBicicleta();
            try
            {
                con.Abrir();
                id = 1;
                SqlCommand cmd2 = con.conexion.CreateCommand();
                cmd2.CommandType = CommandType.Text;
                cmd2.CommandText = "select * from tblCarrusel where Id=" + id + "";
                cmd2.ExecuteNonQuery();
                DataTable dt2 = new DataTable();
                SqlDataAdapter da2 = new SqlDataAdapter(cmd2);
                da2.Fill(dt2);
                r2.DataSource = dt2;
                r2.DataBind();
                con.Cerrar();
            }
            catch
            {

            }

        }
        //se retira en la tercera version.
        //public void MostrarSaldo()
        //{
        //    usuario.Codigo = codigo;
        //    DataTable dt = mapeosaldo.MostrarSaldo(usuario);
        //    foreach (DataRow item in dt.Rows)
        //    {
        //        lbltotal.Text = item["Total"].ToString();
        //        lblfavor.Text = item["Juridico"].ToString();
        //    }
        //}

        public void MostrarParqueadero()
        {
            Datos.MapeoParqueaderos mapeopar = new Datos.MapeoParqueaderos();
            Modelo.EntidadesParqueadero parq = new Modelo.EntidadesParqueadero();
            parq.Codigo = codigo;
            DataTable dt11 = mapeopar.MostrarTableroParqCodigo(parq);
            r8.DataSource = dt11;
            r8.DataBind();
        }
        public void MostrarBicicleta()
        {
            Datos.MapeoRegistros mapeopar = new Datos.MapeoRegistros();
            Modelo.EntidadBicicleta parq = new Modelo.EntidadBicicleta();
            parq.Codigo = codigo;
            DataTable dt12 = mapeopar.Mostrar_UnaSolBicicodigo(parq);
            var result = dt12.AsEnumerable().Where(myRow => myRow.Field<string>("Estado") == "Autorizado").AsDataView();
            r9.DataSource = result;
            r9.DataBind();
        }

    }
}