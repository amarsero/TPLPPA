///////////////////////////////////////////////////////////
//  Empleado.cs
//  Implementation of the Class Empleado
//  Generated by Enterprise Architect
//  Created on:      17-abr-2017 10:09:18
//  Original author: arigos
///////////////////////////////////////////////////////////




using System;
using System.Collections.Generic;

namespace BIZ {
	public class Empleado {

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Empleado()
        {
            this.Terminal = new HashSet<Terminal>();
        }

        public int DNI { get; set; }
        public string Nombre { get; set; }
        public string LoginUser { get; set; }
        public string Password { get; set; }
        public Nullable<int> Sexo { get; set; }
        public Nullable<int> TipoDocumento { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Terminal> Terminal { get; set; }
    }//end Empleado

}//end namespace BIZ