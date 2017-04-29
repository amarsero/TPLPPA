using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Presentacion.Controllers
{
    public class LoginController : Controller
    {
        // GET: Login
        public ActionResult Index()
        {
            return View();
        }

        [HttpGet]
        //Metodo para obtener el usuario actual conectado, despues cambiale el retorno a un objeto de tipo Usuario o Empleado
        public Boolean GetCurrentUser()
        {
            //Aca poner un breackpoint y fijate si te entra, anda probando tocando la configuracion del login service hasta que llega aca.
            return true;
        }
    }
}