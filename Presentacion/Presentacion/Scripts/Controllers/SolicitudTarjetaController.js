angular.module('app').controller("SolicitudTarjetaController", ["$scope", "$location", "SolicitudTarjetaService",
    function ($scope, $location, SolicitudTarjetaService) {
    $scope.Procesando = false;
    $scope.Titulo = "Datos del nuevo cliente, solicitud nueva tarjeta.";
    $scope.estados = [];
    var cliente = {};


    $scope.verificarEstadoCivil = function () {
        if ($scope.estadoSeleccionado == "2") {
            $scope.datosConyuge = true;
        } else {
            $scope.datosConyuge = false;
        }
    }
  
    $scope.ProcesarSolicitud = function () {
        

        cliente.CUIT = $scope.CUIT;
        cliente.DniConyuge = $scope.DniConyuge;
        cliente.Domicilio = $scope.Domicilio;
        cliente.EstadoCivil = $scope.estadoSeleccionado;
        cliente.FechaNacimiento = $scope.FechaNacimiento;
        cliente.IngresoMensualAprox = $scope.Ganancia;
        cliente.Nombre = $scope.nombreTitular + ' ' + $scope.apellidoTitular;
        cliente.DNI = $scope.dniTitular;
        cliente.Sexo = $scope.Sexo;
        cliente.SituacionLaboral = $scope.Situacion;
        cliente.TipoDocumento = 0;
        cliente.Banco = $scope.Banco;


if($scope.CUIT == undefined || $scope.Domicilio == undefined || $scope.FechaNacimiento == undefined || $scope.Ganancia == undefined ||
 $scope.nombreTitular == undefined || $scope.apellidoTitular == undefined || $scope.dniTitular == undefined
|| cliente.EstadoCivil == null || cliente.Sexo == null || cliente.SituacionLaboral == null || cliente.Banco == null){
     $scope.Procesando = false;
     $scope.MostrarInformacion = true;
     $scope.Informacion = "Debe llenar todos los datos";
     $scope.ErrorProceso = true;
} else{

        $scope.Procesando = true;
        $scope.Tarea = "Procesando informacion";

                SolicitudTarjetaService.CrearCliente(cliente.CUIT, cliente.DniConyuge, cliente.Domicilio, cliente.EstadoCivil, cliente.FechaNacimiento,
            cliente.IngresoMensualAprox, cliente.Nombre, cliente.DNI, cliente.Sexo, cliente.SituacionLaboral, cliente.TipoDocumento, cliente.Banco).then(
            function (d) {
                $scope.Procesando = false;
                $scope.MostrarInformacion = true;
                $scope.Informacion = "Informacion validada correctamente, procederemos a tomar una foto del cliente y capturar su firma digital.";
            },
            function (error) {
                $scope.ErrorProceso = true;
                $scope.Procesando = false;
                $scope.MostrarInformacion = true;
                $scope.Informacion = "Ocurrio un error al procesar la informacion: " + "El cliente no esta bancarizado";

            }           

        );

        }        
       
    }

}])