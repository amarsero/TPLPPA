using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BIZ;

namespace BLL
{
    public class BLLCliente
    {
        public Cliente ObtenerClientePorDNI(int dni)
        {
            DAL.DAOCliente dao = new DAL.DAOCliente();

            return dao.ObtenerClientePorDNI(dni);
        }
        public void CrearCliente(string nombre, int dni)
        {

            DAL.DAOCliente dao = new DAL.DAOCliente();

            dao.CrearCliente(nombre,dni);
        }
    }
}
