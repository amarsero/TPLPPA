///////////////////////////////////////////////////////////
//  Terminal.cs
//  Implementation of the Class Terminal
//  Generated by Enterprise Architect
//  Created on:      17-abr-2017 10:09:18
//  Original author: arigos
///////////////////////////////////////////////////////////




using BIZ;
namespace BIZ {
	/// <summary>
	/// Pc de escritorio de la sucursal donde se va a realizar la impresion de las
	/// tarjetas.
	/// </summary>
	public class Terminal {

		public string _Descripcion;
		public BIZ.Empleado m_Empleado;
		public BIZ.ImpresoraSingleton m_ImpresoraSingleton;

		public Terminal(){

		}

		~Terminal(){

		}

		public string Descripcion{
			get{
				return _Descripcion;
			}
			set{
				_Descripcion = value;
			}
		}

		/// 
		/// <param name="tajetaImprimir"></param>
		public void ImprimirTarjeta(Tarjeta tajetaImprimir){

		}

	}//end Terminal

}//end namespace BIZ