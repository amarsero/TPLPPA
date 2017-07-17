using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Presentacion.Controllers
{
    public class TarjetasController : Controller
    {
        //
        // GET: /Tarjetas/
        public ActionResult Index()
        {
            return View();
        }

        public string ObtenerTarjetas()
        {
            BLL.BLLTarjeta bll = new BLL.BLLTarjeta();

            return Newtonsoft.Json.JsonConvert.SerializeObject(bll.ObtenerTarjetas());
        }

        public string ObtenerClientes()
        {
            BLL.BLLTarjeta bll = new BLL.BLLTarjeta();

            return Newtonsoft.Json.JsonConvert.SerializeObject(bll.ObtenerClientes());
        }
    }
}