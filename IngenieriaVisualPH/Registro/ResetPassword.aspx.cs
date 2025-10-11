using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Text;
using System.Data.SqlClient;

namespace IngenieriaVisualPH.Registro
{
    public partial class ResetPassword : System.Web.UI.Page
    {
        Datos.Conexion acceso = new Datos.Conexion();
        Datos.MapeoResetContraseña mapeo = new Datos.MapeoResetContraseña();
        Modelo.EntidadUsuario usuario = new Modelo.EntidadUsuario();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnactualizar_Click(object sender, EventArgs e)
        {
            usuario.Codigo = int.Parse(txtuser.Text);
            NuevaContraseña(mapeo.ResetContraseña(usuario));
        }
        public void NuevaContraseña(SqlDataReader sdr)
        {
            acceso.Abrir();
            while (sdr.Read())
            {
                if (Convert.ToBoolean(sdr["ReturnCode"]))
                {
                    EnviarPassworEmail(sdr["Email"].ToString(), txtuser.Text, sdr["IdUnico"].ToString());
                    error.Style.Add("display", "block");
                }
                else
                {
                    error1.Style.Add("display", "block");
                }
            }
            acceso.Cerrar();
        }
        public void EnviarPassworEmail(string ToEmail, string Codigo, string Idunico)
        {
            try
            {
                MailMessage mailMensaje = new MailMessage("propiedadhorizontal@ingenieriavisualph.com", ToEmail);

                StringBuilder BodyEmail = new StringBuilder();
                BodyEmail.Append("Estimado Residente" + txtuser.Text + ",<br/></br>");
                BodyEmail.Append("Por favor de click en el siguiente enlace para actualizar la contraseña");
                BodyEmail.Append("<br/>");
                BodyEmail.Append("https://conjuntoid012.somee.com/Registro/NuevoPassword.aspx?uid=" + Idunico);
                BodyEmail.Append("<br/><br/>");
                BodyEmail.Append("<br/>Ingenieria Visual<br/>");

                mailMensaje.IsBodyHtml = true;

                mailMensaje.Body = BodyEmail.ToString();
                mailMensaje.Subject = "Actualizar contraseña App Propiedad horizontal";
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
                throw new Exception("No tiene un correo registrado, Solicite soporte tecnico.");
            }
        }
    }
}