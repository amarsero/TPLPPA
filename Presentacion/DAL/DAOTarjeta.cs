using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class DAOTarjeta
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
                throw new Exception("Error al coenctare a la base de datos");
            }


        }

       
    }
}
