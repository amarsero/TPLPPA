using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;

namespace BLL
{
    public class BLLHistoricoSolicitudTarjeta
    {
        public HistoricoSolicitudTarjetas[] ObtenerHistoricoSolicitudTarjetas()
        {
            DAOHistoricoSolicitudTarjetas dao = new DAOHistoricoSolicitudTarjetas();

            return dao.ObtenerHistoricoSolicitudTarjetas();
        }

        public Tuple<string, int>[] ObtenerHistoricoSolicitudTarjetasPorEmpleado()
        {
            DAOHistoricoSolicitudTarjetas dao = new DAOHistoricoSolicitudTarjetas();

            return dao.ObtenerHistoricoSolicitudTarjetasPorEmpleado();
        }

        public Tuple<int, int>[] ObtenerHistoricoSolicitudTarjetasPorAño()
        {
            DAOHistoricoSolicitudTarjetas dao = new DAOHistoricoSolicitudTarjetas();

            return dao.ObtenerHistoricoSolicitudTarjetasPorAño();
        }
    }
}
