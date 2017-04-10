using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BIZ
{
    class Tarjeta
    {
        int _numero;

        public int Numero
        {
            get { return _numero; }
            set { _numero = value; }
        }
        enum Marcas { Visa, AmericanExpress, MasterCard }
        Marcas _marca;
        public Marcas Marca
        {
            get { return _marca; }
            set { _marca = value; }
        }

        enum Tipos { Titular, Adjunta }
        Tipos _tipo;

        public Tipos Tipo
        {
            get { return _tipo; }
            set { _tipo = value; }
        }

        int _saldoMax;

        public int SaldoMax
        {
            get { return _saldoMax; }
            set { _saldoMax = value; }
        }

#warning Es necesario poner si es local?;
        bool _local;

        public bool Local
        {
            get { return _local; }
            set { _local = value; }
        } 


    }
}
