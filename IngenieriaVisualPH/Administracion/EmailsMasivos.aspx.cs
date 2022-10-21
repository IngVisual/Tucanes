using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Net;
using System.Net.Mail;
using System.Text;

namespace IngenieriaVisualPH.Administracion
{
    public partial class Formulario_web145 : System.Web.UI.Page
    {
        private string conjunto;
        Datos.MapeoUsuarios mapeoCorreo = new Datos.MapeoUsuarios();

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
        }

        protected void BtnEnviar_Click(object sender, EventArgs e)
        {
            DataTable dt = mapeoCorreo.TablaUsuario();
            try
            {
                foreach (DataRow item in dt.Rows)
                {
                    string codigo = item["Codigo"].ToString();
                    string validacion = item["AceptaTerminosyCondiciones"].ToString();
                    string mail = item["Email"].ToString();
                    string id = item["Id"].ToString();
                    int _Id = Convert.ToInt32(id);
                    string asunto = txttitulo.Text;
                    string mensaje1 = txtmsg.Text;
                    string link = txtLink.Text;
                    if (mail != "" && validacion != "Si" && _Id < 30)
                    {
                        MailMessage mailMensaje = new MailMessage("propiedadhorizontal@ingenieriavisualph.com", mail);

                        StringBuilder BodyEmail = new StringBuilder();
                        string link2 = "https://api.whatsapp.com/send?phone=573002435992&fbclid=IwAR0B0J1W5ikmkzLArvAjBjw2kva7ZQnic9FtHSTutgSyRDRiuMIIUrhqVFo";
                        BodyEmail.Append("<h2>  <spam> </span><strong>!IMPORTANTE:</strong> Este correo es informativo y no se debe responder sobre él.</h2>");
                        BodyEmail.Append("<h1><a href = " + link + " > Aplicación Conjunto Residencial " + conjunto + "</a></h1><h2>Apartamento:&zwnj;&nbsp;" + codigo + "</h2><h2><a href = " + link + ">Link de Descarga: " + link + "</a></h2>");
                        BodyEmail.Append("<h4> " + mensaje1 + " </h4></br><h2>Cordialmente Administración.</h2></br>");
                        BodyEmail.Append("<h3><a href=" + link2 + ">>> Link Chat Soporte Tecnico</a><h3>");

                        mailMensaje.IsBodyHtml = true;

                        mailMensaje.Body = BodyEmail.ToString();
                        mailMensaje.Subject = "" + asunto + "";
                        using (SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587))
                        {
                            smtpClient.EnableSsl = true;
                            smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;
                            smtpClient.UseDefaultCredentials = false;
                            smtpClient.Credentials = new NetworkCredential("propiedadhorizontal@ingenieriavisualph.com", "mfdddzuwwvifnjhj");
                            smtpClient.Send(mailMensaje);
                        }
                    }
                    else if (mail != "" && validacion != "Si" && _Id < 60)
                    {
                        MailMessage mailMensaje = new MailMessage("propiedadhorizontal@ingenieriavisualph.com", mail);

                        StringBuilder BodyEmail = new StringBuilder();
                        string link2 = "https://api.whatsapp.com/send?phone=573002435992&fbclid=IwAR0B0J1W5ikmkzLArvAjBjw2kva7ZQnic9FtHSTutgSyRDRiuMIIUrhqVFo";
                        BodyEmail.Append("<h2>  <spam> </span><strong>!IMPORTANTE:</strong> Este correo es informativo y no se debe responder sobre él.</h2>");
                        BodyEmail.Append("<h1><a href = " + link + " > Aplicación Conjunto Residencial " + conjunto + "</a></h1><h2>Apartamento:&zwnj;&nbsp;" + codigo + "</h2><h2><a href = " + link + ">Link de Descarga: " + link + "</a></h2>");
                        BodyEmail.Append("<h4> " + mensaje1 + " </h4></br><h2>Cordialmente Administración.</h2></br>");
                        BodyEmail.Append("<h3><a href=" + link2 + ">>> Link Chat Soporte Tecnico</a><h3>");


                        mailMensaje.IsBodyHtml = true;

                        mailMensaje.Body = BodyEmail.ToString();
                        mailMensaje.Subject = "" + asunto + "";
                        using (SmtpClient smtpClient2 = new SmtpClient("smtp.gmail.com", 587))
                        {
                            smtpClient2.EnableSsl = true;
                            smtpClient2.DeliveryMethod = SmtpDeliveryMethod.Network;
                            smtpClient2.UseDefaultCredentials = false;
                            smtpClient2.Credentials = new NetworkCredential("propiedadhorizontal@ingenieriavisualph.com", "mfdddzuwwvifnjhj");
                            smtpClient2.Send(mailMensaje);
                        }
                    }
                    else if (mail != "" && validacion != "Si" && _Id < 90)
                    {
                        MailMessage mailMensaje = new MailMessage("propiedadhorizontal@ingenieriavisualph.com", mail);

                        StringBuilder BodyEmail = new StringBuilder();
                        string link2 = "https://api.whatsapp.com/send?phone=573002435992&fbclid=IwAR0B0J1W5ikmkzLArvAjBjw2kva7ZQnic9FtHSTutgSyRDRiuMIIUrhqVFo";
                        BodyEmail.Append("<h2>  <spam> </span><strong>!IMPORTANTE:</strong> Este correo es informativo y no se debe responder sobre él.</h2>");
                        BodyEmail.Append("<h1><a href = " + link + " > Aplicación Conjunto Residencial " + conjunto + "</a></h1><h2>Apartamento:&zwnj;&nbsp;" + codigo + "</h2><h2><a href = " + link + ">Link de Descarga: " + link + "</a></h2>");
                        BodyEmail.Append("<h4> " + mensaje1 + " </h4></br><h2>Cordialmente Administración.</h2></br>");
                        BodyEmail.Append("<h3><a href=" + link2 + ">>> Link Chat Soporte Tecnico</a><h3>");


                        mailMensaje.IsBodyHtml = true;

                        mailMensaje.Body = BodyEmail.ToString();
                        mailMensaje.Subject = "" + asunto + "";
                        using (SmtpClient smtpClient3 = new SmtpClient("smtp.gmail.com", 587))
                        {
                            smtpClient3.EnableSsl = true;
                            smtpClient3.DeliveryMethod = SmtpDeliveryMethod.Network;
                            smtpClient3.UseDefaultCredentials = false;
                            smtpClient3.Credentials = new NetworkCredential("propiedadhorizontal@ingenieriavisualph.com", "mfdddzuwwvifnjhj");
                            smtpClient3.Send(mailMensaje);
                        }
                    }
                    else if (mail != "" && validacion != "Si" && _Id < 120)
                    {
                        MailMessage mailMensaje = new MailMessage("propiedadhorizontal@ingenieriavisualph.com", mail);

                        StringBuilder BodyEmail = new StringBuilder();
                        string link2 = "https://api.whatsapp.com/send?phone=573002435992&fbclid=IwAR0B0J1W5ikmkzLArvAjBjw2kva7ZQnic9FtHSTutgSyRDRiuMIIUrhqVFo";
                        BodyEmail.Append("<h2>  <spam> </span><strong>!IMPORTANTE:</strong> Este correo es informativo y no se debe responder sobre él.</h2>");
                        BodyEmail.Append("<h1><a href = " + link + " > Aplicación Conjunto Residencial " + conjunto + "</a></h1><h2>Apartamento:&zwnj;&nbsp;" + codigo + "</h2><h2><a href = " + link + ">Link de Descarga: " + link + "</a></h2>");
                        BodyEmail.Append("<h4> " + mensaje1 + " </h4></br><h2>Cordialmente Administración.</h2></br>");
                        BodyEmail.Append("<h3><a href=" + link2 + ">>> Link Chat Soporte Tecnico</a><h3>");


                        mailMensaje.IsBodyHtml = true;

                        mailMensaje.Body = BodyEmail.ToString();
                        mailMensaje.Subject = "" + asunto + "";
                        using (SmtpClient smtpClient4 = new SmtpClient("smtp.gmail.com", 587))
                        {
                            smtpClient4.EnableSsl = true;
                            smtpClient4.DeliveryMethod = SmtpDeliveryMethod.Network;
                            smtpClient4.UseDefaultCredentials = false;
                            smtpClient4.Credentials = new NetworkCredential("propiedadhorizontal@ingenieriavisualph.com", "mfdddzuwwvifnjhj");
                            smtpClient4.Send(mailMensaje);
                        }
                    }
                    else if (mail != "" && validacion != "Si" && _Id < 150)
                    {
                        MailMessage mailMensaje = new MailMessage("propiedadhorizontal@ingenieriavisualph.com", mail);

                        StringBuilder BodyEmail = new StringBuilder();
                        string link2 = "https://api.whatsapp.com/send?phone=573002435992&fbclid=IwAR0B0J1W5ikmkzLArvAjBjw2kva7ZQnic9FtHSTutgSyRDRiuMIIUrhqVFo";
                        BodyEmail.Append("<h2>  <spam> </span><strong>!IMPORTANTE:</strong> Este correo es informativo y no se debe responder sobre él.</h2>");
                        BodyEmail.Append("<h1><a href = " + link + " > Aplicación Conjunto Residencial " + conjunto + "</a></h1><h2>Apartamento:&zwnj;&nbsp;" + codigo + "</h2><h2><a href = " + link + ">Link de Descarga: " + link + "</a></h2>");
                        BodyEmail.Append("<h4> " + mensaje1 + " </h4></br><h2>Cordialmente Administración.</h2></br>");
                        BodyEmail.Append("<h3><a href=" + link2 + ">>> Link Chat Soporte Tecnico</a><h3>");


                        mailMensaje.IsBodyHtml = true;

                        mailMensaje.Body = BodyEmail.ToString();
                        mailMensaje.Subject = "" + asunto + "";
                        using (SmtpClient smtpClient5 = new SmtpClient("smtp.gmail.com", 587))
                        {
                            smtpClient5.EnableSsl = true;
                            smtpClient5.DeliveryMethod = SmtpDeliveryMethod.Network;
                            smtpClient5.UseDefaultCredentials = false;
                            smtpClient5.Credentials = new NetworkCredential("propiedadhorizontal@ingenieriavisualph.com", "mfdddzuwwvifnjhj");
                            smtpClient5.Send(mailMensaje);
                        }
                    }
                    else if (mail != "" && validacion != "Si" && _Id < 180)
                    {
                        MailMessage mailMensaje = new MailMessage("propiedadhorizontal@ingenieriavisualph.com", mail);

                        StringBuilder BodyEmail = new StringBuilder();
                        string link2 = "https://api.whatsapp.com/send?phone=573002435992&fbclid=IwAR0B0J1W5ikmkzLArvAjBjw2kva7ZQnic9FtHSTutgSyRDRiuMIIUrhqVFo";
                        BodyEmail.Append("<h2>  <spam> </span><strong>!IMPORTANTE:</strong> Este correo es informativo y no se debe responder sobre él.</h2>");
                        BodyEmail.Append("<h1><a href = " + link + " > Aplicación Conjunto Residencial " + conjunto + "</a></h1><h2>Apartamento:&zwnj;&nbsp;" + codigo + "</h2><h2><a href = " + link + ">Link de Descarga: " + link + "</a></h2>");
                        BodyEmail.Append("<h4> " + mensaje1 + " </h4></br><h2>Cordialmente Administración.</h2></br>");
                        BodyEmail.Append("<h3><a href=" + link2 + ">>> Link Chat Soporte Tecnico</a><h3>");


                        mailMensaje.IsBodyHtml = true;

                        mailMensaje.Body = BodyEmail.ToString();
                        mailMensaje.Subject = "" + asunto + "";
                        using (SmtpClient smtpClient6 = new SmtpClient("smtp.gmail.com", 587))
                        {
                            smtpClient6.EnableSsl = true;
                            smtpClient6.DeliveryMethod = SmtpDeliveryMethod.Network;
                            smtpClient6.UseDefaultCredentials = false;
                            smtpClient6.Credentials = new NetworkCredential("propiedadhorizontal@ingenieriavisualph.com", "mfdddzuwwvifnjhj");
                            smtpClient6.Send(mailMensaje);
                        }
                    }
                    else if (mail != "" && validacion != "Si" && _Id < 210)
                    {
                        MailMessage mailMensaje = new MailMessage("propiedadhorizontal@ingenieriavisualph.com", mail);

                        StringBuilder BodyEmail = new StringBuilder();
                        string link2 = "https://api.whatsapp.com/send?phone=573002435992&fbclid=IwAR0B0J1W5ikmkzLArvAjBjw2kva7ZQnic9FtHSTutgSyRDRiuMIIUrhqVFo";
                        BodyEmail.Append("<h2>  <spam> </span><strong>!IMPORTANTE:</strong> Este correo es informativo y no se debe responder sobre él.</h2>");
                        BodyEmail.Append("<h1><a href = " + link + " > Aplicación Conjunto Residencial " + conjunto + "</a></h1><h2>Apartamento:&zwnj;&nbsp;" + codigo + "</h2><h2><a href = " + link + ">Link de Descarga: " + link + "</a></h2>");
                        BodyEmail.Append("<h4> " + mensaje1 + " </h4></br><h2>Cordialmente Administración.</h2></br>");
                        BodyEmail.Append("<h3><a href=" + link2 + ">>> Link Chat Soporte Tecnico</a><h3>");


                        mailMensaje.IsBodyHtml = true;

                        mailMensaje.Body = BodyEmail.ToString();
                        mailMensaje.Subject = "" + asunto + "";
                        using (SmtpClient smtpClient7 = new SmtpClient("smtp.gmail.com", 587))
                        {
                            smtpClient7.EnableSsl = true;
                            smtpClient7.DeliveryMethod = SmtpDeliveryMethod.Network;
                            smtpClient7.UseDefaultCredentials = false;
                            smtpClient7.Credentials = new NetworkCredential("propiedadhorizontal@ingenieriavisualph.com", "mfdddzuwwvifnjhj");
                            smtpClient7.Send(mailMensaje);
                        }
                    }
                    else if (mail != "" && validacion != "Si" && _Id < 240)
                    {
                        MailMessage mailMensaje = new MailMessage("propiedadhorizontal@ingenieriavisualph.com", mail);

                        StringBuilder BodyEmail = new StringBuilder();
                        string link2 = "https://api.whatsapp.com/send?phone=573002435992&fbclid=IwAR0B0J1W5ikmkzLArvAjBjw2kva7ZQnic9FtHSTutgSyRDRiuMIIUrhqVFo";
                        BodyEmail.Append("<h2>  <spam> </span><strong>!IMPORTANTE:</strong> Este correo es informativo y no se debe responder sobre él.</h2>");
                        BodyEmail.Append("<h1><a href = " + link + " > Aplicación Conjunto Residencial " + conjunto + "</a></h1><h2>Apartamento:&zwnj;&nbsp;" + codigo + "</h2><h2><a href = " + link + ">Link de Descarga: " + link + "</a></h2>");
                        BodyEmail.Append("<h4> " + mensaje1 + " </h4></br><h2>Cordialmente Administración.</h2></br>");
                        BodyEmail.Append("<h3><a href=" + link2 + ">>> Link Chat Soporte Tecnico</a><h3>");


                        mailMensaje.IsBodyHtml = true;

                        mailMensaje.Body = BodyEmail.ToString();
                        mailMensaje.Subject = "" + asunto + "";
                        using (SmtpClient smtpClient8 = new SmtpClient("smtp.gmail.com", 587))
                        {
                            smtpClient8.EnableSsl = true;
                            smtpClient8.DeliveryMethod = SmtpDeliveryMethod.Network;
                            smtpClient8.UseDefaultCredentials = false;
                            smtpClient8.Credentials = new NetworkCredential("propiedadhorizontal@ingenieriavisualph.com", "mfdddzuwwvifnjhj");
                            smtpClient8.Send(mailMensaje);
                        }
                    }
                    else if (mail != "" && validacion != "Si" && _Id < 270)
                    {
                        MailMessage mailMensaje = new MailMessage("propiedadhorizontal@ingenieriavisualph.com", mail);

                        StringBuilder BodyEmail = new StringBuilder();
                        string link2 = "https://api.whatsapp.com/send?phone=573002435992&fbclid=IwAR0B0J1W5ikmkzLArvAjBjw2kva7ZQnic9FtHSTutgSyRDRiuMIIUrhqVFo";
                        BodyEmail.Append("<h2>  <spam> </span><strong>!IMPORTANTE:</strong> Este correo es informativo y no se debe responder sobre él.</h2>");
                        BodyEmail.Append("<h1><a href = " + link + " > Aplicación Conjunto Residencial " + conjunto + "</a></h1><h2>Apartamento:&zwnj;&nbsp;" + codigo + "</h2><h2><a href = " + link + ">Link de Descarga: " + link + "</a></h2>");
                        BodyEmail.Append("<h4> " + mensaje1 + " </h4></br><h2>Cordialmente Administración.</h2></br>");
                        BodyEmail.Append("<h3><a href=" + link2 + ">>> Link Chat Soporte Tecnico</a><h3>");


                        mailMensaje.IsBodyHtml = true;

                        mailMensaje.Body = BodyEmail.ToString();
                        mailMensaje.Subject = "" + asunto + "";
                        using (SmtpClient smtpClient9 = new SmtpClient("smtp.gmail.com", 587))
                        {
                            smtpClient9.EnableSsl = true;
                            smtpClient9.DeliveryMethod = SmtpDeliveryMethod.Network;
                            smtpClient9.UseDefaultCredentials = false;
                            smtpClient9.Credentials = new NetworkCredential("propiedadhorizontal@ingenieriavisualph.com", "mfdddzuwwvifnjhj");
                            smtpClient9.Send(mailMensaje);
                        }
                    }
                    else if (mail != "" && validacion != "Si" && _Id < 300)
                    {
                        MailMessage mailMensaje = new MailMessage("propiedadhorizontal@ingenieriavisualph.com", mail);

                        StringBuilder BodyEmail = new StringBuilder();
                        string link2 = "https://api.whatsapp.com/send?phone=573002435992&fbclid=IwAR0B0J1W5ikmkzLArvAjBjw2kva7ZQnic9FtHSTutgSyRDRiuMIIUrhqVFo";
                        BodyEmail.Append("<h2>  <spam> </span><strong>!IMPORTANTE:</strong> Este correo es informativo y no se debe responder sobre él.</h2>");
                        BodyEmail.Append("<h1><a href = " + link + " > Aplicación Conjunto Residencial " + conjunto + "</a></h1><h2>Apartamento:&zwnj;&nbsp;" + codigo + "</h2><h2><a href = " + link + ">Link de Descarga: " + link + "</a></h2>");
                        BodyEmail.Append("<h4> " + mensaje1 + " </h4></br><h2>Cordialmente Administración.</h2></br>");
                        BodyEmail.Append("<h3><a href=" + link2 + ">>> Link Chat Soporte Tecnico</a><h3>");


                        mailMensaje.IsBodyHtml = true;

                        mailMensaje.Body = BodyEmail.ToString();
                        mailMensaje.Subject = "" + asunto + "";
                        using (SmtpClient smtpClient10 = new SmtpClient("smtp.gmail.com", 587))
                        {
                            smtpClient10.EnableSsl = true;
                            smtpClient10.DeliveryMethod = SmtpDeliveryMethod.Network;
                            smtpClient10.UseDefaultCredentials = false;
                            smtpClient10.Credentials = new NetworkCredential("propiedadhorizontal@ingenieriavisualph.com", "mfdddzuwwvifnjhj");
                            smtpClient10.Send(mailMensaje);
                        }
                    }
                    else if (mail != "" && validacion != "Si" && _Id < 330)
                    {
                        MailMessage mailMensaje = new MailMessage("propiedadhorizontal@ingenieriavisualph.com", mail);

                        StringBuilder BodyEmail = new StringBuilder();
                        string link2 = "https://api.whatsapp.com/send?phone=573002435992&fbclid=IwAR0B0J1W5ikmkzLArvAjBjw2kva7ZQnic9FtHSTutgSyRDRiuMIIUrhqVFo";
                        BodyEmail.Append("<h2>  <spam> </span><strong>!IMPORTANTE:</strong> Este correo es informativo y no se debe responder sobre él.</h2>");
                        BodyEmail.Append("<h1><a href = " + link + " > Aplicación Conjunto Residencial " + conjunto + "</a></h1><h2>Apartamento:&zwnj;&nbsp;" + codigo + "</h2><h2><a href = " + link + ">Link de Descarga: " + link + "</a></h2>");
                        BodyEmail.Append("<h4> " + mensaje1 + " </h4></br><h2>Cordialmente Administración.</h2></br>");
                        BodyEmail.Append("<h3><a href=" + link2 + ">>> Link Chat Soporte Tecnico</a><h3>");


                        mailMensaje.IsBodyHtml = true;

                        mailMensaje.Body = BodyEmail.ToString();
                        mailMensaje.Subject = "" + asunto + "";
                        using (SmtpClient smtpClient11 = new SmtpClient("smtp.gmail.com", 587))
                        {
                            smtpClient11.EnableSsl = true;
                            smtpClient11.DeliveryMethod = SmtpDeliveryMethod.Network;
                            smtpClient11.UseDefaultCredentials = false;
                            smtpClient11.Credentials = new NetworkCredential("propiedadhorizontal@ingenieriavisualph.com", "mfdddzuwwvifnjhj");
                            smtpClient11.Send(mailMensaje);
                        }
                    }
                    else if (mail != "" && validacion != "Si" && _Id < 360)
                    {
                        MailMessage mailMensaje = new MailMessage("propiedadhorizontal@ingenieriavisualph.com", mail);

                        StringBuilder BodyEmail = new StringBuilder();
                        string link2 = "https://api.whatsapp.com/send?phone=573002435992&fbclid=IwAR0B0J1W5ikmkzLArvAjBjw2kva7ZQnic9FtHSTutgSyRDRiuMIIUrhqVFo";
                        BodyEmail.Append("<h2>  <spam> </span><strong>!IMPORTANTE:</strong> Este correo es informativo y no se debe responder sobre él.</h2>");
                        BodyEmail.Append("<h1><a href = " + link + " > Aplicación Conjunto Residencial " + conjunto + "</a></h1><h2>Apartamento:&zwnj;&nbsp;" + codigo + "</h2><h2><a href = " + link + ">Link de Descarga: " + link + "</a></h2>");
                        BodyEmail.Append("<h4> " + mensaje1 + " </h4></br><h2>Cordialmente Administración.</h2></br>");
                        BodyEmail.Append("<h3><a href=" + link2 + ">>> Link Chat Soporte Tecnico</a><h3>");


                        mailMensaje.IsBodyHtml = true;

                        mailMensaje.Body = BodyEmail.ToString();
                        mailMensaje.Subject = "" + asunto + "";
                        using (SmtpClient smtpClient12 = new SmtpClient("smtp.gmail.com", 587))
                        {
                            smtpClient12.EnableSsl = true;
                            smtpClient12.DeliveryMethod = SmtpDeliveryMethod.Network;
                            smtpClient12.UseDefaultCredentials = false;
                            smtpClient12.Credentials = new NetworkCredential("propiedadhorizontal@ingenieriavisualph.com", "mfdddzuwwvifnjhj");
                            smtpClient12.Send(mailMensaje);
                        }
                    }
                    else if (mail != "" && validacion != "Si" && _Id < 390)
                    {
                        MailMessage mailMensaje = new MailMessage("propiedadhorizontal@ingenieriavisualph.com", mail);

                        StringBuilder BodyEmail = new StringBuilder();
                        string link2 = "https://api.whatsapp.com/send?phone=573002435992&fbclid=IwAR0B0J1W5ikmkzLArvAjBjw2kva7ZQnic9FtHSTutgSyRDRiuMIIUrhqVFo";
                        BodyEmail.Append("<h2>  <spam> </span><strong>!IMPORTANTE:</strong> Este correo es informativo y no se debe responder sobre él.</h2>");
                        BodyEmail.Append("<h1><a href = " + link + " > Aplicación Conjunto Residencial " + conjunto + "</a></h1><h2>Apartamento:&zwnj;&nbsp;" + codigo + "</h2><h2><a href = " + link + ">Link de Descarga: " + link + "</a></h2>");
                        BodyEmail.Append("<h4> " + mensaje1 + " </h4></br><h2>Cordialmente Administración.</h2></br>");
                        BodyEmail.Append("<h3><a href=" + link2 + ">>> Link Chat Soporte Tecnico</a><h3>");


                        mailMensaje.IsBodyHtml = true;

                        mailMensaje.Body = BodyEmail.ToString();
                        mailMensaje.Subject = "" + asunto + "";
                        using (SmtpClient smtpClient13 = new SmtpClient("smtp.gmail.com", 587))
                        {
                            smtpClient13.EnableSsl = true;
                            smtpClient13.DeliveryMethod = SmtpDeliveryMethod.Network;
                            smtpClient13.UseDefaultCredentials = false;
                            smtpClient13.Credentials = new NetworkCredential("propiedadhorizontal@ingenieriavisualph.com", "mfdddzuwwvifnjhj");
                            smtpClient13.Send(mailMensaje);
                        }
                    }
                    else if (mail != "" && validacion != "Si" && _Id < 420)
                    {
                        MailMessage mailMensaje = new MailMessage("propiedadhorizontal@ingenieriavisualph.com", mail);

                        StringBuilder BodyEmail = new StringBuilder();
                        string link2 = "https://api.whatsapp.com/send?phone=573002435992&fbclid=IwAR0B0J1W5ikmkzLArvAjBjw2kva7ZQnic9FtHSTutgSyRDRiuMIIUrhqVFo";
                        BodyEmail.Append("<h2>  <spam> </span><strong>!IMPORTANTE:</strong> Este correo es informativo y no se debe responder sobre él.</h2>");
                        BodyEmail.Append("<h1><a href = " + link + " > Aplicación Conjunto Residencial " + conjunto + "</a></h1><h2>Apartamento:&zwnj;&nbsp;" + codigo + "</h2><h2><a href = " + link + ">Link de Descarga: " + link + "</a></h2>");
                        BodyEmail.Append("<h4> " + mensaje1 + " </h4></br><h2>Cordialmente Administración.</h2></br>");
                        BodyEmail.Append("<h3><a href=" + link2 + ">>> Link Chat Soporte Tecnico</a><h3>");


                        mailMensaje.IsBodyHtml = true;

                        mailMensaje.Body = BodyEmail.ToString();
                        mailMensaje.Subject = "" + asunto + "";
                        using (SmtpClient smtpClient14 = new SmtpClient("smtp.gmail.com", 587))
                        {
                            smtpClient14.EnableSsl = true;
                            smtpClient14.DeliveryMethod = SmtpDeliveryMethod.Network;
                            smtpClient14.UseDefaultCredentials = false;
                            smtpClient14.Credentials = new NetworkCredential("propiedadhorizontal@ingenieriavisualph.com", "mfdddzuwwvifnjhj");
                            smtpClient14.Send(mailMensaje);
                        }
                    }
                    else if (mail != "" && validacion != "Si" && _Id < 450)
                    {
                        MailMessage mailMensaje = new MailMessage("propiedadhorizontal@ingenieriavisualph.com", mail);

                        StringBuilder BodyEmail = new StringBuilder();
                        string link2 = "https://api.whatsapp.com/send?phone=573002435992&fbclid=IwAR0B0J1W5ikmkzLArvAjBjw2kva7ZQnic9FtHSTutgSyRDRiuMIIUrhqVFo";
                        BodyEmail.Append("<h2>  <spam> </span><strong>!IMPORTANTE:</strong> Este correo es informativo y no se debe responder sobre él.</h2>");
                        BodyEmail.Append("<h1><a href = " + link + " > Aplicación Conjunto Residencial " + conjunto + "</a></h1><h2>Apartamento:&zwnj;&nbsp;" + codigo + "</h2><h2><a href = " + link + ">Link de Descarga: " + link + "</a></h2>");
                        BodyEmail.Append("<h4> " + mensaje1 + " </h4></br><h2>Cordialmente Administración.</h2></br>");
                        BodyEmail.Append("<h3><a href=" + link2 + ">>> Link Chat Soporte Tecnico</a><h3>");


                        mailMensaje.IsBodyHtml = true;

                        mailMensaje.Body = BodyEmail.ToString();
                        mailMensaje.Subject = "" + asunto + "";
                        using (SmtpClient smtpClient15 = new SmtpClient("smtp.gmail.com", 587))
                        {
                            smtpClient15.EnableSsl = true;
                            smtpClient15.DeliveryMethod = SmtpDeliveryMethod.Network;
                            smtpClient15.UseDefaultCredentials = false;
                            smtpClient15.Credentials = new NetworkCredential("propiedadhorizontal@ingenieriavisualph.com", "mfdddzuwwvifnjhj");
                            smtpClient15.Send(mailMensaje);
                        }
                    }
                    else if (mail != "" && validacion != "Si" && _Id < 480)
                    {
                        MailMessage mailMensaje = new MailMessage("propiedadhorizontal@ingenieriavisualph.com", mail);

                        StringBuilder BodyEmail = new StringBuilder();
                        string link2 = "https://api.whatsapp.com/send?phone=573002435992&fbclid=IwAR0B0J1W5ikmkzLArvAjBjw2kva7ZQnic9FtHSTutgSyRDRiuMIIUrhqVFo";
                        BodyEmail.Append("<h2>  <spam> </span><strong>!IMPORTANTE:</strong> Este correo es informativo y no se debe responder sobre él.</h2>");
                        BodyEmail.Append("<h1><a href = " + link + " > Aplicación Conjunto Residencial " + conjunto + "</a></h1><h2>Apartamento:&zwnj;&nbsp;" + codigo + "</h2><h2><a href = " + link + ">Link de Descarga: " + link + "</a></h2>");
                        BodyEmail.Append("<h4> " + mensaje1 + " </h4></br><h2>Cordialmente Administración.</h2></br>");
                        BodyEmail.Append("<h3><a href=" + link2 + ">>> Link Chat Soporte Tecnico</a><h3>");


                        mailMensaje.IsBodyHtml = true;

                        mailMensaje.Body = BodyEmail.ToString();
                        mailMensaje.Subject = "" + asunto + "";
                        using (SmtpClient smtpClient16 = new SmtpClient("smtp.gmail.com", 587))
                        {
                            smtpClient16.EnableSsl = true;
                            smtpClient16.DeliveryMethod = SmtpDeliveryMethod.Network;
                            smtpClient16.UseDefaultCredentials = false;
                            smtpClient16.Credentials = new NetworkCredential("propiedadhorizontal@ingenieriavisualph.com", "mfdddzuwwvifnjhj");
                            smtpClient16.Send(mailMensaje);
                        }
                    }
                    else if (mail != "" && validacion != "Si" && _Id < 510)
                    {
                        MailMessage mailMensaje = new MailMessage("propiedadhorizontal@ingenieriavisualph.com", mail);

                        StringBuilder BodyEmail = new StringBuilder();
                        string link2 = "https://api.whatsapp.com/send?phone=573002435992&fbclid=IwAR0B0J1W5ikmkzLArvAjBjw2kva7ZQnic9FtHSTutgSyRDRiuMIIUrhqVFo";
                        BodyEmail.Append("<h2>  <spam> </span><strong>!IMPORTANTE:</strong> Este correo es informativo y no se debe responder sobre él.</h2>");
                        BodyEmail.Append("<h1><a href = " + link + " > Aplicación Conjunto Residencial " + conjunto + "</a></h1><h2>Apartamento:&zwnj;&nbsp;" + codigo + "</h2><h2><a href = " + link + ">Link de Descarga: " + link + "</a></h2>");
                        BodyEmail.Append("<h4> " + mensaje1 + " </h4></br><h2>Cordialmente Administración.</h2></br>");
                        BodyEmail.Append("<h3><a href=" + link2 + ">>> Link Chat Soporte Tecnico</a><h3>");


                        mailMensaje.IsBodyHtml = true;

                        mailMensaje.Body = BodyEmail.ToString();
                        mailMensaje.Subject = "" + asunto + "";
                        using (SmtpClient smtpClient17 = new SmtpClient("smtp.gmail.com", 587))
                        {
                            smtpClient17.EnableSsl = true;
                            smtpClient17.DeliveryMethod = SmtpDeliveryMethod.Network;
                            smtpClient17.UseDefaultCredentials = false;
                            smtpClient17.Credentials = new NetworkCredential("propiedadhorizontal@ingenieriavisualph.com", "mfdddzuwwvifnjhj");
                            smtpClient17.Send(mailMensaje);
                        }
                    }
                    else if (mail != "" && validacion != "Si" && _Id < 540)
                    {
                        MailMessage mailMensaje = new MailMessage("propiedadhorizontal@ingenieriavisualph.com", mail);

                        StringBuilder BodyEmail = new StringBuilder();
                        string link2 = "https://api.whatsapp.com/send?phone=573002435992&fbclid=IwAR0B0J1W5ikmkzLArvAjBjw2kva7ZQnic9FtHSTutgSyRDRiuMIIUrhqVFo";
                        BodyEmail.Append("<h2>  <spam> </span><strong>!IMPORTANTE:</strong> Este correo es informativo y no se debe responder sobre él.</h2>");
                        BodyEmail.Append("<h1><a href = " + link + " > Aplicación Conjunto Residencial " + conjunto + "</a></h1><h2>Apartamento:&zwnj;&nbsp;" + codigo + "</h2><h2><a href = " + link + ">Link de Descarga: " + link + "</a></h2>");
                        BodyEmail.Append("<h4> " + mensaje1 + " </h4></br><h2>Cordialmente Administración.</h2></br>");
                        BodyEmail.Append("<h3><a href=" + link2 + ">>> Link Chat Soporte Tecnico</a><h3>");


                        mailMensaje.IsBodyHtml = true;

                        mailMensaje.Body = BodyEmail.ToString();
                        mailMensaje.Subject = "" + asunto + "";
                        using (SmtpClient smtpClient18 = new SmtpClient("smtp.gmail.com", 587))
                        {
                            smtpClient18.EnableSsl = true;
                            smtpClient18.DeliveryMethod = SmtpDeliveryMethod.Network;
                            smtpClient18.UseDefaultCredentials = false;
                            smtpClient18.Credentials = new NetworkCredential("propiedadhorizontal@ingenieriavisualph.com", "mfdddzuwwvifnjhj");
                            smtpClient18.Send(mailMensaje);
                        }
                    }
                    else if (mail != "" && validacion != "Si" && _Id < 570)
                    {
                        MailMessage mailMensaje = new MailMessage("propiedadhorizontal@ingenieriavisualph.com", mail);

                        StringBuilder BodyEmail = new StringBuilder();
                        string link2 = "https://api.whatsapp.com/send?phone=573002435992&fbclid=IwAR0B0J1W5ikmkzLArvAjBjw2kva7ZQnic9FtHSTutgSyRDRiuMIIUrhqVFo";
                        BodyEmail.Append("<h2>  <spam> </span><strong>!IMPORTANTE:</strong> Este correo es informativo y no se debe responder sobre él.</h2>");
                        BodyEmail.Append("<h1><a href = " + link + " > Aplicación Conjunto Residencial " + conjunto + "</a></h1><h2>Apartamento:&zwnj;&nbsp;" + codigo + "</h2><h2><a href = " + link + ">Link de Descarga: " + link + "</a></h2>");
                        BodyEmail.Append("<h4> " + mensaje1 + " </h4></br><h2>Cordialmente Administración.</h2></br>");
                        BodyEmail.Append("<h3><a href=" + link2 + ">>> Link Chat Soporte Tecnico</a><h3>");


                        mailMensaje.IsBodyHtml = true;

                        mailMensaje.Body = BodyEmail.ToString();
                        mailMensaje.Subject = "" + asunto + "";
                        using (SmtpClient smtpClient19 = new SmtpClient("smtp.gmail.com", 587))
                        {
                            smtpClient19.EnableSsl = true;
                            smtpClient19.DeliveryMethod = SmtpDeliveryMethod.Network;
                            smtpClient19.UseDefaultCredentials = false;
                            smtpClient19.Credentials = new NetworkCredential("propiedadhorizontal@ingenieriavisualph.com", "mfdddzuwwvifnjhj");
                            smtpClient19.Send(mailMensaje);
                        }
                    }
                    else if (mail != "" && validacion != "Si" && _Id < 600)
                    {
                        MailMessage mailMensaje = new MailMessage("propiedadhorizontal@ingenieriavisualph.com", mail);

                        StringBuilder BodyEmail = new StringBuilder();
                        string link2 = "https://api.whatsapp.com/send?phone=573002435992&fbclid=IwAR0B0J1W5ikmkzLArvAjBjw2kva7ZQnic9FtHSTutgSyRDRiuMIIUrhqVFo";
                        BodyEmail.Append("<h2>  <spam> </span><strong>!IMPORTANTE:</strong> Este correo es informativo y no se debe responder sobre él.</h2>");
                        BodyEmail.Append("<h1><a href = " + link + " > Aplicación Conjunto Residencial " + conjunto + "</a></h1><h2>Apartamento:&zwnj;&nbsp;" + codigo + "</h2><h2><a href = " + link + ">Link de Descarga: " + link + "</a></h2>");
                        BodyEmail.Append("<h4> " + mensaje1 + " </h4></br><h2>Cordialmente Administración.</h2></br>");
                        BodyEmail.Append("<h3><a href=" + link2 + ">>> Link Chat Soporte Tecnico</a><h3>");


                        mailMensaje.IsBodyHtml = true;

                        mailMensaje.Body = BodyEmail.ToString();
                        mailMensaje.Subject = "" + asunto + "";
                        using (SmtpClient smtpClient20 = new SmtpClient("smtp.gmail.com", 587))
                        {
                            smtpClient20.EnableSsl = true;
                            smtpClient20.DeliveryMethod = SmtpDeliveryMethod.Network;
                            smtpClient20.UseDefaultCredentials = false;
                            smtpClient20.Credentials = new NetworkCredential("propiedadhorizontal@ingenieriavisualph.com", "mfdddzuwwvifnjhj");
                            smtpClient20.Send(mailMensaje);
                        }
                    }
                }
                Response.Redirect("emailsmasivos.aspx");
            }
            catch (Exception)
            {
                
            }
        }
    }
}

