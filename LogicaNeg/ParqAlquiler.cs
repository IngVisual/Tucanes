using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Datos;
using Modelo.AlquilerParqueadero;
using System.Data.SqlClient;
using System.Data;
using System.Security;
using System.Security.Cryptography;

namespace LogicaNeg
{
    public class ParqAlquiler
    {
        MapeoAlquilerParqueadero dataAlquiler = new MapeoAlquilerParqueadero();
        Alquiler modAlquiler = new Alquiler();
        int TipoConsulta4 = 4, Codigo, IDTipoAlq, Dias, Horas, Tarifa, FreeHora, TarifaHoraFija, precioFree = 0, hora;
        double cantDias, cantHoras, A_pagar = 0, Total, totalRedondeo, Pagar, suma1, suma2 = 0, suma3, Acumulado1 = 0, Acumulado3 = 0, totalpagar;
        DateTime FechaIni;
        string Estado, Placa, Marca, Nombre, tipoAlquiler, TipoParqueadero, TipoVehiculo, TipoTarifa, TipoDia;

        public List<TipoAlquiler> CalcularTotalAlquiler(int id)
        {
            DateTime utcNow = DateTime.UtcNow;
            TimeZoneInfo colombiaTimeZone = TimeZoneInfo.FindSystemTimeZoneById("SA Pacific Standard Time");
            DateTime colombiaTime = TimeZoneInfo.ConvertTimeFromUtc(utcNow, colombiaTimeZone);
            DateTime Fechafina = colombiaTime;

            List<TipoAlquiler> listPago = new List<TipoAlquiler>();
            modAlquiler.IDalquiler = id;
            modAlquiler.tipoConsulta = TipoConsulta4;
            DataTable dt = dataAlquiler.TablaAlquilerId(modAlquiler);

            foreach (DataRow item in dt.Rows)
            {
                Codigo = int.Parse(item["Codigo"].ToString());
                IDTipoAlq = int.Parse(item["IDTipoAlq"].ToString());
                FechaIni = DateTime.Parse(item["FechaIni"].ToString());
                Placa = item["Placa"].ToString();
                Marca = item["Marca"].ToString();
                Nombre = item["Nombre"].ToString();
                Dias = int.Parse(item["Dias"].ToString());
                Horas = int.Parse(item["Horas"].ToString());
                Estado = item["Estado"].ToString();
                tipoAlquiler = item["TipoAlquiler"].ToString();
                TipoParqueadero = item["TipoParqueadero"].ToString();
                TipoVehiculo = item["TipoVehiculo"].ToString();
                Tarifa = int.Parse(item["Tarifa"].ToString());
                TipoTarifa = item["TipoTarifa"].ToString();
                TipoDia = item["TipoDia"].ToString();
                FreeHora = int.Parse(item["Free_hora"].ToString());
                TarifaHoraFija = int.Parse(item["TarifaHoraFija"].ToString());
            }
            return listPago = AtributosAsociadosTipoAlquiler(Codigo, IDTipoAlq, FechaIni, Fechafina, Dias, Horas, tipoAlquiler, TipoParqueadero,
                TipoVehiculo, Tarifa, TipoTarifa, TipoDia, FreeHora, TarifaHoraFija, Placa);

        }

        public List<TipoAlquiler> AtributosAsociadosTipoAlquiler(int Codigo, int IDTipoAlq, DateTime FechaIni, DateTime Fechafin, int Dias,
             int Horas, string tipoAlquiler, string TipoParqueadero, string TipoVehiculo, int Tarifa, string TipoTarifa,
             string TipoDia, int FreeHora, int TarifaHoraFija, string Placa)
        {
            List<TipoAlquiler> listPago = new List<TipoAlquiler>();

            cantDias = CalculaFechas(Fechafin, FechaIni);
            cantHoras = CalcularHoras(Fechafin, FechaIni);
            var Pagar = CalculoConTarifa(TipoTarifa, cantHoras, Tarifa, TarifaHoraFija, Fechafin, FechaIni, FreeHora, Placa);

            listPago.Add(new TipoAlquiler()
            {
                Total = Convert.ToInt32(Pagar.Total),
                Dias = Convert.ToInt32(cantDias),
                Horas = Convert.ToInt32(Pagar.Hora),
                msg = Convert.ToInt32(Pagar.IngrMult),
                FechaFin = Fechafin,
                FechaIni = FechaIni,
                Placa = Placa,
                Nombre = Nombre,
                Marca = Marca,
                _TipoAlquiler = tipoAlquiler,
                Codigo = Codigo
            });
            return listPago;

        }

        private double CalculaFechas(DateTime ff, DateTime fi)
        {
            TimeSpan DifFechas = ff - fi;
            var totaldias = DifFechas.TotalDays;
            if (totaldias < 0) { Dias = 0; } else { Dias = Convert.ToInt32(totaldias); };
            return Dias;
        }

        private double CalcularHoras(DateTime ff, DateTime fi)
        {
            TimeSpan DifFechas = ff - fi;
            var totalhoras = DifFechas.TotalHours;
            double Horas;
            if (totalhoras < 0) { Horas = 0; } else { Horas = totalhoras; };
            return Horas;
        }

        public HorasTotales CalculoConTarifa(string tipoTarifa, double TotalHoras, int tarifa, int TarifaHoraFija, DateTime ff, DateTime fi, int FreeHora, string placa)
        {

            int HoraDe6ama6pmCarro = 1000;
            int PlenaDe6pm6amCarro = 2000;
            int tarifa1 = 0;
            int tarifa2 = 0;
            int tarifa3 = 0;
            int Acumulado1 = 0;
            int Acumulado2 = 0;
            int cambioHora = 0;
            int horasAcumuladas = 0;
            int tarifasFijasCobradas = 0;
            List<Alquiler> listPago = new List<Alquiler>();
            HorasTotales horasTotales = new HorasTotales();

            TimeSpan DifFechas = ff - fi;
            double resultHorasRedondeado = DifFechas.TotalHours;
            int resultHoras = (int)Math.Ceiling(resultHorasRedondeado);

            //validar si existe mas de un ingresio en un dia
            DateTime utcNow = DateTime.UtcNow;
            TimeZoneInfo colombiaTimeZone = TimeZoneInfo.FindSystemTimeZoneById("SA Pacific Standard Time");
            DateTime colombiaTime = TimeZoneInfo.ConvertTimeFromUtc(utcNow, colombiaTimeZone);

            MapeoAlquilerParqueadero mapeo = new MapeoAlquilerParqueadero();
            Conexion con = new Conexion();
            Alquiler modAlq = new Alquiler();
            modAlq.Placa = placa;
            modAlq.FechaIni = colombiaTime;
            var dt = mapeo.ValidarAlquilerDia(modAlq);
            if (dt.Rows.Count > 1)
            {
                if (tipoTarifa == "HORARIA")
                {
                    int x = 0;
                    int dia = 1;
                    for (int y = 1; y <= resultHoras; y++)
                    {
                        if (dia == 1)
                        {
                            hora = fi.Hour + x;
                        }
                        else
                        {
                            hora = cambioHora + x;
                        }
                        x++;

                        if (hora <= 24)
                        {
                            switch (hora)
                            {
                                case 1:
                                    tarifa1 = tarifa1 + PlenaDe6pm6amCarro;
                                    break;
                                case 2:
                                    tarifa1 = tarifa1 + PlenaDe6pm6amCarro;
                                    break;
                                case 3:
                                    tarifa1 = tarifa1 + PlenaDe6pm6amCarro;
                                    break;
                                case 4:
                                    tarifa1 = tarifa1 + PlenaDe6pm6amCarro;
                                    break;
                                case 5:
                                    tarifa1 = tarifa1 + PlenaDe6pm6amCarro;
                                    break;
                                case 6:
                                    tarifa2 = tarifa2 + HoraDe6ama6pmCarro;
                                    break;
                                case 7:
                                    tarifa2 = tarifa2 + HoraDe6ama6pmCarro;
                                    break;
                                case 8:
                                    tarifa2 = tarifa2 + HoraDe6ama6pmCarro;
                                    break;
                                case 9:
                                    tarifa2 = tarifa2 + HoraDe6ama6pmCarro;
                                    break;
                                case 10:
                                    tarifa2 = tarifa2 + HoraDe6ama6pmCarro;
                                    break;
                                case 11:
                                    tarifa2 = tarifa2 + HoraDe6ama6pmCarro;
                                    break;
                                case 12:
                                    tarifa2 = tarifa2 + HoraDe6ama6pmCarro;
                                    break;
                                case 13:
                                    tarifa2 = tarifa2 + HoraDe6ama6pmCarro;
                                    break;
                                case 14:
                                    tarifa2 = tarifa2 + HoraDe6ama6pmCarro;
                                    break;
                                case 15:
                                    tarifa2 = tarifa2 + HoraDe6ama6pmCarro;
                                    break;
                                case 16:
                                    tarifa2 = tarifa2 + HoraDe6ama6pmCarro;
                                    break;
                                case 17:
                                    tarifa2 = tarifa2 + HoraDe6ama6pmCarro;
                                    break;
                                case 18:
                                    tarifa2 = tarifa2 + HoraDe6ama6pmCarro;
                                    break;
                                case 19:
                                    tarifa2 = tarifa2 + HoraDe6ama6pmCarro;
                                    break;
                                case 20:
                                    tarifa2 = tarifa2 + HoraDe6ama6pmCarro;
                                    break;
                                case 21:
                                    tarifa2 = tarifa2 + HoraDe6ama6pmCarro;
                                    break;
                                case 22:
                                    tarifa1 = tarifa1 + PlenaDe6pm6amCarro;
                                    break;
                                case 23:
                                    tarifa1 = tarifa1 + PlenaDe6pm6amCarro;
                                    break;
                                case 24:
                                    tarifa1 = tarifa1 + PlenaDe6pm6amCarro;
                                    break;
                            }
                            Acumulado1 = tarifa1 + tarifa2;
                        }
                        else
                        {
                            dia++;
                            cambioHora = 0;
                            x = 1;
                            Acumulado2 = Acumulado2 + Acumulado1;
                            Acumulado1 = 0;
                            tarifa1 = 0;
                            tarifa2 = 0;
                            resultHoras = resultHoras + 1;
                        }
                    }
                    totalpagar = Acumulado1 + Acumulado2;
                }
                var tothoras = DifFechas.TotalHours;
                double Horas;
                if (tothoras < 0) { Horas = 0; } else { Horas = tothoras; };
                var Total = Horas;
                double pago = 0;
                if (totalpagar < 0) { pago = 0; } else { pago = totalpagar; };
                var TotalPago = pago;
                totalRedondeo = Math.Ceiling(Total);
                A_pagar = TotalPago;
                horasTotales.Total = A_pagar;
                horasTotales.Hora = totalRedondeo;
                horasTotales.IngrMult = 1;

            }
            else
            {
                if (tipoTarifa == "HORARIA")
                {
                    if (resultHoras < 1)
                    {
                        A_pagar = 0;
                    }
                    else if (resultHoras < 2)
                    {
                        A_pagar = 0;
                    }
                    else
                    {
                        resultHoras = resultHoras - 2;
                        fi = fi.AddHours(2);
                        int x = 0;
                        int dia = 1;
                        for (int y = 1; y <= resultHoras; y++)
                        {
                            if (dia == 1)
                            {
                                hora = fi.Hour + x;
                            }
                            else
                            {
                                hora = cambioHora + x;
                            }
                            x++;

                            if (hora <= 24)
                            {
                                switch (hora)
                                {
                                    case 1:
                                        tarifa1 = tarifa1 + PlenaDe6pm6amCarro;
                                        break;
                                    case 2:
                                        tarifa1 = tarifa1 + PlenaDe6pm6amCarro;
                                        break;
                                    case 3:
                                        tarifa1 = tarifa1 + PlenaDe6pm6amCarro;
                                        break;
                                    case 4:
                                        tarifa1 = tarifa1 + PlenaDe6pm6amCarro;
                                        break;
                                    case 5:
                                        tarifa1 = tarifa1 + PlenaDe6pm6amCarro;
                                        break;
                                    case 6:
                                        tarifa2 = tarifa2 + HoraDe6ama6pmCarro;
                                        break;
                                    case 7:
                                        tarifa2 = tarifa2 + HoraDe6ama6pmCarro;
                                        break;
                                    case 8:
                                        tarifa2 = tarifa2 + HoraDe6ama6pmCarro;
                                        break;
                                    case 9:
                                        tarifa2 = tarifa2 + HoraDe6ama6pmCarro;
                                        break;
                                    case 10:
                                        tarifa2 = tarifa2 + HoraDe6ama6pmCarro;
                                        break;
                                    case 11:
                                        tarifa2 = tarifa2 + HoraDe6ama6pmCarro;
                                        break;
                                    case 12:
                                        tarifa2 = tarifa2 + HoraDe6ama6pmCarro;
                                        break;
                                    case 13:
                                        tarifa2 = tarifa2 + HoraDe6ama6pmCarro;
                                        break;
                                    case 14:
                                        tarifa2 = tarifa2 + HoraDe6ama6pmCarro;
                                        break;
                                    case 15:
                                        tarifa2 = tarifa2 + HoraDe6ama6pmCarro;
                                        break;
                                    case 16:
                                        tarifa2 = tarifa2 + HoraDe6ama6pmCarro;
                                        break;
                                    case 17:
                                        tarifa2 = tarifa2 + HoraDe6ama6pmCarro;
                                        break;
                                    case 18:
                                        tarifa2 = tarifa2 + HoraDe6ama6pmCarro;
                                        break;
                                    case 19:
                                        tarifa2 = tarifa2 + HoraDe6ama6pmCarro;
                                        break;
                                    case 20:
                                        tarifa2 = tarifa2 + HoraDe6ama6pmCarro;
                                        break;
                                    case 21:
                                        tarifa2 = tarifa2 + HoraDe6ama6pmCarro;
                                        break;
                                    case 22:
                                        tarifa1 = tarifa1 + PlenaDe6pm6amCarro;
                                        break;
                                    case 23:
                                        tarifa1 = tarifa1 + PlenaDe6pm6amCarro;
                                        break;
                                    case 24:
                                        tarifa1 = tarifa1 + PlenaDe6pm6amCarro;
                                        break;
                                }
                                Acumulado1 = tarifa1 + tarifa2;
                            }
                            else
                            {
                                dia++;
                                cambioHora = 0;
                                x = 1;
                                Acumulado2 = Acumulado2 + Acumulado1;
                                Acumulado1 = 0;
                                tarifa1 = 0;
                                tarifa2 = 0;
                                resultHoras = resultHoras + 1;
                            }
                        }
                        totalpagar = Acumulado1 + Acumulado2;
                    }
                }
                var tothoras = DifFechas.TotalHours;
                double Horas;
                if (tothoras < 0) { Horas = 0; } else { Horas = tothoras; };
                var Total = Horas;
                double pago = 0;
                if (totalpagar < 0) { pago = 0; } else { pago = totalpagar; };
                var TotalPago = pago;
                totalRedondeo = Math.Ceiling(Total);
                A_pagar = TotalPago;
                horasTotales.Total = A_pagar;
                horasTotales.Hora = totalRedondeo;
                horasTotales.IngrMult = 0;
            }
            return horasTotales;
        }

        //Guardar Pago del alquiler
        public void GuardarPago(TipoAlquiler RegPago)
        {
            dataAlquiler.GuardarPagoAlquiler(RegPago);
        }

        //------------------------------------------------------------------------------------------------
        //Filtrar pagos por tiempo
        public DataTable FiltrarPagosTotal(DateTime fehaInicial, DateTime fechaFinal)
        {
            modAlquiler.FechaIni = fehaInicial;
            modAlquiler.FechaFin = fechaFinal;
            var data = dataAlquiler.FiltrosPagosTotal(modAlquiler);
            return data;
        }
        //Filtrar pagos por tiempo
        public DataTable FiltrarPagosFacturado(DateTime fehaInicial, DateTime fechaFinal)
        {
            modAlquiler.FechaIni = fehaInicial;
            modAlquiler.FechaFin = fechaFinal;
            var data = dataAlquiler.FiltrosPagosFacturado(modAlquiler);
            return data;
        }
        //Filtrar pagos por tiempo
        public DataTable FiltrarPagosNovedad(DateTime fehaInicial, DateTime fechaFinal)
        {
            modAlquiler.FechaIni = fehaInicial;
            modAlquiler.FechaFin = fechaFinal;
            var data = dataAlquiler.FiltrosPagosNovedad(modAlquiler);
            return data;
        }
        //Filtrar pagos por tiempo
        public DataTable FiltrarPagosCancelado(DateTime fehaInicial, DateTime fechaFinal)
        {
            modAlquiler.FechaIni = fehaInicial;
            modAlquiler.FechaFin = fechaFinal;
            var data = dataAlquiler.FiltrosPagosCancelado(modAlquiler);
            return data;
        }
        //------------------------------------------------------------
        public DataTable FiltrarPagos(DateTime fehaInicial, DateTime fechaFinal)
        {
            modAlquiler.FechaIni = fehaInicial;
            modAlquiler.FechaFin = fechaFinal;
            var data = dataAlquiler.FiltrosPagos(modAlquiler);
            return data;
        }

        public class HorasTotales
        {
            public double Total { get; set; }
            public double Hora { get; set; }
            public int IngrMult { get; set; }
        }

    }
}
