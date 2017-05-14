angular.module("app").factory("SolicitudTarjetaExtensionService", function ($http, $q) {

    var service = {};

    //Este servicio va al servidor, por GET al LoginController
    service.ObtenerClientePorDNI = function (dni) {
        var promise = $http({
            method: 'get',
            url: '/SolicitudTarjetaExtension/ObtenerClientePorDNI',
            params: { dni: dni }
        });

        return $q.when(promise);

    };

    return service;
});