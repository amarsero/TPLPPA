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

        public Tarjeta[] ObtenerTarjetas()
        {
            DAL.DAOTarjeta dao = new DAL.DAOTarjeta();
            DAL.Tarjeta[] listadal = dao.ObtenerTarjetas();
            Tarjeta[] tarjetas = new Tarjeta[listadal.Length];

            for (int i = 0; i < listadal.Length; i++)
            {
                tarjetas[i] = Mapper.Map(listadal[i]);
            }

            return tarjetas;
        }
    }
}
