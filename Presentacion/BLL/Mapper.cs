﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;

namespace BLL
{
    public static class Mapper
    {
        public static BIZ.Cliente Map(DAL.Cliente viejo)
        {
            BIZ.Cliente nuevo = new BIZ.Cliente();

            nuevo.Cuit = viejo.CUIT;
            nuevo.DniConyugue = viejo.DniConyuge;
            nuevo.Domicilio = viejo.Domicilio;
            nuevo.EstadoCivil = (BIZ.Cliente.EstadosCiviles)viejo.EstadoCivil;
            nuevo.FechaNac = viejo.FechaNacimiento;
            nuevo.IngresosMensualesAprox = viejo.IngresoMesualAprox;
            nuevo.Nombre = viejo.Nombre;
            nuevo.NroDocumento = viejo.DNI;
            nuevo.Sexo = (BIZ.Cliente.Sexos)viejo.Sexo;
            nuevo.SituacionLaboral = (BIZ.Cliente.SituacionesLaborales)viejo.SituacionLaboral;
            nuevo.TipoDocumento = (BIZ.Cliente.TiposDocumentos)viejo.TipoDocumento;

            return nuevo;
        }
    }
}