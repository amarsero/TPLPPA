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
        public void CrearCliente(int? CUIT,int? DniConyuge,string Domicilio, int? EstadoCivil, DateTime FechaNacimiento,
        int? IngresoMensualAprox,string Nombre,int? DNI,int? Sexo,int? SituacionLaboral,int? TipoDocumento,int? Banco)
        {
            BLL.BLLCliente bll = new BLL.BLLCliente();

            BIZ.Cliente Cliente = new BIZ.Cliente();
            ClienteMapper(CUIT, DniConyuge, Domicilio, EstadoCivil, FechaNacimiento, IngresoMensualAprox, Nombre, Sexo, SituacionLaboral, Banco, Cliente);

            bll.CrearCliente(Cliente);
        }

        private static void ClienteMapper(int? CUIT, int? DniConyuge, string Domicilio, int? EstadoCivil, DateTime FechaNacimiento, int? IngresoMensualAprox, string Nombre, int? Sexo, int? SituacionLaboral, int? Banco, BIZ.Cliente Cliente)
        {
            Cliente.Banco = (BIZ.Cliente.Bancos)Banco;
            Cliente.Cuit = (int)CUIT;
            Cliente.DniConyugue = DniConyuge;
            Cliente.Domicilio = Domicilio;
            Cliente.EstadoCivil = (BIZ.Cliente.EstadosCiviles)EstadoCivil;
            Cliente.FechaNac = FechaNacimiento;
            Cliente.IngresosMensualesAprox = IngresoMensualAprox;
            Cliente.Nombre = Nombre;
            Cliente.Sexo = (BIZ.Cliente.Sexos)Sexo;
            Cliente.SituacionLaboral = (BIZ.Cliente.SituacionesLaborales)SituacionLaboral;
            Cliente.TipoDocumento = 0;
        }
    }
}