using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace IngenieriaVisualPH.Empleados
{
    public partial class Formulario_web122 : System.Web.UI.Page
    {
        Datos.MapeoAlquilerParqueadero mapeo = new Datos.MapeoAlquilerParqueadero();
        Modelo.AlquilerParqueadero.Transferencias transf = new Modelo.AlquilerParqueadero.Transferencias();
        int idGuarda;
        protected void Page_Load(object sender, EventArgs e)
        {
            ObtenerTransferenciaCajaMenor();
        }

        private void ObtenerTransferenciaCajaMenor()
        {
            DataTable dt1 = mapeo.MostrarUltimaTransferencias();
            foreach (DataRow dr in dt1.Rows)
            {
                idGuarda = Convert.ToInt32(dr["UsuarioDestino"].ToString());
                lblUsuarioDestino.Text = dr["NombreDestino"].ToString();
                lblUsuarioDestino2.Text = dr["NombreDestino"].ToString();
                lblUsuarioDestino3.Text = dr["NombreDestino"].ToString();
                lblCajaMenorGuarda.Text = dr["CajaMenorGuarda"].ToString();
                txtcmGuarda.Text = dr["CajaMenorGuarda"].ToString();
                txtcmAdmin.Text = dr["CajaMenorGuarda"].ToString();
                lblExcedenteGuarda.Text = dr["ExcedenteGuarda"].ToString();
                lblultiexcedente.Text = dr["ExcedenteGuarda"].ToString();
                DateTime fecha = Convert.ToDateTime(dr["FechaTransferencia"].ToString());
                lblFechaTransferencia.Text = fecha.Date.ToString("dd/MM/yyyy");
                lbltransferencia.Text = dr["Transferencia"].ToString();

                if (lblCajaMenorGuarda.Text == "0" && lblExcedenteGuarda.Text == "0")
                {
                    CMaGuarda.Style.Add("display", "block");
                    CMActualGuarda.Style.Add("display", "none");
                }
                else if (lblCajaMenorGuarda.Text != "0")
                {
                    CMaGuarda.Style.Add("display", "none");
                    CMActualGuarda.Style.Add("display", "block");
                }
            }
        }

        protected void btnentrega_Click(object sender, EventArgs e)
        {
            if (txtexcedente.Text != "")
            {
                var sumatra = Convert.ToInt32(txtcmGuarda.Text) + Convert.ToInt32(txtexcedente.Text);
                if (sumatra >= Convert.ToInt32(lbltransferencia.Text))
                {
                    transf.UsuarioRemitente = idGuarda;
                    transf.UsuarioDestino = Convert.ToInt32(ddGuarda.Text);
                    transf.Transferencia = sumatra;
                    transf.CajaMenorGuarda = Convert.ToInt32(txtcmGuarda.Text);
                    transf.CajaMenorAdmin = 0;
                    transf.ExcedenteAdmin = 0;
                    transf.ExcedenteGuarda = Convert.ToInt32(txtexcedente.Text);
                    transf.FechaTransferencia = DateTime.Now;
                    mapeo.GuardarTransferencia(transf);
                    Response.Redirect("EmpAlquilerParqueaderoCM.aspx");
                }
                else
                {
                    error2.Style.Add("display", "block");
                }
            }
            else
            {
                error1.Style.Add("display", "block");
            }
        }

        protected void btnEntregaAdmin_Click(object sender, EventArgs e)
        {
            if (txtexcedente2.Text != "")
            {
                var sumatra = Convert.ToInt32(txtcmAdmin.Text) + Convert.ToInt32(txtexcedente2.Text);
                if (sumatra >= Convert.ToInt32(lbltransferencia.Text))
                {
                    transf.UsuarioRemitente = idGuarda;
                    transf.UsuarioDestino = 1;
                    transf.Transferencia = sumatra;
                    transf.CajaMenorGuarda = 0;
                    transf.CajaMenorAdmin = Convert.ToInt32(txtcmAdmin.Text);
                    transf.ExcedenteAdmin = Convert.ToInt32(txtexcedente2.Text);
                    transf.ExcedenteGuarda = 0;
                    transf.FechaTransferencia = DateTime.Now;
                    mapeo.GuardarTransferencia(transf);
                    Response.Redirect("EmpAlquilerParqueaderoCM.aspx");
                }
                else
                {
                    error2.Style.Add("display", "block");
                }
            }
            else
            {
                error1.Style.Add("display", "block");
            }
        }
    }
}