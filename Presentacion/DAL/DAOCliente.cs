using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data.Entity;

namespace DAL
{
    public class DAOCliente : DAOBase
    {
        private LPPAEntities _db = new LPPAEntities();
        public void AgregarCliente(DAL.Cliente cliente)
        {
            try
            {
                _db.Cliente.Add(cliente);
                _db.SaveChanges();
                Logger.Trace("DAL.AgregarCliente() -> se genero u nuevo cliente dni: " + cliente.DNI);

            }
            catch (Exception ex)
            {
                ErrorLogger.WriteErrorLog(ex.Message, ex.ToString());
                throw;
            }


        }

        public void ActualizarConyugeCliente(int? dniTitular, int nroDocumento)
        {
            try
            {
                Cliente cliente = new Cliente();

                cliente = _db.Cliente.Where(c => c.DNI == dniTitular).FirstOrDefault();

                if (cliente != null)
                {
                    cliente.DniConyuge = nroDocumento;
                    _db.Entry(cliente).State = EntityState.Modified;
                    _db.SaveChanges();
                    Logger.Trace("DAL.ActualizarConyugeCliente() -> se actualizo el conyuge del titular dni: " + dniTitular + " con dniConyuge: " + nroDocumento);
                }
                else
                {
                    throw new Exception("No se pudo encontrar el cliente");
                }
            }
            catch (Exception ex)
            {
                ErrorLogger.WriteErrorLog(ex.Message, ex.ToString());
                throw;
            }
        }

        public Cliente ObtenerPorDNI(int dni)
        {

            try
            {
                Cliente cliente = new Cliente();
                cliente = _db.Cliente.Where(c => c.DNI == dni).FirstOrDefault();
                Logger.Trace("DAL.ObtenerDNI() -> Se consulto el cliente dni: " + dni);
                return cliente;
            }
            catch (Exception ex)
            {
                ErrorLogger.WriteErrorLog(ex.Message, ex.ToString());
                throw;
            }


        }

    }
}
