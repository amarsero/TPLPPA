using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace DAL
{
    public class Conexion
    {

        static SqlConnection _instancia;

        static string getConnectionString()
        {
            return String.Format("workstation id=LPPADATABASE.mssql.somee.com;packet size=4096;user id=aguseselmejor_SQLLogin_1;pwd=8lwwo9oaox;data source=LPPADATABASE.mssql.somee.com;persist security info=False;initial catalog=LPPADATABASE");
        }

        public static SqlConnection Instancia
        {
            get
            {
                if (_instancia == null) _instancia = new SqlConnection(getConnectionString());
                return _instancia;
            }
        }
    }
}
