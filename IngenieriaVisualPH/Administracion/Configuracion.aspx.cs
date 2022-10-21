using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace IngenieriaVisualPH.Administracion
{
    public partial class Formulario_web128 : System.Web.UI.Page
    {
        Modelo.EntidadContrato contrato = new Modelo.EntidadContrato();
        Modelo.EntidadValores valores = new Modelo.EntidadValores();
        Datos.MapeoContrato mapeocont = new Datos.MapeoContrato();
        Datos.MapeoSaldos mapeo = new Datos.MapeoSaldos();
        Datos.MapeoOtrosPagos mapeo2 = new Datos.MapeoOtrosPagos();
        Datos.MapeoMsg mapeomsg = new Datos.MapeoMsg();
        Modelo.EntidadMsg msg = new Modelo.EntidadMsg();
        private int IdContrato = 1, IdMsg= 1;
        private string Contrato, Tipo, tipoValor;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                llamarContratos();
                MostrarValoAdm();
                MostrarValoAdmDESC();
                MostrarValorCHIP();
                MostrarValorPARQ();
                MostrarValorSC();
                Msg();
            }           
        }
        protected void llamarContratos()
        {          
            contrato.IdContrato = IdContrato;
            DataTable dt = mapeocont.MostrarContrato(contrato);
            foreach (DataRow item in dt.Rows)
            {
                txtpolpri.Text = item["ContratoDatos"].ToString();
                txtpolMud.Text = item["ContratoMudanza"].ToString();
                txtpolconv.Text = item["ContratoRegistro"].ToString();
                txtpolsc.Text = item["ContratoSC"].ToString();
                txtpolpar.Text = item["ContratoParqueadero"].ToString();
            }
        }
        protected void ActualizarContrato(string contr, string tipo)
        {
            contrato.IdContrato = IdContrato;
            contrato._ConGen = contr;
            contrato._Tipo = tipo;
            mapeocont.ActualizarContrato(contrato);
        }
        protected void MostrarValoAdm()
        {
            DataTable dt1 = mapeo.MostrarValorAdmInd();
            r1.DataSource = dt1;
            r1.DataBind();
        }
        protected void MostrarValoAdmDESC()
        {
            DataTable dt1 = mapeo.MostrarValorAdmDesc();
            r2.DataSource = dt1;
            r2.DataBind();
        }
        protected void MostrarValorCHIP()
        {
            DataTable dt1 = mapeo2.MostrarvalorChip();
            r3.DataSource = dt1;
            r3.DataBind();
        }   
        protected void MostrarValorPARQ()
        {
            DataTable dt = mapeo2.MostrarvalorParq();
            r4.DataSource = dt;
            r4.DataBind();
        }
        protected void MostrarValorSC()
        {
            DataTable dt = mapeo2.MostrarvalorSC();
            r5.DataSource = dt;
            r5.DataBind();
        }

        protected void RegistroValores(string tipovalor, double valor, string observ)
        {
            valores.ValorAdm = valor;
            valores.Observ = observ;
            valores.Tipo = tipovalor;
            mapeo2.RegistrarValores(valores);
        }

        protected void RegistroDescuento()
        {
            valores.ValorAdm = int.Parse(txtval.Text);
            valores.Id= int.Parse(ddvalor.Text);
            valores.DescuentoAdm = txtdesc.Text;
            mapeo2.RegistrarDescuento(valores);
        }

        protected void btnpolpri_Click(object sender, EventArgs e)
        {
            Contrato = txtpolpri.Text;
            Tipo = "Datos";
            ActualizarContrato(Contrato,Tipo);
        }

        protected void btnpolmud_Click(object sender, EventArgs e)
        {
            Contrato = txtpolMud.Text;
            Tipo = "Mudanza";
            ActualizarContrato(Contrato, Tipo);
        }

        protected void btnpolconv_Click(object sender, EventArgs e)
        {
            Contrato = txtpolconv.Text;
            Tipo = "Registro";
            ActualizarContrato(Contrato, Tipo);
        }

        protected void btnpolsc_Click(object sender, EventArgs e)
        {
            Contrato = txtpolsc.Text;
            Tipo = "SC";
            ActualizarContrato(Contrato, Tipo);
        }

        protected void btnpolpar_Click(object sender, EventArgs e)
        {
            Contrato = txtpolpar.Text;
            Tipo = "Parqueadero";
            ActualizarContrato(Contrato, Tipo);
        }

        protected void btndescuen_Click(object sender, EventArgs e)
        {
            RegistroDescuento();
            MostrarValoAdmDESC();
        }

        protected void btnchip_Click(object sender, EventArgs e)
        {
            tipoValor = "Chip";
            RegistroValores(tipoValor, int.Parse(txtvalorchip.Text), txtchip.Text);
            MostrarValorCHIP();
        }

        protected void btnparqu_Click(object sender, EventArgs e)
        {
            tipoValor = "Parqueadero";
            RegistroValores(tipoValor, int.Parse(txtvalopar.Text), txtparqu.Text);
            MostrarValorPARQ();
        }

        protected void Msg()
        {
          msg._Id = IdMsg;
          DataTable dt= mapeomsg.MostrarMsg(msg);
            foreach (DataRow item in dt.Rows)
            {
                txtmsgchip.Text = item["MsgChip"].ToString();
                txtmsgpar.Text = item["MsgParqueadero"].ToString();
                txtmsgsc.Text = item["MsgSC"].ToString();
                txtmsgmud.Text = item["MsgMud"].ToString();
            }
        }
        protected void ActualizarMsg(string tipo, string mensaje )
        {
            msg._Id = IdMsg;
            msg._Msg = mensaje;
            msg.Tipo = tipo;
            mapeomsg.ActualizarMsg(msg);
            Msg();
        }

        protected void btnguamsgpar_Click(object sender, EventArgs e)
        {
            tipoValor = "Parqueadero";
            ActualizarMsg(tipoValor, txtmsgpar.Text);
        }

        protected void btnguamsgsc_Click(object sender, EventArgs e)
        {
            tipoValor = "SC";
            ActualizarMsg(tipoValor, txtmsgsc.Text);
        }

        protected void btnguamsgchi_Click(object sender, EventArgs e)
        {
            tipoValor = "Chip";
            ActualizarMsg(tipoValor, txtmsgchip.Text);
        }

        protected void btnguamsgmud_Click(object sender, EventArgs e)
        {
            tipoValor = "Mudanza";
            ActualizarMsg(tipoValor, txtmsgmud.Text);
        }

        protected void btnsc_Click(object sender, EventArgs e)
        {
            tipoValor = "SC";
            RegistroValores(tipoValor, int.Parse(txtvasc.Text), txtsc.Text);
            MostrarValorSC();
        }

        protected void btnguavalAdm_Click(object sender, EventArgs e)
        {
            tipoValor = "Administracion";
            RegistroValores(tipoValor, int.Parse(txtvalor.Text), txtadmn.Text);
            MostrarValoAdm();
            MostrarValoAdmDESC();
        }

    }
}