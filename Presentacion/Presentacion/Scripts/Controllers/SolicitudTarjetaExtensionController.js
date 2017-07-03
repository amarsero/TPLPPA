var fuckyoumom;
angular.module('app').controller("SolicitudTarjetaExtensionController", ["$scope", "$location", "SolicitudTarjetaExtensionService",
    function ($scope, $location, SolicitudTarjetaExtensionService) {
        $scope.TitularObtenido = false;
        $scope.Procesando = false;
        $scope.MostrarInformacion = false;
        $scope.ErrorProceso = false;
        $scope.Informacion = "Hola";
        $scope.cliente;
        $scope.conyuge;

        $scope.mostrarDatosConyuge = function () {
            $scope.Procesando = true;
            SolicitudTarjetaExtensionService.ObtenerClientePorDNI($scope.dniTitular).then(function (response) {
                $scope.Procesando = false;
                fuckyoumom = response.data;
                $scope.informacionConyuge = "";

                if (response.data[0].Nombre == null) {
                    $scope.MostrarInformacion = true;
                    $scope.ErrorProceso = true;
                    $scope.Informacion = "No existe el dni ingresado.";
                }
                else if (response.data[1].Nombre == null){
                    $scope.cliente = response.data[0];
                    $scope.dniTitular = response.data[0].NroDocumento;
                    $scope.nombreTitular = response.data[0].Nombre;
                    $scope.TitularObtenido = true;
                }
                else {
                    $scope.cliente = response.data[0];
                    $scope.conyuge = response.data[1];
                    $scope.dniTitular = response.data[0].NroDocumento;
                    $scope.nombreTitular = response.data[0].Nombre;
                    $scope.nombreConyuge = response.data[1].Nombre;
                    $scope.dniConyuge = response.data[1].NroDocumento;
                    $scope.informacionConyuge = "tiene de conyuge a " + $scope.nombreConyuge +
                        "con dni: " + $scope.dniConyuge + " ";
                    $scope.TitularObtenido = true;
                    SolicitudTarjetaExtensionService.ObtenerImagen($scope.nombreTitular+$scope.dniTitular+".png").then(function (response) {
                        $scope.imagenicono = response.data;
                    },
                function (error) {
                }

            );
                }
            },
                function (error) {
                    $scope.Procesando = false;
                    $scope.MostrarInformacion = true;
                    $scope.ErrorProceso = true;
                    $scope.Informacion = "Se produjo un error en la base de datos.";
                }

            );

            $scope.CrearTarjeta = function()
            {
                $scope.Procesando = true;

                $scope.Tarjeta = {};
                $scope.Tarjeta.Marca = $scope.estadoSeleccionado;
                $scope.Tarjeta.SaldoMax = $scope.monto;
                $scope.Tarjeta.m_Cliente = $scope.cliente;
                $scope.Tarjeta.m_EstadoTarjeta = 1;


                SolicitudTarjetaExtensionService.NuevaTarjeta(JSON.stringify($scope.Tarjeta)).then(function () {
                    $scope.Procesando = false;
                        $scope.MostrarInformacion = true;
                        $scope.ErrorProceso = false;

                        $scope.Informacion = "Se creó una nueva tarjeta.";
                },
                    function (error) {
                        $scope.Procesando = false;
                        $scope.MostrarInformacion = true;
                        $scope.ErrorProceso = true;

                        $scope.Informacion = "Se produjo un error en la base de datos.";
                    }

                );
            }
        
    }


}])