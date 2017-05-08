angular.module('app').controller("SolicitudTarjetaExtensionController", ["$scope", "$location", function ($scope, $location) {
    $scope.TitularObtenido = false;
    $scope.NombreConyuge = "María Antonieta de las Nieves";
    $scope.DNIConyuge = "25.315.429";

    $scope.mostrarDatosConyuge = function () {
        $scope.TitularObtenido = true;
        
    }


}])