using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class DAOCliente
    {
        public BIZ.Cliente ObtenerClientePorDNI(int DNI)
        {
            List<BIZ.Cliente> lista = new List<BIZ.Cliente>();
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
    }
}
