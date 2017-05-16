using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class DAOCliente
    {
        static List<BIZ.Cliente> lista = new List<BIZ.Cliente>();
        public BIZ.Cliente ObtenerClientePorDNI(int DNI)
        {

            lista.Add(new BIZ.Cliente() { Nombre = "Esteban Quito", NroDocumento = 12345678 });
            for (int i = 0; i < lista.Count; i++)
            {
                if (lista[i].NroDocumento == DNI)
                {
                    return lista[i];
                }
            }

            return null;

        }

        public void CrearCliente(string nombre, int dni)
        {
            lista.Add(new BIZ.Cliente() { Nombre = nombre, NroDocumento = (uint)dni });
        }
    }
}
