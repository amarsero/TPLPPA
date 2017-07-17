angular.module("app").factory("TarjetasService", function ($http, $q) {

    var service = {};

    service.ObtenerTarjetas = function (skip) {
        var promise = $http({
            method: 'GET',
            url: '/Tarjetas/ObtenerTarjetas',
            params: { skip: skip }
        });

        return $q.when(promise);

    };

    service.ObtenerClientes = function (skip) {
        var promise = $http({
            method: 'GET',
            url: '/Tarjetas/ObtenerClientes',
            params: {skip: skip}
        });

        return $q.when(promise);

    };

    return service;
});