using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Threading.Tasks;

namespace Servicios
{
    public class Email
    {
        //Email con un solo parrafo
        public Email(string ToEmail, string Codigo, string mensaje, string asunto, string conjunto)
        {
            try
            {
                MailMessage mailMensaje = new MailMessage("propiedadhorizontal@ingenieriavisualph.com", ToEmail);

                StringBuilder BodyEmail = new StringBuilder();
                BodyEmail.Append("<h3>  <spam> </span><strong>!IMPORTANTE:</strong> Este correo es informativo y no se debe responder sobre él. Si tiene alguna duda le aconsejamos hacer una nueva solicitud en la aplicación de su conjunto o de manera presencial.</h3>");
                BodyEmail.Append("<br/><br/>");
                BodyEmail.Append("Estimado Residente" + Codigo + ",<br/></br>");
                BodyEmail.Append("" + mensaje + "");
                BodyEmail.Append("<br/>");
                BodyEmail.Append("<br/><br/>");
                BodyEmail.Append("CONJUNTO RESIDENCIAL" + "<br/>" + conjunto + "<br/>");
                BodyEmail.Append("<br/><br/>");

                mailMensaje.IsBodyHtml = true;

                mailMensaje.Body = BodyEmail.ToString();
                mailMensaje.Subject = "" + asunto + "";
                using (SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587))
                {
                    smtpClient.EnableSsl = true;
                    smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;
                    smtpClient.UseDefaultCredentials = false;
                    smtpClient.Credentials = new NetworkCredential("propiedadhorizontal@ingenieriavisualph.com", "rxwfescezuhkmifn");
                    smtpClient.Send(mailMensaje);
                }
            }
            catch (Exception)
            {

            }
        }

        public Email(string ToEmail, string Codigo, string mensaje, string asunto, string conjunto, string autorizado, string cedula)
        {
            try
            {
                MailMessage mailMensaje = new MailMessage("propiedadhorizontal@ingenieriavisualph.com", ToEmail);

                StringBuilder BodyEmail = new StringBuilder();
                BodyEmail.Append("<h3>  <spam> </span><strong>!IMPORTANTE:</strong> Este correo es informativo y no se debe responder sobre él. Si tiene alguna duda le aconsejamos hacer una nueva solicitud en la aplicación de su conjunto o de manera presencial.</h3>");
                BodyEmail.Append("<br/><br/>");
                BodyEmail.Append("Yo " + autorizado + " con cedula de ciudadania: " + cedula + " propietario del predio: " + Codigo + " ACEPTO la:,<br/></br>");
                BodyEmail.Append("" + mensaje + "");
                BodyEmail.Append("<br/>");
                BodyEmail.Append("<br/><br/>");
                BodyEmail.Append("CONJUNTO RESIDENCIAL" + "<br/>" + conjunto + "<br/>");
                BodyEmail.Append("<br/><br/>");

                mailMensaje.IsBodyHtml = true;

                mailMensaje.Body = BodyEmail.ToString();
                mailMensaje.Subject = "" + asunto + "";
                using (SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587))
                {
                    smtpClient.EnableSsl = true;
                    smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;
                    smtpClient.UseDefaultCredentials = false;
                    smtpClient.Credentials = new NetworkCredential("propiedadhorizontal@ingenieriavisualph.com", "rxwfescezuhkmifn");
                    smtpClient.Send(mailMensaje);
                }
            }
            catch (Exception)
            {

            }
        }

        public Email(string ToEmail, string Codigo, string mensaje, string asunto, string conjunto, string autorizado, string cedula, string tipo)
        {
            try
            {
                MailMessage mailMensaje = new MailMessage("propiedadhorizontal@ingenieriavisualph.com", ToEmail);

                StringBuilder BodyEmail = new StringBuilder();
                BodyEmail.Append("<h3>  <spam> </span><strong>!IMPORTANTE:</strong> Este correo es informativo y no se debe responder sobre él. Si tiene alguna duda le aconsejamos hacer una nueva solicitud en la aplicación de su conjunto o de manera presencial.</h3>");
                BodyEmail.Append("<br/><br/>");
                BodyEmail.Append("Yo " + autorizado + " con cedula de ciudadania: " + cedula + " en mi calidad de: " + tipo + " del predio: " + Codigo + " ACEPTO la:,<br/></br>");
                BodyEmail.Append("" + mensaje + "");
                BodyEmail.Append("<br/>");
                BodyEmail.Append("<br/><br/>");
                BodyEmail.Append("CONJUNTO RESIDENCIAL" + "<br/>" + conjunto + "<br/>");
                BodyEmail.Append("<br/><br/>");

                mailMensaje.IsBodyHtml = true;

                mailMensaje.Body = BodyEmail.ToString();
                mailMensaje.Subject = "" + asunto + "";
                using (SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587))
                {
                    smtpClient.EnableSsl = true;
                    smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;
                    smtpClient.UseDefaultCredentials = false;
                    smtpClient.Credentials = new NetworkCredential("propiedadhorizontal@ingenieriavisualph.com", "rxwfescezuhkmifn");
                    smtpClient.Send(mailMensaje);
                }
            }
            catch (Exception)
            {

            }
        }

        //Email con un solo parrafo
        public Email(string ToEmail, string Codigo, string mensaje, string asunto, string conjunto, string adjunto)
        {
            try
            {
                MailMessage mailMensaje = new MailMessage("propiedadhorizontal@ingenieriavisualph.com", ToEmail);

                StringBuilder BodyEmail = new StringBuilder();
                BodyEmail.Append("<h3>  <spam> </span><strong>!IMPORTANTE:</strong> Este correo es informativo y no se debe responder sobre él. Si tiene alguna duda le aconsejamos hacer una nueva solicitud en la aplicación de su conjunto o de manera presencial.</h3>");
                BodyEmail.Append("<br/><br/>");
                BodyEmail.Append("Estimado Residente" + Codigo + ",<br/></br>");
                BodyEmail.Append("" + mensaje + "");
                BodyEmail.Append("<br/>");
                BodyEmail.Append("<br/><br/>");
                BodyEmail.Append("CONJUNTO RESIDENCIAL" + "<br/>" + conjunto + "<br/>");
                BodyEmail.Append("<br/><br/>");

                mailMensaje.IsBodyHtml = true;
                mailMensaje.Body = BodyEmail.ToString();
                mailMensaje.Subject = "" + asunto + "";
                if (adjunto != "")
                {
                    mailMensaje.Attachments.Add(new Attachment(adjunto));
                }
                using (SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587))
                {
                    smtpClient.EnableSsl = true;
                    smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;
                    smtpClient.UseDefaultCredentials = false;
                    smtpClient.Credentials = new NetworkCredential("propiedadhorizontal@ingenieriavisualph.com", "rxwfescezuhkmifn");
                    smtpClient.Send(mailMensaje);
                }
            }
            catch (Exception)
            {

            }
        }
        public Email(string codigo, string asunto, string total, string fechaini, string fechafin, string observ, string horas, string email, string estado, string tipoAlq)
        {
            try
            {
                MailMessage mailMensaje = new MailMessage("propiedadhorizontal@ingenieriavisualph.com", email);

                StringBuilder BodyEmail = new StringBuilder();
                BodyEmail.Append("<h3>  <spam> </span><strong>!IMPORTANTE:</strong> Este correo es informativo y no se debe responder sobre él. Si tiene alguna duda le aconsejamos hacer una nueva solicitud en la aplicación de su conjunto o de manera presencial.</h3>");
                BodyEmail.Append("<br/>");
                BodyEmail.Append("<h3>Estimado Residente del " + codigo + " ;</h3><br/>");
                BodyEmail.Append("Mensaje informativo: El pago del alquiler de parqueadero visitante se encuentra en estado " + estado + " por un total de $" + total + ", " + horas + " horas desde la fecha: " + fechaini + " hasta la fecha: " + fechafin + "");
                BodyEmail.Append("<br/><br/>");
                BodyEmail.Append("Estado PAGO_FACTURADO: Su visita pago el alquiler sin novedad.");
                BodyEmail.Append("<br/>");
                BodyEmail.Append("Estado PAGO_NOVEDAD: Su visita pago el alquiler pero con novedad u observacion del guarda.");
                BodyEmail.Append("<br/>");
                BodyEmail.Append("Estado ALQUILER_CANCELADO: El pago termino con novedad porque no fue facturado, esta novedad es porque no fue necesario el pago o por alguna novedad de su visita.");
                BodyEmail.Append("<br/><br/>");
                BodyEmail.Append("Observacion del Guarda: " + observ + "");
                BodyEmail.Append("<br/><br/>");
                BodyEmail.Append("Tipo de alquiler CONJUNTO RESIDENCIAL: " + tipoAlq + "");
                BodyEmail.Append("<br/><br/>");

                mailMensaje.IsBodyHtml = true;

                mailMensaje.Body = BodyEmail.ToString();
                mailMensaje.Subject = "" + asunto + "";
                using (SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587))
                {
                    smtpClient.EnableSsl = true;
                    smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;
                    smtpClient.UseDefaultCredentials = false;
                    smtpClient.Credentials = new NetworkCredential("propiedadhorizontal@ingenieriavisualph.com", "rxwfescezuhkmifn");
                    smtpClient.Send(mailMensaje);
                }
            }
            catch (Exception)
            {

            }
        }
    }
}
