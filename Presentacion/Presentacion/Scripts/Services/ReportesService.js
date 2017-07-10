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
    
    service.ReporteTarjetasPorEmpleado = function () {
        var promise = $http({
            method: 'GET',
            url: '/Reportes/ReporteTarjetasPorEmpleado'
        });

        return $q.when(promise);

    };

    return service;
});