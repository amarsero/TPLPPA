///////////////////////////////////////////////////////////
//  ImpresoraSingleton.cs
//  Implementation of the Class ImpresoraSingleton
//  Generated by Enterprise Architect
//  Created on:      17-abr-2017 10:09:18
//  Original author: arigos
///////////////////////////////////////////////////////////




namespace BIZ {
	public class ImpresoraSingleton {

		private int _StockPapel;

		public ImpresoraSingleton(){

		}

		~ImpresoraSingleton(){

		}

		/// 
		/// <param name="tarjetaImprimir"></param>
		public void ImprimirTarjeta(Tarjeta tarjetaImprimir){

		}

		public int StockPapel{
			get{
				return _StockPapel;
			}
			set{
				_StockPapel = value;
			}
		}

	}//end ImpresoraSingleton

}//end namespace BIZ