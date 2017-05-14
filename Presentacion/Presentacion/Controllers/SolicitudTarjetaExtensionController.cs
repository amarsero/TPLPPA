using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Presentacion.Controllers
{
    public class SolicitudTarjetaExtensionController : Controller
    {
        //
        // GET: /SolicitudTarjetaExtension/
        public ActionResult Index()
        {
            return View();
        }
        public string ObtenerClientePorDNI(int dni)
        {
            BLL.BLLCliente bll = new BLL.BLLCliente();
            BIZ.Cliente cliente = bll.ObtenerClientePorDNI(dni);

            return Newtonsoft.Json.JsonConvert.SerializeObject(cliente);
        }
	}
}