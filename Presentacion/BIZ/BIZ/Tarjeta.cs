///////////////////////////////////////////////////////////
//  Tarjeta.cs
//  Implementation of the Class Tarjeta
//  Generated by Enterprise Architect
//  Created on:      08-may-2017 14:40:37
//  Original author: arigos
///////////////////////////////////////////////////////////




using BIZ;
namespace BIZ {
	public class Tarjeta {

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
		public List<BIZ.Tarjeta> Extensiones;
		public BIZ.Cliente m_Cliente;
		public BIZ.EstadoTarjeta m_EstadoTarjeta;

		public Tarjeta(){

		}

		~Tarjeta(){

		}

		public Marcas Marca{
			get;
			set;
		}

		public int Numero{
			get;
			set;
		}

		public int SaldoMax{
			get;
			set;
		}

		public Tipos Tipo{
			get;
			set;
		}

	}//end Tarjeta

}//end namespace BIZ