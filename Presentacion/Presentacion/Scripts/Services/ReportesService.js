angular.module("app").factory("ReportesService", function ($http, $q) {

    var service = {};

    //Este servicio va al servidor, por GET al LoginController
    service.ReporteCantidadDePatosEnAustraliaPorMes = function () {
        var promise = $http({
            method: 'GET',
            url: '/Reportes/ReporteCantidadDePatosEnAustraliaPorMes'
            });

        return $q.when(promise);

    };
    service.SubirFoto = function (foto, path) {
        var promise = $http({
            method: 'POST',
            url: '/Reportes/SubirImagen',
            data: '{ "foto" : "' + foto.substring(22) + '" , "path" :  "' + path + '"  }'
        });

        return $q.when(promise);

    };

    return service;
});