using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using System.Web.Script.Serialization;

namespace Servicios
{
    public class Push
    {
        
        public Push(string codigo, string push, string mensaje)
        {
            ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;
            var request = WebRequest.Create("https://onesignal.com/api/v1/notifications") as HttpWebRequest;

            request.KeepAlive = true;
            request.Method = "POST";
            request.ContentType = "application/json; charset=utf-8";

            request.Headers.Add("authorization", "Basic YjE2ZTY0Y2UtNzg0My00ODIxLWFhNmEtZTBiODc0ZjEzMmY1");

            var serializer = new JavaScriptSerializer();
            var obj = new
            {
                app_id = "e65775c9-85b6-4077-b9bb-7fab825b343d",
                contents = new { en = "Vivienda: " + codigo+ "" +mensaje+"" },
                web_url = "https://conjuntoid012.somee.com/Login.aspx?ReturnUrl=%2fPropietario%2fPerfil_Propietario.aspx",
                include_player_ids = new string[] { "" + push + "" }
            };
            var param = serializer.Serialize(obj);
            byte[] byteArray = Encoding.UTF8.GetBytes(param);

            string responseContent = null;

            try
            {
                using (var writer = request.GetRequestStream())
                {
                    writer.Write(byteArray, 0, byteArray.Length);
                }
                
                using (var response = request.GetResponse() as HttpWebResponse)
                {
                    using (var reader = new StreamReader(response.GetResponseStream()))
                    {
                        responseContent = reader.ReadToEnd();
                    }
                }
            }
            catch (WebException ex)
            {
                System.Diagnostics.Debug.WriteLine(ex.Message);
                System.Diagnostics.Debug.WriteLine(new StreamReader(ex.Response.GetResponseStream()).ReadToEnd());
            }

            System.Diagnostics.Debug.WriteLine(responseContent);
        }

        public Push(string mensaje)
        {
            ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;
            var request = WebRequest.Create("https://onesignal.com/api/v1/notifications") as HttpWebRequest;

            request.KeepAlive = true;
            request.Method = "POST";
            request.ContentType = "application/json; charset=utf-8";

            request.Headers.Add("authorization", "Basic YjE2ZTY0Y2UtNzg0My00ODIxLWFhNmEtZTBiODc0ZjEzMmY1");

            var serializer = new JavaScriptSerializer();
            var obj = new
            {
                app_id = "e65775c9-85b6-4077-b9bb-7fab825b343d",
                contents = new { en = "" + mensaje + "" },
                web_url = "https://conjuntoid012.somee.com/Login.aspx?ReturnUrl=%2fPropietario%2fPerfil_Propietario.aspx",
                included_segments = new string[] { "Subscribed Users" }
            };
            var param = serializer.Serialize(obj);
            byte[] byteArray = Encoding.UTF8.GetBytes(param);

            string responseContent = null;

            try
            {
                using (var writer = request.GetRequestStream())
                {
                    writer.Write(byteArray, 0, byteArray.Length);
                }

                using (var response = request.GetResponse() as HttpWebResponse)
                {
                    using (var reader = new StreamReader(response.GetResponseStream()))
                    {
                        responseContent = reader.ReadToEnd();
                    }
                }
            }
            catch (WebException ex)
            {
                System.Diagnostics.Debug.WriteLine(ex.Message);
                System.Diagnostics.Debug.WriteLine(new StreamReader(ex.Response.GetResponseStream()).ReadToEnd());
            }

            System.Diagnostics.Debug.WriteLine(responseContent);
        }

        public Push(string mensaje, string asunto)
        {
            ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;
            var request = WebRequest.Create("https://onesignal.com/api/v1/notifications") as HttpWebRequest;

            request.KeepAlive = true;
            request.Method = "POST";
            request.ContentType = "application/json; charset=utf-8";

            request.Headers.Add("authorization", "Basic YjE2ZTY0Y2UtNzg0My00ODIxLWFhNmEtZTBiODc0ZjEzMmY1");

            var serializer = new JavaScriptSerializer();
            var obj = new
            {
                app_id = "e65775c9-85b6-4077-b9bb-7fab825b343d",
                headings= new { en = "" + asunto + "" },
                contents = new { en = "" + mensaje + "" },
                web_url = "https://conjuntoid012.somee.com/Login.aspx?ReturnUrl=%2fPropietario%2fPerfil_Propietario.aspx",
                included_segments = new string[] { "Subscribed Users" }
            };
            var param = serializer.Serialize(obj);
            byte[] byteArray = Encoding.UTF8.GetBytes(param);

            string responseContent = null;

            try
            {
                using (var writer = request.GetRequestStream())
                {
                    writer.Write(byteArray, 0, byteArray.Length);
                }

                using (var response = request.GetResponse() as HttpWebResponse)
                {
                    using (var reader = new StreamReader(response.GetResponseStream()))
                    {
                        responseContent = reader.ReadToEnd();
                    }
                }
            }
            catch (WebException ex)
            {
                System.Diagnostics.Debug.WriteLine(ex.Message);
                System.Diagnostics.Debug.WriteLine(new StreamReader(ex.Response.GetResponseStream()).ReadToEnd());
            }

            System.Diagnostics.Debug.WriteLine(responseContent);
        }

        public Push(string codigo, string push, string mensaje,string asunto)
        {
            ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;
            var request = WebRequest.Create("https://onesignal.com/api/v1/notifications") as HttpWebRequest;

            request.KeepAlive = true;
            request.Method = "POST";
            request.ContentType = "application/json; charset=utf-8";

            request.Headers.Add("authorization", "Basic YjE2ZTY0Y2UtNzg0My00ODIxLWFhNmEtZTBiODc0ZjEzMmY1");

            var serializer = new JavaScriptSerializer();
            var obj = new
            {
                app_id = "e65775c9-85b6-4077-b9bb-7fab825b343d",
                headings = new { en = "" + asunto + "" },
                contents = new { en = "Vivienda: " + codigo + "" + mensaje + "" },
                web_url = "https://conjuntoid012.somee.com/Login.aspx?ReturnUrl=%2fPropietario%2fPerfil_Propietario.aspx",
                include_player_ids = new string[] { "" + push + "" }
            };
            var param = serializer.Serialize(obj);
            byte[] byteArray = Encoding.UTF8.GetBytes(param);

            string responseContent = null;

            try
            {
                using (var writer = request.GetRequestStream())
                {
                    writer.Write(byteArray, 0, byteArray.Length);
                }

                using (var response = request.GetResponse() as HttpWebResponse)
                {
                    using (var reader = new StreamReader(response.GetResponseStream()))
                    {
                        responseContent = reader.ReadToEnd();
                    }
                }
            }
            catch (WebException ex)
            {
                System.Diagnostics.Debug.WriteLine(ex.Message);
                System.Diagnostics.Debug.WriteLine(new StreamReader(ex.Response.GetResponseStream()).ReadToEnd());
            }

            System.Diagnostics.Debug.WriteLine(responseContent);
        }

    }
}
