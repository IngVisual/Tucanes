using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LogicaNeg;
using System.Data.SqlClient;
using System.Data;

namespace IngenieriaVisualPH.Empleados
{
    public partial class Formulario_web118 : System.Web.UI.Page
    {
        ParqAlquiler filtros = new ParqAlquiler();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DateTime utcNow = DateTime.UtcNow;
                TimeZoneInfo colombiaTimeZone = TimeZoneInfo.FindSystemTimeZoneById("SA Pacific Standard Time");
                DateTime colombiaTime = TimeZoneInfo.ConvertTimeFromUtc(utcNow, colombiaTimeZone);
                txtfechaini.Text = colombiaTime.ToString("yyyy-MM-dd HH:mm:ss");
                txtfechafinal.Text = colombiaTime.ToString("yyyy-MM-dd HH:mm:ss");
                Pagos(Convert.ToDateTime(txtfechaini.Text), Convert.ToDateTime(txtfechafinal.Text));
            }
        }

        protected void txtfechaini_TextChanged(object sender, EventArgs e)
        {
            Pagos(Convert.ToDateTime(txtfechaini.Text), Convert.ToDateTime(txtfechafinal.Text));
        }

        protected void txtfechafinal_TextChanged(object sender, EventArgs e)
        {
            Pagos(Convert.ToDateTime(txtfechaini.Text), Convert.ToDateTime(txtfechafinal.Text));
        }

        public void Pagos(DateTime fechaini, DateTime fechafinal)
        {
            var dataTotal = filtros.FiltrarPagosTotal(fechaini, fechafinal);
            var dataFacturado = filtros.FiltrarPagosFacturado(fechaini, fechafinal);
            var dataNovedad = filtros.FiltrarPagosNovedad(fechaini, fechafinal);
            var dataCancelado = filtros.FiltrarPagosCancelado(fechaini, fechafinal);
            var dt = filtros.FiltrarPagos(fechaini, fechafinal);
            Vista(dataTotal, dataFacturado, dataNovedad, dataCancelado, dt);
        }

        private void Vista(DataTable dataTotal, DataTable dataFacturado, DataTable dataNovedad, DataTable dataCancelado, DataTable dt)
        {
            lblfechaIni.Text = txtfechaini.Text;
            lblfechafin.Text = txtfechafinal.Text;
            foreach (DataRow item in dataTotal.Rows)
            {
                lbltotal.Text = item["TotalFiltro"].ToString();
            }
            foreach (DataRow item in dataFacturado.Rows)
            {
                lblfacturado.Text = item["Facturado"].ToString();
            }
            foreach (DataRow item in dataNovedad.Rows)
            {
                lblnovedad.Text = item["Novedad"].ToString();
            }
            foreach (DataRow item in dataCancelado.Rows)
            {
                lblcancelado.Text = item["Cancelado"].ToString();
            }
            r1.DataSource = dt;
            r1.DataBind();
        }
    }
}