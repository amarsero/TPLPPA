angular.module("app").factory("SolicitudTarjetaService", function ($http, $q) {

    var service = {};

    //Este servicio va al servidor, por GET al LoginController
    service.CrearCliente = function (nombre,dni) {
        var promise = $http({
            method: 'post',
            url: '/SolicitudTarjeta/CrearCliente',
            params: { nombre: nombre, dni: dni }
        });

        return $q.when(promise);

    };

    return service;
});