using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Presentacion.Controllers
{
    public class SolicitudTarjetaController : Controller
    {
        //
        // GET: /SolicitudTarjeta/
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public void CrearCliente(string nombre, int dni)
        {
            BLL.BLLCliente bll = new BLL.BLLCliente();
            bll.CrearCliente(nombre,dni);
        }

	}
}