///////////////////////////////////////////////////////////
//  Cliente.cs
//  Implementation of the Class Cliente
//  Generated by Enterprise Architect
//  Created on:      17-abr-2017 10:09:17
//  Original author: arigos
///////////////////////////////////////////////////////////




using System.Collections.Generic;
using System.Runtime.Serialization;
using System.IO;

namespace BIZ
{
    [DataContract]
    public class Cliente : EntityBase
    {

        public enum TiposDocumentos : int
        {

            DNI,
            CI,
            LC,
            LD

        }//end tiposDocumentos

        /// <summary>
        /// end tiposDocumentos
        /// </summary>
        public enum Sexos : int
        {

            Femenino,
            Masculino

        }//end Sexos

        /// <summary>
        /// end Sexos
        /// </summary>
        public enum EstadosCiviles : int
        {

            Soltero,
            Casado,
            Divorciado,
            Viudo

        }//end EstadosCiviles

        public enum Bancos : int
        {
            HSBC,
            SANTANDER,
            CITI,
            GALICIA
        }

        /// <summary>
        /// end EstadosCiviles
        /// </summary>
        public enum SituacionesLaborales : int
        {

            Empleado,
            Desempleado

        }//end SituacionesLaborales

        /// <summary>
        /// end SituacionesLaborales
        /// </summary>
        private int _cuit;
        private int? _dniConyugue;

        public int? DniConyugue
        {
            get { return _dniConyugue; }
            set { _dniConyugue = value; }
        }
        private string _domicilio;
        private Cliente.EstadosCiviles _estadoCivil;
        private System.DateTime _fechaNac;
        private int? _ingresosMensualesAprox;
        private string _nombre;
        private int _nroDocumento;
        private Cliente.Sexos _sexo;
        private Cliente.SituacionesLaborales _situacionLaboral;
        private Cliente.TiposDocumentos _tipoDocumento;

        public Cliente()
        {

        }

        ~Cliente()
        {

        }


        [DataMember]
        public int Cuit
        {
            get;
            set;
        }
        [DataMember]
        public string Domicilio
        {
            get;
            set;
        }
        [DataMember]
        public EstadosCiviles EstadoCivil
        {
            get;
            set;
        }
        [DataMember]
        public System.DateTime FechaNac
        {
            get;
            set;
        }
        [DataMember]
        public int? IngresosMensualesAprox
        {
            get;
            set;
        }
        [DataMember]
        public string Nombre
        {
            get;
            set;
        }
        [DataMember]
        public int NroDocumento
        {
            get;
            set;
        }
        [DataMember]
        public string RutaImg
        {
            
            get
            {
                string rutaimg = ".../Presentacion/FotosUsuarios/" + Nombre + NroDocumento.ToString() + ".png";
                if (File.Exists(rutaimg))
                {
                    return Nombre + NroDocumento.ToString() + ".png";

                }else{
                    return "Default.png";
                }
            }
           
        }
        [DataMember]
        public Sexos Sexo
        {
            get;
            set;
        }
        [DataMember]
        public SituacionesLaborales SituacionLaboral
        {
            get;
            set;
        }
        [DataMember]
        public TiposDocumentos TipoDocumento
        {
            get;
            set;
        }
        [DataMember]
        public string Email { get; set; }
        [DataMember]
        public Bancos Banco
        {
            get;
            set;
        }
    }//end Cliente

}//end namespace BIZ