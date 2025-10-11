using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;
using System.Web.Routing;

namespace IngenieriaVisualPH
{
    public class WebApiApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {

        }
        void Session_End(object sender, EventArgs e)
        {
            // Redirige al usuario a la página de inicio de sesión
            Response.Redirect("Login.aspx");
        }
    }
}