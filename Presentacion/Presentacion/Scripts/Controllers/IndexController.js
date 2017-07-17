angular.module('app').controller("IndexController", ["$scope", "$location", "TarjetasService", "LoginService",
    function ($scope, $location, TarjetasService, LoginService) {
        $scope.Titulo = "Sistema de gestion de tarjetas de credito";
        $scope.VerTitulo = true;
        $scope.skip = 0;
        $scope.ListaClientes = [];
        $scope.VerClientes = function () {
            TarjetasService.ObtenerClientes($scope.skip).then(function (response) {
                if ($scope.ListaClientes.length > 0) {

                    for (var i = 0; i < response.data.length; i++) {
                        $scope.ListaClientes.push(response.data[i]);
                    }

                } else {
                    $scope.ListaClientes = response.data;
                }

            },
                function (error) {

                }

            );
        }

        $scope.VerMas = function () {
            $scope.skip = $scope.skip + 9;
            $scope.VerClientes();
        }

        $scope.VerClientes();
    }]);
