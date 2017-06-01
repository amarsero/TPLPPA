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

            return Mapper.Map(dao.ObtenerPorDNI(dni));

            //return ClienteMapper.Map(dao.ObtenerPorDNI(dni));
        }
        public void CrearCliente(Cliente cliente)
        {

            DAL.DAOCliente dao = new DAL.DAOCliente();

            
            dao.AgregarCliente(cliente);
        }
    }
}
