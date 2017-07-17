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

        public string ObtenerTarjetas(int skip)
        {
            BLL.BLLTarjeta bll = new BLL.BLLTarjeta();

            return Newtonsoft.Json.JsonConvert.SerializeObject(bll.ObtenerTarjetas(skip));
        }

        public string ObtenerClientes(int skip)
        {
            BLL.BLLTarjeta bll = new BLL.BLLTarjeta();

            return Newtonsoft.Json.JsonConvert.SerializeObject(bll.ObtenerClientes(skip));
        }
    }
}