var app = angular.module("app", ['ngRoute']);

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

        .otherwise({
            redirectTo: '/'
        });
});

app.controller("IndexController", function ($scope) {
    $scope.Titulo = "Aplicacion de agustin";
    $scope.VerTitulo = true;
});
