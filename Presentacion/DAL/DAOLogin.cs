using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class DAOLogin
    {
        public Empleado IniciarSesion(string usuario,string password)
        {
            using (LPPAEntities BD = new LPPAEntities())
            {
                Empleado Empleado = new Empleado();
                Empleado = BD.Empleado.Where(a => a.LoginUser.Equals(usuario) && a.Password.Equals(password)).First();

                return Empleado;
            }
        }
    }
}
