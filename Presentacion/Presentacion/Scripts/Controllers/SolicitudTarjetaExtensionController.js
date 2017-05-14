var fuckyoumom;
angular.module('app').controller("SolicitudTarjetaExtensionController", ["$scope", "$location", "SolicitudTarjetaExtensionService",
    function ($scope, $location, SolicitudTarjetaExtensionService) {
    $scope.TitularObtenido = false;
    $scope.nombreConyuge = "María Antonieta de las Nieves";
    $scope.dniConyuge = "25.315.429";
    //$scope.dniTitular = "24.425.236";
    //$scope.nombreTitular = "Juan Carlos García";

    $scope.mostrarDatosConyuge = function () {
        SolicitudTarjetaExtensionService.ObtenerClientePorDNI($scope.dniTitular).then(function (response) {

            if (response.data != "") {
                $scope.dniTitular = response.data.NroDocumento;
                $scope.nombreTitular = response.data.Nombre;
                fuckyoumom = response;
                console.log(response.data);
                console.log(response.data.NroDocumento);
                console.log(response.data.Nombre);
                $scope.TitularObtenido = true;
            }
            else {
                alert("No existe el dni ingresado.");
            }

        });
        
    }


}])