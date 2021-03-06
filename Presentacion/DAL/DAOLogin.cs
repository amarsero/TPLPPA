﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class DAOLogin : DAOBase
    {
        public Empleado IniciarSesion(string usuario, string password)
        {
            try
            {
                Empleado Empleado = new Empleado();
                using (LPPAEntities BD = new LPPAEntities())
                {

                    Empleado = BD.Empleado.Where(a => a.LoginUser.Equals(usuario) && a.Password.Equals(password)).First();


                }

                return Empleado;
            }
            catch (Exception ex)
            {
                ErrorLogger.WriteErrorLog(ex.Message, ex.ToString());
                return null;
            }

        }

        public Terminal ObtenerTerminalEmpleado(int dni)
        {
            try
            {
                Terminal Terminal = new Terminal();
                using (LPPAEntities BD = new LPPAEntities())
                {

                    Terminal = BD.Terminal.Where(a => a.DNIEmpleado == dni).FirstOrDefault();


                }

                return Terminal;
            }
            catch (Exception ex)
            {
                ErrorLogger.WriteErrorLog(ex.Message, ex.ToString());
                return null;
            }
        }
    }
}
