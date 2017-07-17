using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class DAOTarjeta : DAOBase
    {

        private LPPAEntities _db = new LPPAEntities();
        public void AgregarTarjeta(DAL.Tarjeta tarjeta)
        {
            try
            {
                _db.Tarjeta.Add(tarjeta);
                _db.Entry(tarjeta.Cliente).State = System.Data.Entity.EntityState.Modified;
                _db.SaveChanges();
            }
            catch (Exception ex)
            {
                ErrorLogger.WriteErrorLog(ex.Message, ex.ToString());
            }
        }

        public Tarjeta[] ObtenerTarjetas(int skip)
        {
            try
            {
                return _db.Tarjeta.OrderBy(i=> i.DNICliente).Skip(skip).Take(20).ToArray();
            }
            catch (Exception ex)
            {
                ErrorLogger.WriteErrorLog(ex.Message, ex.ToString());
            }
            return null;
        }
    }
}
