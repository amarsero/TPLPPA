﻿angular.module("app").factory("TarjetasService", function ($http, $q) {

    var service = {};

    service.ObtenerTarjetas = function () {
        var promise = $http({
            method: 'GET',
            url: '/Tarjetas/ObtenerTarjetas'
        });

        return $q.when(promise);

    };

    service.ObtenerClientes = function () {
        var promise = $http({
            method: 'GET',
            url: '/Tarjetas/ObtenerClientes'
        });

        return $q.when(promise);

    };

    return service;
});