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
    service.ObtenerImagen = function (path) {
        var promise = $http({
            method: 'get',
            url: '/SolicitudTarjetaExtension/ObtenerImagen',
            params: { path: path }
        });
        
        return $q.when(promise);

    };
    service.NuevaTarjeta = function (tarjeta) {
        var promise = $http({
            method: 'post',
            url: '/SolicitudTarjetaExtension/NuevaTarjeta',
            data: { tarjeta: tarjeta }
        });

        return $q.when(promise);

    }; 

    return service;
});