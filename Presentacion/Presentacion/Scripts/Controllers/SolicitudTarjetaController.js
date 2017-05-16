angular.module('app').controller("SolicitudTarjetaController", ["$scope", "$location", "SolicitudTarjetaService",
    function ($scope, $location, SolicitudTarjetaService) {
    $scope.Procesando = false;
    $scope.Titulo = "Datos del nuevo cliente, solicitud nueva tarjeta.";
    $scope.estados = ["Soltero", "Casado", "Divorciado","Otro"];

    $scope.verificarEstadoCivil = function () {
        if ($scope.estadoSeleccionado == "2") {
            $scope.datosConyuge = true;
        } else {
            $scope.datosConyuge = false;
        }
    }
  
    $scope.ProcesarSolicitud = function () {
        SolicitudTarjetaService.CrearCliente($scope.nombreTitular, $scope.dniTitular);
        $scope.Procesando = true;
        $scope.Tarea = "Obteniendo informacion del veraz";
    }

}])