using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace Datos
{
    public class MapeoCorreo
    {
        private Conexion con = new Conexion();

        private int IdCorreo;

        public int _IdCorreo
        {
            get { return IdCorreo; }
            set { IdCorreo = value; }
        }

        private int Codigo;

        public int _Codigo
        {
            get { return Codigo; }
            set { Codigo = value; }
        }

        private string Asunto;

        public string _Asunto
        {
            get { return Asunto; }
            set { Asunto = value; }
        }

        private string Leido;

        public string _Leido
        {
            get { return Leido; }
            set { Leido = value; }
        }

        private DateTime Fecha;

        public DateTime _Fecha
        {
            get { return Fecha; }
            set { Fecha = value; }
        }

        private static int id, idmax;
        public int ObtenerIdMaxCorreo()
        {
            con.Abrir();
            String query = "select IdCorreo from tblCorreo";
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = query;
            cmd.Connection = con.conexion;
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
                String query1 = "select max(IdCorreo) from tblCorreo ";
                SqlCommand cmd1 = new SqlCommand();
                cmd1.CommandText = query1;
                cmd1.Connection = con.conexion;
                SqlDataAdapter da1 = new SqlDataAdapter();
                da1.SelectCommand = cmd1;
                DataSet ds1 = new DataSet();
                da1.Fill(ds1);
                con.Cerrar();
                id = Convert.ToInt32(ds1.Tables[0].Rows[0][0].ToString());
                idmax = id + 1;
                return idmax;
            }
        }

        public void GuardarInfoCorreo(string asunto, string leido, DateTime fecha, int codigo)
        {
            MapeoCorreo correo1 = new MapeoCorreo();
            correo1._Leido = leido;
            correo1._Asunto = asunto;
            correo1._Fecha = fecha;
            correo1._Codigo = codigo;
            GuardarInfo(correo1);
        }

        public void GuardarInfo(MapeoCorreo correo)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(con.CrearParametro("@Leido",correo._Leido));
            parameters.Add(con.CrearParametro("@Asunto", correo._Asunto));
            parameters.Add(con.CrearParametro("@Fecha", correo._Fecha));
            parameters.Add(con.CrearParametro("@Codigo", correo._Codigo));
            con.Leer("sp_GuardarInfoCorreo",parameters);
        }

        public DataTable MostrarInfoCorreo(int codigo)
        {
            MapeoCorreo correo2 = new MapeoCorreo();
            correo2._Codigo = codigo;
            DataTable dt= MostrarCorreo(correo2);
            return dt;
        }

        public DataTable MostrarCorreo(MapeoCorreo correo)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(con.CrearParametro("@Codigo", correo._Codigo));
            DataTable dt = con.Leer("sp_MostrarCorreo",parameters);
            return dt;
        }

        public void ActualizarInfoCorreo(int id)
        {
            MapeoCorreo correo1 = new MapeoCorreo();
            correo1._Leido = "si";
            correo1._IdCorreo = id;
            ActualizarCorreo(correo1);
        }

        public DataTable ActualizarCorreo(MapeoCorreo correo)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(con.CrearParametro("@Leido", correo._Leido));
            parameters.Add(con.CrearParametro("@IdCorreo", correo._IdCorreo));
            DataTable dt = con.Leer("sp_ActualizarCorreo", parameters);
            return dt;
        }
    }
}
