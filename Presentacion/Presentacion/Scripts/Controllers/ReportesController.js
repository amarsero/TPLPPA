angular.module('app').controller("ReportesController", ["$scope", "$location", "ReportesService",
    function ($scope, $location, ReportesService) {
        

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