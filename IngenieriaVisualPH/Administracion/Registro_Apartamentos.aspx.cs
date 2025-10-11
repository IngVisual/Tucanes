using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;


namespace IngenieriaVisualPH.Administracion
{   
    public partial class Formulario_web11 : System.Web.UI.Page
    {
        Datos.MapeoSolicitudes mapeo = new Datos.MapeoSolicitudes();
        Datos.MapeoParqueadero mapeocar = new Datos.MapeoParqueadero();
        Datos.MapeoParqueaderos mapeopar = new Datos.MapeoParqueaderos();
        Datos.MapeoMudanzas mapeomud = new Datos.MapeoMudanzas();
        Datos.MapeoRegistros mapeoreg = new Datos.MapeoRegistros();
        Datos.MapeoChip mapeochip = new Datos.MapeoChip();
        Datos.MapeoSC mapeosc = new Datos.MapeoSC();
        Datos.MapeoSaldos mapeosaldo = new Datos.MapeoSaldos();
        Datos.MapeoUsuarios mapeousu = new Datos.MapeoUsuarios();
        Datos.MapeoMascotas mapeomasc = new Datos.MapeoMascotas();
        Modelo.EntidadUsuario usuario = new Modelo.EntidadUsuario();
        Modelo.EntidadesPQR pqr = new Modelo.EntidadesPQR();
        Modelo.EntidadesPQR pqr1 = new Modelo.EntidadesPQR();
        Modelo.EntidadMascota mascota = new Modelo.EntidadMascota();
        private int count1,count2;
        Datos.Conexion con = new Datos.Conexion();
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void txtbuscar_TextChanged(object sender, EventArgs e)
        {
            if(txtbuscar.Text !="")
            {
            div1.Style.Add("display", "none");
            usuario.Codigo = int.Parse(txtbuscar.Text);
                //---------------------------------Mostrar ultimos tres ingresos.
                var codigo = int.Parse(txtbuscar.Text);
                con.Abrir();
                string query = "SELECT TOP 3 * FROM tbl_RegistroLogin WHERE Codigo = @Codigo ORDER BY FechaIngreso DESC";
                SqlCommand command = new SqlCommand(query, con.conexion);
                command.Parameters.AddWithValue("@Codigo", codigo);
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                DataTable dataTable = new DataTable();
                adapter.Fill(dataTable);
                con.Cerrar();
                R1registro.DataSource = dataTable;
                R1registro.DataBind();
                //--------------------------------
                DataTable dt = mapeousu.LeerUsuario(usuario);
               foreach (DataRow item in dt.Rows)
               {
                lblingresos.Text = item["Conteo"].ToString();
                lblnombre.Text = item["NombrePropietario"].ToString();
                lblcorreo.Text = item["Email"].ToString();
                lbltelpro1.Text = item["Celular"].ToString();
                lbltelpro2.Text = item["OtroCelular"].ToString();
                lbltelarre.Text = item["CelularArr"].ToString();
                lblestado.Text = item["Estado"].ToString();
                lbladultos.Text = item["Npersonas"].ToString();
                lblmenores.Text = item["NMenores"].ToString();
                lblmascotas.Text = item["Nmascotas"].ToString();
                lblrazas.Text = item["Razas"].ToString();
               }

                r10.Visible = true;
                r10.DataSource = dt;
                r10.DataBind();

                DataTable dt1 = mapeosaldo.MostrarSaldo(usuario);
                foreach (DataRow item in dt1.Rows)
                {
                    lbltotal.Text = item["Total"].ToString();
                    lblfavor.Text = item["Juridico"].ToString();
                }

                pqr.Codigo = int.Parse(txtbuscar.Text);
                DataTable dt2 = mapeo.MostrarPQR(pqr);
                count1 = Convert.ToInt32(dt2.Rows.Count.ToString());
                lblpqrs.Text = count1.ToString();

                pqr1.Codigo1 = txtbuscar.Text;
                DataTable dt3 = mapeo.MostrarPQRLLamado(pqr1);
                count2 = Convert.ToInt32(dt3.Rows.Count.ToString());
                lblllamad.Text = count2.ToString();

                DataTable dt4 = mapeo.MostrarPQRIndviCodigo(pqr);
                    r1.DataSource = dt4;
                    r1.DataBind();

                DataTable dt5 = mapeo.MostrarLLamdoIndviCodigo(pqr1);
                    r2.DataSource = dt5;
                    r2.DataBind();

                Modelo.EntidadMudanzas mud = new Modelo.EntidadMudanzas();
                mud.Codigo = int.Parse(txtbuscar.Text);
                DataTable dt6 = mapeomud.MostrarUnaMudanzaCodigo(mud);
                    r3.DataSource = dt6;
                    r3.DataBind();

                Modelo.EntidadSC sc = new Modelo.EntidadSC();
                sc.Codigo = int.Parse(txtbuscar.Text);
                DataTable dt7 = mapeosc.MostrarUnSCCodigo(sc);
                    r4.DataSource = dt7;
                    r4.DataBind();

                Modelo.EntidadesNovedadSaldo nov = new Modelo.EntidadesNovedadSaldo();
                nov.Codigo = int.Parse(txtbuscar.Text);
                DataTable dt8 = mapeo.MostrarUnNovSalCodigo(nov);
                    r5.DataSource = dt8;
                    r5.DataBind();

                Modelo.EntidadParqueadero solpar = new Modelo.EntidadParqueadero();
                solpar.Codigo = int.Parse(txtbuscar.Text);
                DataTable dt9 = mapeocar.MostrarUnSolPaqrCodigo(solpar);
                    r6.DataSource = dt9;
                    r6.DataBind();

                Modelo.EntidadChip chip = new Modelo.EntidadChip();
                chip.Codigo = int.Parse(txtbuscar.Text);
                DataTable dt10 = mapeochip.MostrarUnChipCodigo(chip);
                    r7.DataSource = dt10;
                    r7.DataBind();

                Datos.MapeoNotificaciones msg = new Datos.MapeoNotificaciones();
                msg._Codigo = int.Parse(txtbuscar.Text);
                DataTable dt13 = msg.MostrarMsgCodigo(msg);
                    r11.DataSource = dt13;
                    r11.DataBind();

                Modelo.EntidadesParqueadero parq = new Modelo.EntidadesParqueadero();
                parq.Codigo = int.Parse(txtbuscar.Text);
                DataTable dt11 = mapeopar.MostrarTableroParqCodigo(parq);
                    r8.DataSource = dt11;
                    r8.DataBind();

                Modelo.EntidadRegistroGeneral cicla = new Modelo.EntidadRegistroGeneral();
                cicla.Codigo = int.Parse(txtbuscar.Text);
                DataTable dt12 = mapeoreg.MostrarCicla(cicla);
                var result = dt12.AsEnumerable().Where(myRow => myRow.Field<string>("Estado") == "Autorizado").AsDataView();
                r9.DataSource = result;
                r9.DataBind();

                Modelo.EntidadBicicleta ciclas = new Modelo.EntidadBicicleta();
                ciclas.Codigo = int.Parse(txtbuscar.Text);
                DataTable dt15 = mapeoreg.Mostrar_UnaSolBicicodigo(ciclas);
                rcicla.DataSource = dt15;
                rcicla.DataBind();

                mascota.Codigo = int.Parse(txtbuscar.Text);
                DataTable dt16 = mapeomasc.MostrarMascotaCodigo(mascota);
                rmascota.DataSource = dt16;
                rmascota.DataBind();
            }
            else{
                div1.Style.Add("display","block");
            }
        }

    }
}