using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data.SqlClient;

namespace IngenieriaVisualPH
{
    public partial class Login : System.Web.UI.Page
    {
        Modelo.EntidadUsuario usuario = new Modelo.EntidadUsuario();
        Datos.MapeoLogin acceso = new Datos.MapeoLogin();
        Datos.Conexion con = new Datos.Conexion();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {
            if (txtcontraseña.Text!="" && txtcod1.Text != "" && txtcod1.Text != "190684" && txtcod1.Text != "190685"&& txtcod1.Text != "190681" && txtcod1.Text != "190682" && txtcod1.Text != "190683")
            {
                usuario.Codigo = int.Parse(txtcod1.Text);
                usuario.CCPropietario = txtcontraseña.Text;
                usuario.AceptaTerminosyCondiciones = "Si";
                int fila = acceso.Login(usuario);
                if (fila==1)
                {
                    FormsAuthentication.RedirectFromLoginPage(txtcontraseña.Text, true);
                    int count =1;
                    string est = txtcod1.Text;
                    Session["cod"] = txtcod1.Text;
                    Session["conteo"] = count.ToString();
                    int codigo = int.Parse(est);
                    DateTime fechaIngreso = DateTime.Now;
                    con.Abrir();
                    string query = "INSERT INTO tbl_RegistroLogin (Codigo, FechaIngreso) VALUES (@Codigo, @FechaIngreso)";
                    SqlCommand command = new SqlCommand(query, con.conexion);
                    command.Parameters.AddWithValue("@Codigo", codigo);
                    command.Parameters.AddWithValue("@FechaIngreso", fechaIngreso);
                    command.ExecuteNonQuery();
                    con.Cerrar();
                    Response.Redirect("~/Propietario/Token.aspx");
                }
                else if (fila == 2)
                {
                    Session["cod"] = txtcod1.Text;
                    int codigo = int.Parse(txtcod1.Text);
                    DateTime fechaIngreso = DateTime.Now;
                    con.Abrir();
                    string query = "INSERT INTO tbl_RegistroLogin (Codigo, FechaIngreso) VALUES (@Codigo, @FechaIngreso)";
                    SqlCommand command = new SqlCommand(query, con.conexion);
                    command.Parameters.AddWithValue("@Codigo", codigo);
                    command.Parameters.AddWithValue("@FechaIngreso", fechaIngreso);
                    command.ExecuteNonQuery();
                    con.Cerrar();
                    Response.Redirect("~/Registro/RegistroCitofonia.aspx");
                }
                else
                {
                    error.Style.Add("display", "block");
                }
            }
            else if(txtcod1.Text == "190684" && txtcontraseña.Text != "")
            {
                usuario.Codigo = int.Parse(txtcod1.Text);
                usuario.CCPropietario = txtcontraseña.Text;
                int fila = acceso.LoginEmpleado(usuario);
                if (fila == 1)
                {
                    DateTime fechaIngreso = DateTime.Now;
                    int codigo = int.Parse(txtcod1.Text);
                    con.Abrir();
                    string query = "INSERT INTO tbl_RegistroLoginGuarda (Codigo, FechaIngreso) VALUES (@Codigo, @FechaIngreso)";
                    SqlCommand command = new SqlCommand(query, con.conexion);
                    command.Parameters.AddWithValue("@Codigo", codigo);
                    command.Parameters.AddWithValue("@FechaIngreso", fechaIngreso);
                    command.ExecuteNonQuery();
                    con.Cerrar();
                    FormsAuthentication.RedirectFromLoginPage(txtcontraseña.Text, true);
                    Response.Redirect("~/Empleados/Citofonia.aspx");
                }
                else
                {
                    error.Style.Add("display", "block");
                }
            }
            else if (txtcod1.Text == "190685" && txtcontraseña.Text != "")
            {
                usuario.Codigo = int.Parse(txtcod1.Text);
                usuario.CCPropietario = txtcontraseña.Text;
                int fila = acceso.LoginEmpleado(usuario);
                if (fila == 1)
                {
                    FormsAuthentication.RedirectFromLoginPage(txtcontraseña.Text, true);
                    Response.Redirect("~/Empleados/HomeA.aspx");
                }
                else
                {
                    error.Style.Add("display", "block");
                }
            }
            else if (txtcod1.Text == "190681" && txtcontraseña.Text != "")
            {
                usuario.Codigo = int.Parse(txtcod1.Text);
                usuario.CCPropietario = txtcontraseña.Text;
                int fila = acceso.LoginEmpleado(usuario);
                if (fila == 1)
                {
                    FormsAuthentication.RedirectFromLoginPage(txtcontraseña.Text, true);
                    Response.Redirect("~/Administracion/AdmVerSol.aspx");
                }
                else
                {
                    error.Style.Add("display", "block");
                }
            }
            else if (txtcod1.Text == "190682" && txtcontraseña.Text != "")
            {
                usuario.Codigo = int.Parse(txtcod1.Text);
                usuario.CCPropietario = txtcontraseña.Text;
                int fila = acceso.LoginEmpleado(usuario);
                if (fila == 1)
                {
                    FormsAuthentication.RedirectFromLoginPage(txtcontraseña.Text, true);
                    Response.Redirect("~/Contabilidad/NovedadesSaldo.aspx");
                }
                else
                {
                    error.Style.Add("display", "block");
                }
            }
            else if (txtcod1.Text == "190682" && txtcontraseña.Text != "")
            {
                usuario.Codigo = int.Parse(txtcod1.Text);
                usuario.CCPropietario = txtcontraseña.Text;
                int fila = acceso.LoginEmpleado(usuario);
                if (fila == 1)
                {
                    FormsAuthentication.RedirectFromLoginPage(txtcontraseña.Text, true);
                    Response.Redirect("~/Contabilidad/NovedadesSaldo.aspx");
                }
                else
                {
                    error.Style.Add("display", "block");
                }
            }
            else if (txtcod1.Text == "190683" && txtcontraseña.Text != "")
            {
                usuario.Codigo = int.Parse(txtcod1.Text);
                usuario.CCPropietario = txtcontraseña.Text;
                int fila = acceso.LoginEmpleado(usuario);
                if (fila == 1)
                {
                    FormsAuthentication.RedirectFromLoginPage(txtcontraseña.Text, true);
                    Response.Redirect("~/Consejo/AdmActas.aspx");
                }
                else
                {
                    error.Style.Add("display", "block");
                }
            }

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Registro/ResetPassword.aspx");
        }
    }
}