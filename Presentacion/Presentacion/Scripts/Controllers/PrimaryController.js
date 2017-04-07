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

        .otherwise({
            redirectTo: '/'
        });
});

app.controller("IndexController", function ($scope) {
    $scope.Titulo = "Aplicacion del banco";
});
