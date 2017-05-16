using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class BLLLogin
    {
        DAL.DAOLogin loginDAL = new DAL.DAOLogin();

        public BIZ.Empleado IniciarSesion(string usuario,string password)
        {
            DAL.Empleado Empleado = new DAL.Empleado();
            Empleado = loginDAL.IniciarSesion(usuario,password);

            BIZ.Empleado Retorno = new BIZ.Empleado();

            Retorno.LoginUser = Empleado.LoginUser;
            Retorno.Password = Empleado.Password;
            Retorno.Nombre = Empleado.Nombre;

            return Retorno;
        }
    }
}
