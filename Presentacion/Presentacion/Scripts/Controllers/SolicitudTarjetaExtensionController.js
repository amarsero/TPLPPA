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
            fuckyoumom = response;
            console.log(response.data);
            if (response.data[0].Nombre == null)
                alert("No existe el dni ingresado.");
            else if (response.data[0].dniConyuge == null) {
                alert("El cliente " + response.data[0].Nombre + " no tiene un conyuge registrado.");
            }
            else {
                $scope.dniTitular = response.data[0].NroDocumento;
                $scope.nombreTitular = response.data[0].Nombre;
                $scope.nombreConyuge = response.data[1].Nombre;
                $scope.dniConyuge = response.data[1].NroDocumento;
                $scope.TitularObtenido = true;
            }

        });
        
    }


}])