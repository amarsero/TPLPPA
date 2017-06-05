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
            BIZ.Cliente[] cliente = new BIZ.Cliente[2];
            cliente[0] = bll.ObtenerClientePorDNI(dni);
            if (cliente[0].DniConyugue!= null)
            cliente[1] = bll.ObtenerClientePorDNI((int)cliente[0].DniConyugue);

            return Newtonsoft.Json.JsonConvert.SerializeObject(cliente);
        }
	}
}