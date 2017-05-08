///////////////////////////////////////////////////////////
//  Tarjeta.cs
//  Implementation of the Class Tarjeta
//  Generated by Enterprise Architect
//  Created on:      17-abr-2017 10:09:18
//  Original author: arigos
///////////////////////////////////////////////////////////




using BIZ;
using System.Collections.Generic;
using System.Runtime.Serialization;

namespace BIZ {
    [DataContract]
	public class Tarjeta : EntityBase{

		public enum Marcas : int {

			Visa,
			AmericanExpress,
			MasterCard

		}//end Marcas

		/// <summary>
		/// end Marcas
		/// </summary>
		public enum Tipos : int {

			Titular,
			Adjunta

		}//end Tipos

		/// <summary>
		/// end Tipos
		/// </summary>
		private Tarjeta.Marcas _marca;
		private int _numero;
		private int _saldoMax;
		private Tarjeta.Tipos _tipo;

		public BIZ.Tarjeta Extensiones;
		public BIZ.Cliente m_Cliente;
		public BIZ.EstadoTarjeta m_EstadoTarjeta;

		public Tarjeta(){

		}

		~Tarjeta(){

		}
        [DataMember]
		public Marcas Marca{
			get;
			set;
		}
        [DataMember]
		public int Numero{
			get;
			set;
		}
        [DataMember]
		public int SaldoMax{
			get;
			set;
		}
        [DataMember]
		public Tipos Tipo{
			get;
			set;
		}

	}//end Tarjeta

}//end namespace BIZ