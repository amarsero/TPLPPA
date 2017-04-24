angular.module('app').controller("SolicitudTarjetaController", ["$scope", "$location", function ($scope, $location) {
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
        $scope.Procesando = true;
        $scope.Tarea = "Obteniendo informacion del veraz";
    }

}])