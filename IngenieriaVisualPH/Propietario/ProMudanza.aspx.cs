using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IngenieriaVisualPH.Propietario
{
    public partial class Formulario_web129 : System.Web.UI.Page
    {
        public string date;
        protected void Page_Load(object sender, EventArgs e)
        {
            date = Request.QueryString["date"].ToString();
            if (IsPostBack) return;
            date2.Text = date;
        }

        protected void link1_Click(object sender, EventArgs e)
        {
            Response.Redirect("ProSalMud.aspx?date=" + date2.Text + "");
        }

        protected void link2_Click(object sender, EventArgs e)
        {
            Response.Redirect("ProSalArt.aspx?date=" + date2.Text + "");
        }

        protected void link3_Click(object sender, EventArgs e)
        {
            Response.Redirect("ProIngMud.aspx?date=" + date2.Text + "");
        }

        protected void link4_Click(object sender, EventArgs e)
        {
            Response.Redirect("ProIngArt.aspx?date=" + date2.Text + "");
        }

        protected void link5_Click(object sender, EventArgs e)
        {
            Response.Redirect("ProConstruccion.aspx?date=" + date2.Text + "");
        }
    }
}