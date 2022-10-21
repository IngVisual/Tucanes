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
                smtpClient.Credentials = new NetworkCredential("propiedadhorizontal@ingenieriavisualph.com", "mfdddzuwwvifnjhj");
                smtpClient.Send(mailMensaje);
            }
        }

        public Email(string ToEmail, string Codigo, string mensaje, string asunto, string conjunto, string autorizado, string cedula)
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
                smtpClient.Credentials = new NetworkCredential("propiedadhorizontal@ingenieriavisualph.com", "mfdddzuwwvifnjhj");
                smtpClient.Send(mailMensaje);
            }
        }

        public Email(string ToEmail, string Codigo, string mensaje, string asunto, string conjunto, string autorizado, string cedula, string tipo)
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
                smtpClient.Credentials = new NetworkCredential("propiedadhorizontal@ingenieriavisualph.com", "mfdddzuwwvifnjhj");
                smtpClient.Send(mailMensaje);
            }
        }

        //Email con un solo parrafo
        public Email(string ToEmail, string Codigo, string mensaje, string asunto, string conjunto, string adjunto)
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
                smtpClient.Credentials = new NetworkCredential("propiedadhorizontal@ingenieriavisualph.com", "mfdddzuwwvifnjhj");
                smtpClient.Send(mailMensaje);
            }
        }
    }
}
