﻿angular.module("app").factory("SolicitudTarjetaService", function ($http, $q) {

    var service = {};

    //Este servicio va al servidor, por GET al LoginController
    service.CrearCliente = function (CUIT, DniConyuge, Domicilio, EstadoCivil, FechaNacimiento,
        IngresoMensualAprox, Nombre, DNI, Sexo, SituacionLaboral, TipoDocumento, Banco, dniTitular) {
        var promise = $http({
            method: 'post',
            url: '/SolicitudTarjeta/CrearCliente',
            data: {
                CUIT: CUIT, DniConyuge: DniConyuge, Domicilio: Domicilio, EstadoCivil: EstadoCivil, FechaNacimiento: FechaNacimiento,
                IngresoMensualAprox: IngresoMensualAprox, Nombre: Nombre, DNI: DNI, Sexo: Sexo, SituacionLaboral: SituacionLaboral, TipoDocumento: TipoDocumento, Banco: Banco, dniTitular: dniTitular}
        });

        return $q.when(promise);

    };
    service.SubirFoto = function (foto, path) {
        var promise = $http({
            method: 'POST',
            url: '/SolicitudTarjeta/SubirImagen',
            data: '{ "foto" : "' + foto.substring(22) + '" , "path" :  "' + path + '"  }'
        });

        return $q.when(promise);

    };

    return service;
});