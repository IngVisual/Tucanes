using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;

namespace IngenieriaVisualPH.Administracion
{
    public partial class Formulario_web120 : System.Web.UI.Page
    {
        private Datos.Conexion con = new Datos.Conexion();
        Datos.MapeoSaldos mapeo = new Datos.MapeoSaldos();
        Modelo.EntidadSaldos usuario = new Modelo.EntidadSaldos();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                MostrarSaldos();
                MostrarObserSaldos();
                lblMessage.Text = "Base de datos actual";
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
        }
        public void MostrarSaldos()
        {
            using (IngenieriaVisualPHEntities dc = new IngenieriaVisualPHEntities())
            {
                r1.DataSource = dc.tblSaldos.ToList();
                r1.DataBind();
            }
        }

        protected void MostrarObserSaldos()
        {
            DataTable dt = mapeo.MostrarObserSaldo();
            foreach (DataRow item in dt.Rows)
            {
                DateTime fecha = Convert.ToDateTime(item["Fecha"].ToString());
                txtres.Text = item["Msg"].ToString();
                lblfecha.Text = fecha.Date.ToString("yyyy/MM/dd");
            }
        }

        protected void btnbuscar_Click(object sender, EventArgs e)
        {
            if (f1.PostedFile.ContentType == "text/csv" || f1.PostedFile.ContentType == "application/vnd.ms-excel")
            {
                string fileName = Path.Combine(Server.MapPath("ExcelFile/"), Guid.NewGuid().ToString() + ".csv");
                try
                {
                    f1.PostedFile.SaveAs(fileName);

                    string[] Lines = File.ReadAllLines(fileName);
                    string[] Fields;

                    //Remove Header line
                    Lines = Lines.Skip(1).ToArray();
                    List<tblSaldo> emList = new List<tblSaldo>();
                    foreach (var line in Lines)
                    {
                        Fields = line.Split(new char[] { ',' });
                        emList.Add(
                            new tblSaldo
                            {
                                Codigo = Fields[0].Replace("\"", ""), // removed "" 
                                Admi = Fields[1].Replace("\"", ""),
                                Favor = Fields[2].Replace("\"", ""),
                                Inter = Fields[3].Replace("\"", ""),
                                Sancion = Fields[4].Replace("\"", ""),
                                Moto = Fields[5].Replace("\"", ""),
                                Carro = Fields[6].Replace("\"", ""),
                                Total = Fields[7].Replace("\"", ""),
                                Juridico = Fields[8].Replace("\"", ""),
                            });
                    }

                    // Update database data
                    using (IngenieriaVisualPHEntities dc = new IngenieriaVisualPHEntities())
                    {
                        foreach (var i in emList)
                        {
                            var v = dc.tblSaldos.Where(a => a.Codigo.Equals(i.Codigo)).FirstOrDefault();
                            if (v != null)
                            {
                                v.Codigo = i.Codigo;
                                v.Admi = i.Admi;
                                v.Favor = i.Favor;
                                v.Inter = i.Inter;
                                v.Sancion = i.Sancion;
                                v.Moto = i.Moto;
                                v.Carro = i.Carro;
                                v.Total = i.Total;
                                v.Juridico = i.Juridico;
                            }
                            else
                            {
                                dc.tblSaldos.Add(i);
                            }
                        }

                        dc.SaveChanges();
                        MostrarSaldos();
                        lblMessage.Text = "El archivo se cargó sin novedad!";
                        lblMessage.ForeColor = System.Drawing.Color.Green;
                    }
                }
                catch (Exception)
                {
                    throw;
                }
            }
        }

        protected void btneliminar_Click1(object sender, EventArgs e)
        {
            con.Abrir();
            SqlCommand cmd = con.conexion.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "truncate table tblSaldos";
            cmd.ExecuteNonQuery();
            con.Cerrar();
            Response.Redirect("SaldoAdministracion.aspx");
        }

        protected void txtbuscar_TextChanged(object sender, EventArgs e)
        {
            if(txtbuscar.MaxLength <= 5)
            {
                using (IngenieriaVisualPHEntities dc = new IngenieriaVisualPHEntities() )
                {
                    var resul = dc.tblSaldos.AsEnumerable().Where(row => row.Codigo == txtbuscar.Text);
                    r1.DataSource = resul;
                    r1.DataBind();
                }
            }
        }

        protected void GuardarFechaMensaje()
        {         
            if (txtfecha.Text!="")
            { 
            usuario._Fecha = Convert.ToDateTime(txtfecha.Text);
            usuario._Mensaje = txtres.Text;
            usuario._Id = 1;
            mapeo.GuardarFechaMsg(usuario);
            MostrarObserSaldos();
            EnviarPush();
            div1.Style.Add("display", "block");
            error3.Style.Add("display", "none");
            }
            else
            {
                div1.Style.Add("display", "none");
                error3.Style.Add("display", "block");
            }
        }

        protected void btnnot_Click(object sender, EventArgs e)
        {          
            GuardarFechaMensaje();
        }

        public void EnviarPush()
        {
            string Msm = "Estado de cuenta actualizado a la fecha: " +txtfecha.Text+"";       
            Servicios.Push SendPush = new Servicios.Push(Msm);
        }
    }
}