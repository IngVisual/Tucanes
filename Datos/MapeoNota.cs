using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace Datos
{
    public class MapeoNota
    {
        private int Id;

        public int _Id
        {
            get { return Id; }
            set { Id = value; }
        }

        private string Nota;

        public string _Nota
        {
            get { return Nota; }
            set { Nota = value; }
        }

        private DateTime Fecha;

        public DateTime _Fecha
        {
            get { return Fecha; }
            set { Fecha = value; }
        }

        private string Estado;

        public string _Estado
        {
            get { return Estado; }
            set { Estado = value; }
        }
        public void Guardar(string not, string est, DateTime fecha)
        {
            MapeoNota notas = new MapeoNota();
            notas._Nota = not;
            notas._Fecha = fecha;
            notas._Estado = est;
            GuardarNota(notas);
        }
        public void Actualizar(int id, string est)
        {
            MapeoNota notas = new MapeoNota();
            notas._Id = id;
            notas._Estado = est;
            ActualizarNota(notas);
        }

        private Conexion acceso = new Conexion();

        public void GuardarNota(MapeoNota nota)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@Nota", nota._Nota));
            parameters.Add(acceso.CrearParametro("@Fecha", nota._Fecha));
            parameters.Add(acceso.CrearParametro("@Estado", nota._Estado));
            acceso.Leer("sp_GuardarNota", parameters);
        }

        public DataTable MostrarNota()
        {
            DataTable dt= acceso.Leer("sp_MostrarNota",null);
            return dt;
        }

        public void ActualizarNota(MapeoNota nota)
        {
            List<SqlParameter> parameter = new List<SqlParameter>();
            parameter.Add(acceso.CrearParametro("Id", nota._Id));
            parameter.Add(acceso.CrearParametro("@Estado",nota._Estado));
            acceso.Leer("ActualizarNota", parameter);
        }
    }
}
