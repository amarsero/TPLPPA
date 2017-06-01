using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace UnitTest
{

    [TestClass]
    public class UnitTest1
    {
        [TestMethod]
        public void ProbarBaseDeDatosExterna()
        {
            DAL.DAOCliente dao = new DAL.DAOCliente();
            dao.AgregarCliente(new BIZ.Cliente());
            var resultado = dao.ObtenerPorDNI(12311312);
            Assert.AreEqual(resultado.DNI, 12311312);
        }

    }
}
