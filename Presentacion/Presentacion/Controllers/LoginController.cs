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
        public string GetCurrentUser()
        {

            return Newtonsoft.Json.JsonConvert.SerializeObject(System.Web.HttpContext.Current.Session["usuarioIniciado"]);
        }

        public string GetCurrentTerminal()
        {

            return Newtonsoft.Json.JsonConvert.SerializeObject(System.Web.HttpContext.Current.Session["terminalIniciado"]);
        }

        [HttpGet]
        public string IniciarSesion(string usuario, string password)
        {
            try
            {
                BIZ.Empleado Empelado = new BIZ.Empleado();
                BIZ.Terminal Terminal = new BIZ.Terminal();
                BLL.BLLLogin Login = new BLL.BLLLogin();
                Empelado = Login.IniciarSesion(usuario, password);
                Terminal = Login.ObtenerTerminalEmpleado(Empelado.DNI);
                System.Web.HttpContext.Current.Session["usuarioIniciado"] = Empelado;
                System.Web.HttpContext.Current.Session["terminalIniciado"] = Terminal;
                return Newtonsoft.Json.JsonConvert.SerializeObject(Empelado);
            }
            catch (Exception)
            {
                throw new Exception("Usuario o contraseña incorrectos.");
            }



        }

        public bool IsUserLog()
        {
            return System.Web.HttpContext.Current.Session["usuarioIniciado"] != null;
        }

        [HttpPost]
        public void LogOut()
        {
            System.Web.HttpContext.Current.Session["usuarioIniciado"] = null;
            System.Web.HttpContext.Current.Session["terminalIniciado"] = null;
        }
    }
}