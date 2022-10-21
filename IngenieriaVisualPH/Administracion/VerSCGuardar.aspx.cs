using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace IngenieriaVisualPH.Administracion
{
    public partial class Formulario_web113 : System.Web.UI.Page
    {
        LogicaNeg.CSolictudSC sc = new LogicaNeg.CSolictudSC();
        Modelo.EntidadSC SC = new Modelo.EntidadSC();
        List<Modelo.EntidadSC> list = new List<Modelo.EntidadSC>();
        int idsc = 0, codigo, id;
        DateTime fechahoy = DateTime.Now.ToLocalTime();
        bool estadoSolictud;
        string respuesta = "Pendiente";

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

            if (!IsPostBack)
            {
                    MostrarSC();
            }

        }
        protected void btnbuscar_Click(object sender, EventArgs e)
        {
            if (lblprecio.Text == "0" || txtfecha.Text == "" || ddsc.SelectedValue == "1")
            {
                lblMessage.Visible = true;
                lblMessage.Text = "Seleccione un SALON SOCIAL";
            }
            else
            {
                int ReturnValor = sc.BuscarDisponiSC(Convert.ToDateTime(txtfecha.Text), int.Parse(ddsc.Text));
                if (ReturnValor == 0)
                {
                    ListaSC(list);
                    lblfecha.Text = txtfecha.Text;
                    error.Style.Add("display", "block");
                    lblMessage.Visible = false;
                    buscar.Style.Add("display", "none");
                    MostrarMsg();
                }
                else
                {
                    lblMessage.Visible = true;
                    lblMessage.Text = "Lo Sentimos, en esta fecha el Salon Comunal se encuentra RESERVADO.";
                    error.Style.Add("display", "none");
                }
            }
        }

        protected void ddsc_SelectedIndexChanged(object sender, EventArgs e)
        {
            list = sc.LLamarPrecios(int.Parse(ddsc.Text));
            ListaSC(list);
            lblMessage.Visible = false;
        }

        public void ListaSC(List<Modelo.EntidadSC> list)
        {
            foreach (Modelo.EntidadSC item in list)
            {
                lblprecio.Text = item._ValorSC.ToString();
                lblsc.Text = item._SalCom.ToString();
            }
        }
        public void MostrarMsg()
        {
            lblmsm.Text = sc.MostrarMsgPago();
        }
        public void MostrarSC()
        {
            DataTable dt = sc.MostrarTablaSC(fechahoy);
            r1.DataSource = dt;
            r1.DataBind();
        }

        protected void btnsi_Click(object sender, EventArgs e)
        {
            estadoSolictud = true;
            Reservar(estadoSolictud);
            Response.Redirect("VerSCGuardar.aspx");
        }

        protected void btnno_Click(object sender, EventArgs e)
        {
            buscar.Style.Add("display", "block");
            error.Style.Add("display", "none");
        }

        public void Reservar(bool reserva)
        {
            if (reserva == true)
            {
                DateTime fechapag = fechahoy.AddDays(3);
                int resultado = sc.GuardarReservaSC(true, int.Parse(ddsc.Text), Convert.ToDateTime(txtfecha.Text), fechahoy, fechapag, codigo);
            }
        }

        protected void btnfinSol_Click(object sender, EventArgs e)
        {
            Session["cod"] = codigo;
            Response.Redirect("VerSCFinalizar.aspx");
        }
    }
}