using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
   public abstract class  DAOBase
    {
        public SL.ErrorLogger ErrorLogger { get { return new SL.ErrorLogger(); } }
        public SL.LogTrace Logger { get { return new SL.LogTrace(); } }

    }
}
