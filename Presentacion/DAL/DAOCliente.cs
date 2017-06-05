using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;


namespace DAL
{
    public class DAOCliente
    {
        private LPPAEntities _db = new LPPAEntities();
        public void AgregarCliente(DAL.Cliente cliente)
        {
            try
            {
            //Cliente Insert = new Cliente();
            //Insert.Nombre = "Gonzalo";
            //Insert.DNI = 12311312;
            //    Insert.CUIT = 23321232;
            //    Insert.Domicilio="Calle falsa";
            //    Insert.EstadoCivil = 1;
            //    Insert.FechaNacimiento = DateTime.Now;
            //    Insert.IngresoMesualAprox = 1231;
            //    Insert.Sexo = 1;
            //    Insert.SituacionLaboral = 1;
            //    Insert.Tarjeta = new List<Tarjeta>();
            //    Insert.Tarjeta.Add(new Tarjeta());
            //    Insert.TipoDocumento = 1;
               



            _db.Cliente.Add(cliente);
            _db.SaveChanges();

            }
            catch (Exception ex)
            {

            }
            

        }

        public Cliente ObtenerPorDNI(int dni)
        {
            
            try
            {

                return _db.Cliente.Where(c => c.DNI == dni).FirstOrDefault();

            }
            catch (Exception)
            {

                throw;
            }


        }

    }
}
