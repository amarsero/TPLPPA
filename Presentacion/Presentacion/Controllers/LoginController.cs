using Presentacion.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using System.Threading.Tasks;
using System.Drawing;
using System.Security.Cryptography;
using System.Text;
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
        public BIZ.Cliente GetCurrentUser()
        {
            BIZ.Cliente Empleado = new BIZ.Cliente();
            Empleado.Cuit = 123123123;

            //Aca poner un breackpoint y fijate si te entra, anda probando tocando la configuracion del login service hasta que llega aca.
            return Empleado;
        }

        [HttpGet]
        public string IniciarSesion(string usuario, string password)
        {
            try
            {
                BIZ.Empleado Empelado = new BIZ.Empleado();
                BLL.BLLLogin Login = new BLL.BLLLogin();
                Empelado = Login.IniciarSesion(usuario,password);
                System.Web.HttpContext.Current.Session["usuarioIniciado"] = Empelado;
                return Newtonsoft.Json.JsonConvert.SerializeObject(Empelado);
            }
            catch(Exception)
            {
                throw new Exception("Usuario o contraseña incorrectos.");
            }



        }
    }
}