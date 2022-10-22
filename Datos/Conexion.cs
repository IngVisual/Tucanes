using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;


namespace Datos
{
    public class Conexion
    {
        public SqlConnection conexion;

        public ConnectionState State { get; set; }

        public void Abrir()
        {
            //Data Source = INGENIERIAVISUA\\SQLEXPRESS; Initial Catalog = IngenieriaVisualPH; Integrated Security = True
            //workstation id = DBconjuntoid004.mssql.somee.com; packet size = 4096; user id = AppCibeles_SQLLogin_1; pwd = k4nd9r8qxx; data source = DBconjuntoid004.mssql.somee.com; persist security info = False; initial catalog = DBconjuntoid004
            conexion = new SqlConnection("workstation id = DBconjuntoid013.mssql.somee.com; packet size = 4096; user id = AppCibeles_SQLLogin_1; pwd = k4nd9r8qxx; data source = DBconjuntoid013.mssql.somee.com; persist security info = False; initial catalog = DBconjuntoid013");
            conexion.Open();
        }
        public void Cerrar()
        {
            conexion.Close();
            conexion = null;
            GC.Collect();
        }
        private SqlCommand CrearComando(string nombre, List<SqlParameter>parametro=null)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conexion;
            cmd.CommandText = nombre;
            cmd.CommandType = CommandType.StoredProcedure;
            if(parametro!= null && parametro.Count>0)
            {
                cmd.Parameters.AddRange(parametro.ToArray());
            }
            return cmd;
        }

        public DataTable Leer(string nombre, List<SqlParameter>parametro = null)
        {
            Abrir();
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = CrearComando(nombre, parametro);
            da.Fill(dt);
            Cerrar();
            return dt;
        }

        //-----login verificacion de usuario
        public int VerificarLogin(string nombre, List<SqlParameter> parametro = null)
        {
            Abrir();
            int filas = 0; ;
            SqlCommand cmd = CrearComando(nombre, parametro);
            int ReturnValue = (int)cmd.ExecuteScalar();
            if (ReturnValue == 1)
            {
                filas = 1;
            }
            else if(ReturnValue == 2)
            {
                filas = 2;
            }
            else {
                filas = -1;
            }
            Cerrar();
            return filas;
        }
        //-------Retornar sqldatareader
        public SqlDataReader RetornarSqlReader(string nombre, List<SqlParameter> parametro = null)
        {
            Abrir();
            SqlCommand cmd = CrearComando(nombre, parametro);
            SqlDataReader sdr = cmd.ExecuteReader();
            return sdr;
        }
        //retornar DATASET
        public DataSet Consultar(string nombre)
        {
            Abrir();
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = CrearComando(nombre);
            da.Fill(ds);
            Cerrar();
            return ds;
        }

        //-------solo guardar datos
        public void GuardarDatos(string nombre, List<SqlParameter> parametro=null)
        {
            Abrir();
            SqlCommand cmd = CrearComando(nombre, parametro);
            cmd.ExecuteNonQuery();
            Cerrar();
        }
       
        //Escribe y retorna un entero como condicional
        public int Escribir(string nombre, List<SqlParameter> parametro = null)
        {
            Abrir();
            int Filas = 0;

            SqlCommand cmd = CrearComando(nombre, parametro);
            int ReturnValue = (int)cmd.ExecuteScalar();
            if (ReturnValue == 1)
            {
                Filas = 1;
            }
            else
            {
                Filas = 0;
            }
            Cerrar();
            return Filas;
        }

        //METODOS
        public SqlParameter CrearParametro(string nombre, int valor)
        {
            SqlParameter parameter = new SqlParameter();
            parameter.ParameterName = nombre;
            parameter.Value = valor;
            parameter.DbType = DbType.Int32;
            return parameter;
        }
        public SqlParameter CrearParametro(string nombre, string valor)
        {
            SqlParameter parameter = new SqlParameter();
            parameter.ParameterName = nombre;
            parameter.Value = valor;
            parameter.DbType = DbType.String;
            return parameter;
        }
        public SqlParameter CrearParametro(string nombre, DateTime valor)
        {
            SqlParameter parameter = new SqlParameter();
            parameter.ParameterName = nombre;
            parameter.Value = valor;
            parameter.DbType = DbType.DateTime;
            return parameter;
        }
        public SqlParameter CrearParametro(string nombre, double valor)
        {
            SqlParameter parameter = new SqlParameter();
            parameter.ParameterName = nombre;
            parameter.Value = valor;
            parameter.DbType = DbType.Double;
            return parameter;
        }
        public SqlParameter CrearParametro(string nombre, bool valor)
        {
            SqlParameter parameter = new SqlParameter();
            parameter.ParameterName = nombre;
            parameter.Value = valor;
            parameter.DbType = DbType.Boolean;
            return parameter;
        }
        public SqlParameter CrearParametro(string nombre, object valor)
        {
            SqlParameter parameter = new SqlParameter();
            parameter.ParameterName = nombre;
            parameter.Value = valor;
            parameter.DbType = DbType.Object;
            return parameter;
        }

    }
}
