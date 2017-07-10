angular.module('app').controller("ReportesController", ["$scope", "$location", "ReportesService","LoginService",
    function ($scope, $location, ReportesService,LoginService) {

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

        $scope.ReporteCantidadDePatosEnAustraliaPorMes = function()
        {
            ReportesService.ReporteCantidadDePatosEnAustraliaPorMes().then(function (response) {
                console.log(response.data);
                eval(response.data);
            },
                    function (error) {
                        alert("wow la cagamo");
                    }

                );
        }

    }])