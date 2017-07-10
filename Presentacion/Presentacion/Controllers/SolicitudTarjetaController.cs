using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Drawing;
using System.IO;

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
        public void CrearCliente(int? CUIT, int? DniConyuge, string Domicilio, int? EstadoCivil, DateTime FechaNacimiento,
        int? IngresoMensualAprox, string Nombre, int? DNI, int? Sexo, int? SituacionLaboral, int? TipoDocumento, int? Banco, int? dniTitular)
        {
            try
            {
                BLL.BLLCliente bll = new BLL.BLLCliente();

                BIZ.Cliente Cliente = new BIZ.Cliente();
                ClienteMapper(CUIT, DniConyuge, Domicilio, EstadoCivil, DNI, FechaNacimiento, IngresoMensualAprox, Nombre, Sexo, SituacionLaboral, Banco, Cliente);

                if (dniTitular == null)
                {
                    bll.CrearClienteTitular(Cliente);
                }
                else
                {
                    bll.CrearClienteConyuge(Cliente, dniTitular);
                }

            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }

        }

        [HttpPost]
        public void SubirImagen(string foto, string path)
        {
            try
            {
                BLL.BLLCliente bll = new BLL.BLLCliente();
                bll.SubirImagen(foto, path);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }

        }
        private static void ClienteMapper(int? CUIT, int? DniConyuge, string Domicilio, int? EstadoCivil, int? DNI, DateTime FechaNacimiento, int? IngresoMensualAprox, string Nombre, int? Sexo, int? SituacionLaboral, int? Banco, BIZ.Cliente Cliente)
        {
            Cliente.Banco = (BIZ.Cliente.Bancos)Banco;
            Cliente.NroDocumento = (int)DNI;
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