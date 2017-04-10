using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BIZ
{
    class Cliente
    {
        enum tiposDocumentos
        {
            DNI, CI, LC, LD
        };

        private tiposDocumentos _tipoDocumento;
        public tiposDocumentos TipoDocumento
        {
            get { return _tipoDocumento; }
            set { _tipoDocumento = value; }
        }
        
        uint _nroDocumento;
        public uint NroDocumento
        {
            get { return _nroDocumento; }
            set { _nroDocumento = value; }
        }

        string _nombre;
        public string Nombre
        {
            get { return _nombre; }
            set { _nombre = value; }
        }

        DateTime _fechaNac;
        public DateTime FechaNac
        {
            get { return _fechaNac; }
            set { _fechaNac = value; }
        }

        enum Sexos { Femenino, Masculino };
        Sexos _sexo;
        public Sexos Sexo
        {
            get { return _sexo; }
            set { _sexo = value; }
        }

        enum EstadosCiviles { Soltero, Casado, Divorciado, Viudo}
        EstadosCiviles _estadoCivil;
        public EstadosCiviles EstadoCivil
        {
            get { return _estadoCivil; }
            set { _estadoCivil = value; }
        }

        string _domicilio;
        public string Domicilio
        {
            get { return _domicilio; }
            set { _domicilio = value; }
        }

        uint _cuit;
        public uint Cuit
        {
            get { return _cuit; }
            set { _cuit = value; }
        }

        enum SituacionesLaborales { Empleado, Desempleado}
        SituacionesLaborales _situacionLaboral;

        public SituacionesLaborales SituacionLaboral
        {
            get { return _situacionLaboral; }
            set { _situacionLaboral = value; }
        }

        float _ingresosMensualesAprox;

        public float IngresosMensualesAprox
        {
            get { return _ingresosMensualesAprox; }
            set { _ingresosMensualesAprox = value; }
        }

        List<string> _bancos;

        public List<string> Bancos
        {
            get { return _bancos; }
            set { _bancos = value; }
        }

        uint _dniConyugue;

    }
}
