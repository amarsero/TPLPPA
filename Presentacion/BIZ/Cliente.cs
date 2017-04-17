///////////////////////////////////////////////////////////
//  Cliente.cs
//  Implementation of the Class Cliente
//  Generated by Enterprise Architect
//  Created on:      17-abr-2017 10:09:17
//  Original author: arigos
///////////////////////////////////////////////////////////




using System.Collections.Generic;

namespace BIZ {
	public class Cliente {

		public enum tiposDocumentos : int {

			DNI,
			CI,
			LC,
			LD

		}//end tiposDocumentos

		/// <summary>
		/// end tiposDocumentos
		/// </summary>
		public enum Sexos : int {

			Femenino,
			Masculino

		}//end Sexos

		/// <summary>
		/// end Sexos
		/// </summary>
		public enum EstadosCiviles : int {

			Soltero,
			Casado,
			Divorciado,
			Viudo

		}//end EstadosCiviles

		/// <summary>
		/// end EstadosCiviles
		/// </summary>
		public enum SituacionesLaborales : int {

			Empleado,
			Desempleado

		}//end SituacionesLaborales

		/// <summary>
		/// end SituacionesLaborales
		/// </summary>
		private List<string> _bancos;
		private uint _cuit;
		private uint _dniConyugue;
		private string _domicilio;
		private Cliente.EstadosCiviles _estadoCivil;
		private System.DateTime _fechaNac;
		private float _ingresosMensualesAprox;
		private string _nombre;
		private uint _nroDocumento;
		private Cliente.Sexos _sexo;
		private Cliente.SituacionesLaborales _situacionLaboral;
		private Cliente.tiposDocumentos _tipoDocumento;

		public Cliente(){

		}

		~Cliente(){

		}

		public List<string> Bancos{
			get;
			set;
		}

		public uint Cuit{
			get;
			set;
		}

		public string Domicilio{
			get;
			set;
		}

		public EstadosCiviles EstadoCivil{
			get;
			set;
		}

		public System.DateTime FechaNac {
			get;
			set;
		}

		public float IngresosMensualesAprox{
			get;
			set;
		}

		public string Nombre{
			get;
			set;
		}

		public uint NroDocumento{
			get;
			set;
		}

		public string RutaImg{
			get;
			set;
		}

		public Sexos Sexo{
			get;
			set;
		}

		public SituacionesLaborales SituacionLaboral{
			get;
			set;
		}

		public tiposDocumentos TipoDocumento{
			get;
			set;
		}

	}//end Cliente

}//end namespace BIZ