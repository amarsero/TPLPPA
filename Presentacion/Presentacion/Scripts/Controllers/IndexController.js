angular.module('app').controller("IndexController", ["$scope", "$location", "TarjetasService", "LoginService",
    function ($scope, $location, TarjetasService, LoginService) {
    $scope.Titulo = "Sistema de gestion de tarjetas de credito";
    $scope.VerTitulo = true;

    $scope.VerClientes = function () {
        TarjetasService.ObtenerClientes().then(function (response) {
            $scope.ListaClientes = response.data;
        },
            function (error) {

            }

        );
    }

   $scope.VerClientes();
    }]);
