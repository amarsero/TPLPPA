﻿var app = angular.module("app", ['ngRoute']);

// =====================================
// configure the route navigation
// =====================================
app.config(function ($routeProvider) {
    $routeProvider
        
        .when('/login',
        {
            templateUrl: 'login.html',
            controller: 'LoginController'
        })

        .when('/solicitudtarjeta',
        {
            templateUrl: 'SolicitudTarjeta.html',
            controller: 'SolicitudTarjetaController'
        })

        .when('/solicitudtarjetaextension',
        {
            templateUrl: 'SolicitudTarjetaExtension.html',
            controller: 'SolicitudTarjetaExtensionController'
        })

        .otherwise({
            redirectTo: '/'
        });
});

