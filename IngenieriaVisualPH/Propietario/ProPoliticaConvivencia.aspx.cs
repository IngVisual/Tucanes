using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace IngenieriaVisualPH.Propietario
{
    public partial class Formulario_web16 : System.Web.UI.Page
    {
        Modelo.EntidadContrato contrato = new Modelo.EntidadContrato();
        Datos.MapeoContrato mapeocont = new Datos.MapeoContrato();
        private int IdContrato = 1;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                llamarContratos();
            }
        }
        protected void llamarContratos()
        {
            contrato.IdContrato = IdContrato;
            DataTable dt = mapeocont.MostrarContrato(contrato);
            foreach (DataRow item in dt.Rows)
            {
                lblmsg.Text = item["ContratoRegistro"].ToString();
            }
        }
    }
}