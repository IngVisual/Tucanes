using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace IngenieriaVisualPH.Propietario
{
    public partial class Formulario_web142 : System.Web.UI.Page
    {
        LogicaNeg.CSolictudSC sc = new LogicaNeg.CSolictudSC();
        Modelo.EntidadSC SC = new Modelo.EntidadSC();
        List<Modelo.EntidadSC> list = new List<Modelo.EntidadSC>();
        int idsc = 0, codigo, id;
        DateTime fechahoy = DateTime.Now.ToLocalTime();
        bool estadoSolictud;
        string respuesta = "Pendiente";
        private int dia = 15;
        private bool validacion;
        Datos.MapeoMudanzas mud = new Datos.MapeoMudanzas();

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
                sc.EliminarReservaTablaSC(fechahoy);
                int resultres= MostrarTablaSCApa();
                if (resultres == 1)
                {
                    tablero1.Style.Add("display", "none");
                    tablero2.Style.Add("display", "block");
                }
                else
                {
                tablero2.Style.Add("display", "none");                          
                lblMessage.Visible = false;
                list = sc.LLamarPrecios(idsc);
                ListaSC(list);
                error1.Style.Add("display", "block");
                MostrarSC();
                }
                Msg();
            }
                
        }
        protected void Msg()
        {
            Datos.MapeoMsg mapeomsg = new Datos.MapeoMsg();
            Modelo.EntidadMsg msg = new Modelo.EntidadMsg();
            msg._Id = 1;
            DataTable dt = mapeomsg.MostrarMsg(msg);
            foreach (DataRow item in dt.Rows)
            {
             lblmsg22.Text = item["MsgSC"].ToString();
             lblmag23.Text = item["MsgSC"].ToString();
            }
            if (lblmsg22.Text != "")
            {
                mensaje.Style.Add("display", "block");
                mensaje2.Style.Add("display", "block");
            }
            else { mensaje.Style.Add("display", "none" ); mensaje2.Style.Add("display", "none"); }
        }
        protected void btnbuscar_Click(object sender, EventArgs e)
        {
            error1.Style.Add("display", "none");
            if (lblprecio.Text == "0" || txtfecha.Text == "" || ddsc.SelectedValue == "1")
            {
                lblMessage.Visible = true;
                lblMessage.Text = "Seleccione un SALON COMUNAL";

            }
            else
            {
                int ReturnValor = sc.BuscarDisponiSC(Convert.ToDateTime(txtfecha.Text), int.Parse(ddsc.Text));
                validacion = mud.ValidarFecha(Convert.ToDateTime(txtfecha.Text), dia);
                if (validacion == false)
                {
                    lblMessage.Text = "Seleccione otra fecha, Su solicitud se debe realizar con " + dia + " días de anticipación a la fecha del evento. De lo contrario comuníquese con " + " ADMINISTRACION en los horarios de atención para que validen su solicitud.";
                    lblMessage.Visible = true;
                }
                else if (ReturnValor == 0)
                {
                    ListaSC(list);
                    lblfecha.Text = txtfecha.Text;
                    error.Style.Add("display", "block");
                    lblMessage.Visible = false;
                    buscar.Style.Add("display", "none");
                    programacion.Style.Add("display", "none");
                    MostrarMsg();
                }
                else
                {
                    lblMessage.Visible = true;
                    lblMessage.Text = "Lo Sentimos, en esta fecha el SALON COMUNAL se encuentra RESERVADO.";
                    error.Style.Add("display", "none");
                }
            }
        }

        protected void ddsc_SelectedIndexChanged(object sender, EventArgs e)
        {
            error1.Style.Add("display", "none");
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
            DataTable dt= sc.MostrarTablaSC(fechahoy);
            r1.DataSource = dt;
            r1.DataBind();        
        }        

        protected void btnsi_Click(object sender, EventArgs e)
        {
            estadoSolictud = true;
            Reservar(estadoSolictud);
            Response.Redirect("VerificarDisponibilidadSC.aspx");
        }

        protected void btnno_Click(object sender, EventArgs e)
        {
            buscar.Style.Add("display", "block");
            programacion.Style.Add("display", "block");
            error.Style.Add("display", "none");
        }

        public void Reservar(bool reserva)
        {
            if(reserva==true)
            {
                DateTime fechapag = fechahoy.AddDays(3);
                int resultado = sc.GuardarReservaSC(true, int.Parse(ddsc.Text), Convert.ToDateTime(txtfecha.Text), fechahoy, fechapag, codigo );
            }
        }

        protected void btnfinSol_Click(object sender, EventArgs e)
        {
            Session["cod"] = codigo;
            Session["id"] = lblid.Text;
            Response.Redirect("SerSalonComunal.aspx");
        }

        protected void btncancelar_Click(object sender, EventArgs e)
        {
            EliminarSol();
        }

        public int MostrarTablaSCApa()
        {

            lblmsg2.Text = sc.MostrarMsgPago();
            int resultadoApa = sc.MostrarSCApartamento(codigo, "Reservado");
            DataTable dt= sc.MostrarSCApartamentoTabla(codigo, "Reservado");
            foreach (DataRow item in dt.Rows)
            {
                lblfechapago.Text = item["FechaPago"].ToString();
                lblid.Text = item["Id"].ToString();
            }
            r2.DataSource = dt;
            r2.DataBind();
            return resultadoApa;
        }

        public void EliminarSol()
        {
            id = int.Parse(lblid.Text);
            int valor= sc.EliminarSC(id);
            if (valor==1)
            {
                Response.Redirect("VerificarDisponibilidadSC.aspx");
            }

        }
    }
}