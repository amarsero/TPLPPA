using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BIZ;

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

        public string ObtenerImagen(string path)
        {
            BLL.BLLCliente bll = new BLL.BLLCliente();
            return bll.ObtenerImagen(path);
        }

        [HttpPost]
        public void NuevaTarjeta(object tarjeta, int dni)
        {
            Tarjeta tar = Newtonsoft.Json.JsonConvert.DeserializeObject<Tarjeta>(tarjeta.ToString());

            BLL.BLLTarjeta bll = new BLL.BLLTarjeta();

            bll.CrearTarjeta(tar,dni);

        }


	}
}