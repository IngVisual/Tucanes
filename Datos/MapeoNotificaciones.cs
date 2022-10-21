using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace Datos
{
    public class MapeoNotificaciones
    {
        private Datos.Conexion acceso = new Conexion();

        private int IdNot;

        public int _IdNot
        {
            get { return IdNot; }
            set { IdNot = value; }
        }

        private int IdNotBandeja;

        public int _IdNotBandeja
        {
            get { return IdNotBandeja; }
            set { IdNotBandeja = value; }
        }

        private DateTime Fecha;

        public DateTime _Fecha
        {
            get { return Fecha; }
            set { Fecha = value; }
        }

        private string Msg;

        public string _Msg
        {
            get { return Msg; }
            set { Msg = value; }
        }

        private string Asunto;

        public string _Asunto
        {
            get { return Asunto; }
            set { Asunto = value; }
        }

        private int Codigo;

        public int _Codigo
        {
            get { return Codigo; }
            set { Codigo = value; }
        }

        private string Leido;

        public string _Leido
        {
            get { return Leido; }
            set { Leido = value; }
        }

        private static int id, idmax;
        public int ObtenerIdMaxMsg()
        {
            acceso.Abrir();
            String query = "select Id from Notificacion";
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = query;
            cmd.Connection = acceso.conexion;
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            DataSet ds = new DataSet();
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count < 1)
            {
                return idmax = 1;
            }
            else
            {
                String query1 = "select max(Id) from Notificacion";
                SqlCommand cmd1 = new SqlCommand();
                cmd1.CommandText = query1;
                cmd1.Connection = acceso.conexion;
                SqlDataAdapter da1 = new SqlDataAdapter();
                da1.SelectCommand = cmd1;
                DataSet ds1 = new DataSet();
                da1.Fill(ds1);
                acceso.Cerrar();
                id = Convert.ToInt32(ds1.Tables[0].Rows[0][0].ToString());
                idmax = id + 1;
                return idmax;
            }
        }
      
        public void GuardarInfMsg(string mensaje, string asunto, DateTime fecha)
        {
            MapeoNotificaciones push = new MapeoNotificaciones();
            push._Msg = mensaje;
            push._Asunto = asunto;
            push._Fecha = fecha;
            GuardarMsg(push);
        }

        public void GuardarMsg(MapeoNotificaciones noti)
        {
            List<SqlParameter> parameter = new List<SqlParameter>();
            parameter.Add(acceso.CrearParametro("@Msg", noti._Msg));
            parameter.Add(acceso.CrearParametro("@Asunto", noti._Asunto));
            parameter.Add(acceso.CrearParametro("@Fecha", noti._Fecha));
            acceso.Leer("sp_GuardarMsg", parameter);
        }

        public DataTable MostrarMsg()
        {
            DataTable dt= acceso.Leer("sp_MostrarNotificacion", null);
            return dt;
        }

        public DataTable MostrarMsgCodigo(MapeoNotificaciones noti)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@Codigo", noti._Codigo));
            DataTable dt = acceso.Leer("sp_MostrarMsgCodigo", parameters);
            return dt;
        }

        public DataTable GuardarImagen(Modelo.EntidadImagenes imag)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@DocNotificacion", imag.Imagen));
            parameters.Add(acceso.CrearParametro("@IdNotifi", imag.IdNotif));
            DataTable dt = acceso.Leer("sp_GuardarImagenNotificacion", parameters);
            return dt;
        }

        public DataTable MostrarInfoNotifi(int codigo)
        {
            MapeoNotificaciones notifi = new MapeoNotificaciones();
            notifi._Codigo = codigo;
            DataTable dt = MostrarNoti(notifi);
            return dt;
        }

        public DataTable MostrarNoti(MapeoNotificaciones noti)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@Codigo", noti._Codigo));
            DataTable dt = acceso.Leer("sp_MostrarNoti", parameters);
            return dt;
        }

        public DataTable MostrarInfoNotifiTabla(int codigo)
        {
            MapeoNotificaciones notifi = new MapeoNotificaciones();
            notifi._Codigo = codigo;
            DataTable dt = MostrarNotiTabla(notifi);
            return dt;
        }

        public DataTable MostrarNotiTabla(MapeoNotificaciones noti)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@Codigo", noti._Codigo));
            DataTable dt = acceso.Leer("sp_MostrarNotiTabla", parameters);
            return dt;
        }

        public DataTable MostrarInfoNotifiTabla10(int codigo)
        {
            MapeoNotificaciones notifi = new MapeoNotificaciones();
            notifi._Codigo = codigo;
            DataTable dt = MostrarNotiTabla10(notifi);
            return dt;
        }

        public DataTable MostrarNotiTabla10(MapeoNotificaciones noti)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@Codigo", noti._Codigo));
            DataTable dt = acceso.Leer("sp_MostrarNotiTabla10", parameters);
            return dt;
        }

        public void  GuardarInfoBandejaNoti(int idnoti, int idcodigo)
        {
            MapeoNotificaciones push = new MapeoNotificaciones();
            push._IdNot = idnoti;
            push._Codigo = idcodigo;
            push._Leido = "no";
            GuardarBandejaNoti(push);
        }

        public DataTable GuardarBandejaNoti(MapeoNotificaciones noti)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@IdNoti", noti._IdNot));
            parameters.Add(acceso.CrearParametro("@Codigo", noti._Codigo));
            parameters.Add(acceso.CrearParametro("@Leido", noti._Leido));
            DataTable dt = acceso.Leer("sp_GuardarBandejaNoti", parameters);
            return dt;
        }

        public void ActualizarInfoNotifica(int id)
        {
            MapeoNotificaciones noti = new MapeoNotificaciones();
            noti._Leido = "si";
            noti._IdNotBandeja = id;
            ActualizarNotificacion(noti);
        }

        public DataTable ActualizarNotificacion(MapeoNotificaciones noti)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@Leido", noti._Leido));
            parameters.Add(acceso.CrearParametro("@IdNoti", noti._IdNotBandeja));
            DataTable dt = acceso.Leer("sp_ActualizarNotificacion", parameters);
            return dt;
        }

        public DataTable MostrarInfoNotifiTablaID(int id)
        {
            MapeoNotificaciones notifi = new MapeoNotificaciones();
            notifi._IdNotBandeja = id;
            DataTable dt = MostrarNotiTablaID(notifi);
            return dt;
        }   

        public DataTable MostrarNotiTablaID(MapeoNotificaciones noti)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@IdNotCod", noti._IdNotBandeja));
            DataTable dt = acceso.Leer("sp_MostrarNotiTablaID", parameters);
            return dt;
        }

        public DataTable MostrarNotifiPDF(MapeoNotificaciones noti)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@IdNotifi", noti._IdNot));
            DataTable dt = acceso.Leer("sp_MostrarNotifiPDF", parameters);
            return dt;
        }

    }
}
