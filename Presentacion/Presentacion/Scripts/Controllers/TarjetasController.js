angular.module('app').controller("TarjetasController", ["$scope", "$location", "TarjetasService", "LoginService",
    function ($scope, $location, TarjetasService, LoginService) {

        var VerificarLogin = function () {
            LoginService.IsUserLog().then(
                function (d) {
                    if (d.data == "False") {
                        $location.path("/login");
                    }
                },
                function (error) {

                    $scope.Titulo = "Error";

                }
            );
        }

        VerificarLogin();

        $scope.ListaTarjetas;

        $scope.ObtenerTarjetas = function () {
            TarjetasService.ObtenerTarjetas().then(function (response) {
                console.log(response.data);
                $scope.ListaTarjetas = response.data;
            },
                    function (error) {
                       
                    }

                );
        }

        $scope.ObtenerTarjetas();


        $scope.ObtenerMarca = function (num) {
            switch (num) {
                case 0:
                    return "Visa";
                    break;
                case 1:
                    return "AmericanExpress";
                    break;
                case 2:
                    return "MasterCard";
                    break;
            }
        }
        $scope.ObtenerTipo = function (num) {
            if (num == 0) return "Titular";
            return "Adjunta";
        }

        $scope.Buscar = function () {
            var resultado = [];
            for (var i = 0; i < $scope.ListaTarjetas.length; i++) {
                var cumplemarca = false;
                var cumplesaldo = false;
                

                if ($scope.FiltroMarca > 0) {
                    if ($scope.ListaTarjetas[i].Marca == $scope.FiltroMarca){
                        cumplemarca = true;
                    }

                } else {
                    cumplemarca = true;
                }

                if ($scope.FiltroSaldo > 0) {
                    if ($scope.ListaTarjetas[i].SaldoMax <= $scope.FiltroSaldo) {
                        cumplesaldo = true;
                    }

                } else {
                    cumplesaldo = true;
                }

                if (cumplemarca == true && cumplesaldo == true){
                    resultado.push($scope.ListaTarjetas[i]);
                }

            }

            $scope.ListaTarjetas = resultado;

        }

    }]);