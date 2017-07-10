﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class DAOHistoricoSolicitudTarjetas : DAOBase
    {
        private LPPAEntities _db = new LPPAEntities();
        public HistoricoSolicitudTarjetas[] ObtenerHistoricoSolicitudTarjetas()
        {
            HistoricoSolicitudTarjetas[] hist = null;
            try
            {
                hist = _db.HistoricoSolicitudTarjetas.ToArray();
                Logger.Trace("DAL.ObtenerHistoricoSolicitudTarjetas() -> se obtuvo el historio de tarjetas");
            }
            catch (Exception ex)
            {
                ErrorLogger.WriteErrorLog(ex.Message, ex.ToString());
                throw;
            }
            return hist;
        }

        public Tuple<string,int>[] ObtenerHistoricoSolicitudTarjetasPorEmpleado()
        {
            Tuple<string, int>[] hist = null;
            try
            {
                hist = _db.HistoricoSolicitudTarjetas.GroupBy(e => e.Terminal.Empleado)
                    .Select(x => new
                    {
                        nombre = x.Select(f => f.Terminal.Empleado.Nombre).FirstOrDefault(),
                        cant = x.Count()
                    }).AsEnumerable()
                    .Select(x => Tuple.Create
                        (x.nombre, x.cant )
                        ).ToArray();
                Logger.Trace("DAL.ObtenerHistoricoSolicitudTarjetas() -> se obtuvo el historio de tarjetas");
            }
            catch (Exception ex)
            {
                ErrorLogger.WriteErrorLog(ex.Message, ex.ToString());
                throw;
            }
            return hist;
        }
    }
}
