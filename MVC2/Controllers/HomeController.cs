using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;

namespace MVC2.Controllers
{
    public class HomeController : Controller
    {
        public async Task<ActionResult> Index()
        {
            //http://conjuntoid004:63245/api/tblSaldos
            var httpClient = new HttpClient();
            var json = await httpClient.GetStringAsync("http://conjunotid004:63245/api/tblSaldos");
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}