using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BIZ;

namespace BLL
{
    public class BLLTarjeta
    {
        public void CrearTarjeta(Tarjeta tarjeta,int dni)
        {

            DAL.DAOTarjeta dao = new DAL.DAOTarjeta();
            DAL.DAOCliente cdao = new DAL.DAOCliente();
            tarjeta.m_Cliente = Mapper.Map(cdao.ObtenerPorDNI(dni));

            DAL.Tarjeta tarjetita = Mapper.Map(tarjeta);

            dao.AgregarTarjeta(tarjetita);
        }
    }
}
