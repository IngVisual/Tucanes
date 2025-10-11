using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IngenieriaVisualPH.Administracion
{
    public partial class Formulario_web149 : System.Web.UI.Page
    {
        Datos.MapeoAlquilerParqueadero mapeo = new Datos.MapeoAlquilerParqueadero();
        Modelo.AlquilerParqueadero.Transferencias transf = new Modelo.AlquilerParqueadero.Transferencias();
        protected void Page_Load(object sender, EventArgs e)
        {
            ObtenerTransferenciaCajaMenor();
        }

        private void ObtenerTransferenciaCajaMenor()
        {
            DataTable dt = mapeo.MostrarTransferencias();
            r1.DataSource = dt;
            r1.DataBind();
            DataTable dt1 = mapeo.MostrarUltimaTransferencias();
            foreach (DataRow dr in dt1.Rows)
            {
                lblUsuarioDestino.Text = dr["NombreDestino"].ToString();
                lblCajaMenorAdmin.Text = dr["CajaMenorAdmin"].ToString();
                lblExcedenteAdmin.Text = dr["ExcedenteAdmin"].ToString();
                lblCajaMenorGuarda.Text = dr["CajaMenorGuarda"].ToString();
                lblExcedenteGuarda.Text = dr["ExcedenteGuarda"].ToString();
                DateTime fecha = Convert.ToDateTime(dr["FechaTransferencia"].ToString());
                lblFechaTransferencia.Text = fecha.Date.ToString("dd/MM/yyyy");

                if (lblExcedenteAdmin.Text == "0" && lblCajaMenorAdmin.Text == "0"
                    && lblCajaMenorGuarda.Text == "0" && lblExcedenteGuarda.Text == "0")
                {
                    CMaGuarda.Style.Add("display", "block");
                    CMRetirar.Style.Add("display", "none");
                    CMActualGuarda.Style.Add("display", "none");
                }
                else if (lblExcedenteAdmin.Text == "0" && lblCajaMenorAdmin.Text == "0")
                {
                    CMaGuarda.Style.Add("display", "none");
                    CMRetirar.Style.Add("display", "none");
                    CMActualGuarda.Style.Add("display", "block");
                }
                else if (lblCajaMenorAdmin.Text != "0")
                {
                    CMaGuarda.Style.Add("display", "none");
                    CMRetirar.Style.Add("display", "block");
                    CMActualGuarda.Style.Add("display", "none");
                }
            }
        }

        protected void btnentrega_Click(object sender, EventArgs e)
        {
            if (txtguarda.Text != "" && txtguarda.Text != "0")
            {
                transf.UsuarioRemitente = 1;
                transf.UsuarioDestino = Convert.ToInt32(ddGuarda.Text);
                transf.Transferencia = Convert.ToInt32(txtguarda.Text);
                transf.CajaMenorGuarda = Convert.ToInt32(txtguarda.Text);
                transf.CajaMenorAdmin = 0;
                transf.ExcedenteAdmin = 0;
                transf.ExcedenteGuarda = 0;
                transf.FechaTransferencia = DateTime.Now;
                mapeo.GuardarTransferencia(transf);
                Response.Redirect("AlquilerParqueaderoCM.aspx");
            }
            else
            {
                error1.Style.Add("display", "block");
            }
        }

        protected void btnRetirar_Click(object sender, EventArgs e)
        {
            if (txtguarda.Text != "")
            {
                var sumatra = Convert.ToInt32(lblCajaMenorAdmin.Text) + Convert.ToInt32(lblExcedenteAdmin.Text);
                transf.UsuarioRemitente = 1;
                transf.UsuarioDestino = 1;
                transf.Transferencia = sumatra;
                transf.CajaMenorGuarda = 0;
                transf.CajaMenorAdmin = 0;
                transf.ExcedenteAdmin = 0;
                transf.ExcedenteGuarda = 0;
                transf.FechaTransferencia = DateTime.Now;
                mapeo.GuardarTransferencia(transf);
                Response.Redirect("AlquilerParqueaderoCM.aspx");
            }
            else
            {
                error1.Style.Add("display", "block");
            }
        }
    }
}