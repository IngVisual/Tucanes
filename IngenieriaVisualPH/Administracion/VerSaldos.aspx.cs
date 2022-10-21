using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Net;

namespace IngenieriaVisualPH.Administracion
{
    public partial class Formulario_web121 : System.Web.UI.Page
    {
        Datos.MapeoSaldos mapeo = new Datos.MapeoSaldos();
        Modelo.EntidadSaldos usuario = new Modelo.EntidadSaldos();
        private Datos.Conexion con = new Datos.Conexion();
        private int id;
        private string conjunto;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                conjunto = Session["conj"].ToString();
            }
            catch (Exception)
            {
                throw new Exception("Tiempo de sesion finalizado, por favor ingrese nuevamente a la app");
            }
            id = Convert.ToInt32(Request.QueryString["Id"].ToString());
            if (IsPostBack) return;
            usuario._IdCodigo = id;
            DataTable dt= mapeo.MostrarSaldo2(usuario);
            foreach (DataRow dr in dt.Rows)
            {
                lblcodigo.Text = dr["Codigo"].ToString();
                txtadm.Text = dr["Admi"].ToString();
                txtinte.Text = dr["Favor"].ToString();
                txtsanc.Text = dr["Inter"].ToString();
                txtpar.Text = dr["Sancion"].ToString();
                txtotro.Text = dr["Moto"].ToString();
                txtretro.Text = dr["Carro"].ToString();
                txttotal.Text = dr["Total"].ToString();
                txtfav.Text = dr["Juridico"].ToString();
            }
        }

        private int suma, adm, inter, sanc, parq, otro, retr, tota,  favo;
        protected void checkSuma_CheckedChanged(object sender, EventArgs e)
        {
            if (checkSuma.Checked == true)
            {
                txtadm.Enabled = true;
                txtinte.Enabled = true;
                txtsanc.Enabled = true;
                txtpar.Enabled = true;
                txtotro.Enabled = true;
                txtretro.Enabled = true;
            }
            else
            {
                txtadm.Text = "0";
                txtinte.Text = "0";
                txtsanc.Text = "0";
                txtpar.Text = "0";
                txtotro.Text = "0";
                txtretro.Text = "0";

                txtadm.Enabled = false;
                txtinte.Enabled = false;
                txtsanc.Enabled = false;
                txtpar.Enabled = false;
                txtotro.Enabled = false;
                txtretro.Enabled = false;
            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            adm = int.Parse(txtadm.Text);
            inter = int.Parse(txtinte.Text);
            sanc = int.Parse(txtsanc.Text);
            parq = int.Parse(txtpar.Text);
            otro = int.Parse(txtotro.Text);
            retr = int.Parse(txtretro.Text);
            tota = int.Parse(txttotal.Text);
            favo = int.Parse(txtfav.Text);
            suma = adm + inter + sanc + parq + otro + retr;

            if (checkSuma.Checked == true)
            {
                if (tota == suma)
                {
                    if (tota < 0)
                    {
                        favo = tota * (-1);
                        txtfav.Text = favo.ToString();
                        error2.Style.Add("display", "none");
                        error1.Style.Add("display", "block");
                        btnactualizar.Visible = true;
                    }
                    error2.Style.Add("display", "none");
                    error1.Style.Add("display", "block");
                    btnactualizar.Visible = true;
                }
                else
                {
                    error1.Style.Add("display", "none");
                    error2.Style.Add("display", "block");
                    btnactualizar.Visible = false;
                }
            }
            else
            {
                error2.Style.Add("display", "none");
                error1.Style.Add("display", "block");
                btnactualizar.Visible = true;
                txtadm.Text = "0";
                txtinte.Text = "0";
                txtsanc.Text = "0";
                txtpar.Text = "0";
                txtotro.Text = "0";
                txtretro.Text = "0";
            }
        }

        protected void btnactualizar_Click(object sender, EventArgs e)
        {
            ActualizarSaldo();
        }
        public void ActualizarSaldo()
        {
            usuario._IdCodigo = int.Parse(lblcodigo.Text);
            usuario._Admi = txtadm.Text;
            usuario._Favor = txtinte.Text;
            usuario._Inter = txtsanc.Text;
            usuario._Sancion = txtpar.Text;
            usuario._Moto = txtotro.Text;
            usuario._Carro = txtretro.Text;
            usuario._Total = txttotal.Text;
            usuario._Juridico = txtfav.Text;
            mapeo.ActualizarSaldo(usuario);
            Response.Redirect("SaldoAdministracion.aspx");
        }

    }
}