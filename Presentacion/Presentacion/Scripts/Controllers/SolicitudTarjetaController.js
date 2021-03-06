﻿angular.module('app').controller("SolicitudTarjetaController", ["$scope", "$location", "SolicitudTarjetaService", "LoginService",
    function ($scope, $location, SolicitudTarjetaService, LoginService) {


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

        $scope.Procesando = false;
        $scope.Titulo = "Datos del nuevo cliente, solicitud nueva tarjeta.";
        $scope.estados = [];
        var cliente = {};

        $scope.FotoSacada = false;


        $scope.verificarEstadoCivil = function () {
            if ($scope.conyuge == "true") {
                $scope.datosConyuge = true;
            } else {
                $scope.datosConyuge = false;
            }
        }
        $scope.GuardarFoto = function () {
            foto = document.querySelector('#canvas').toDataURL('image/png');
            SolicitudTarjetaService.SubirFoto(foto, cliente.Nombre + cliente.DNI + ".png").then(
                function (d) {
                    $scope.Procesando = false;
                    $scope.MostrarInformacion = true;
                    $scope.FotoSacada = false;
                    $scope.Informacion = "Proceso finalizado: Foto almacenada correctamente.";
                    $scope.ErrorProceso = false;
                    $scope.TomarFoto = false;

                },
                function (error) {
                    $scope.ErrorProceso = true;
                    $scope.Procesando = false;
                    $scope.MostrarInformacion = true;
                    $scope.Informacion = "Ocurrio un error al procesar la informacion: " + "Hubo un problema al conectar a la base de datos";
                    $scope.TomarFoto = false;

                });

        }


        $scope.ProcesarSolicitud = function () {


            cliente.CUIT = $scope.CUIT;
            cliente.DniConyuge = $scope.DniConyuge;
            cliente.Domicilio = $scope.Domicilio;
            cliente.EstadoCivil = $scope.estadoSeleccionado;
            cliente.FechaNacimiento = $scope.FechaNacimiento;
            cliente.IngresoMensualAprox = $scope.Ganancia;
            cliente.Nombre = $scope.nombreTitular + ' ' + $scope.apellidoTitular;
            cliente.DNI = $scope.DNI;
            cliente.Sexo = $scope.Sexo;
            cliente.SituacionLaboral = $scope.Situacion;
            cliente.TipoDocumento = 0;
            cliente.Banco = $scope.Banco;
            cliente.dniTitular = $scope.dniTitular;

            if ($scope.conyuge == "true" && $scope.dniTitular == undefined) {
                $scope.Procesando = false;
                $scope.MostrarInformacion = true;
                $scope.Informacion = "Debe Ingresar un DNI titular si el cliente es Conyuge.";
                $scope.ErrorProceso = true;
            }

            if ($scope.CUIT == undefined || $scope.Domicilio == undefined || $scope.FechaNacimiento == undefined || $scope.Ganancia == undefined ||
             $scope.nombreTitular == undefined || $scope.apellidoTitular == undefined || $scope.DNI == undefined
            || cliente.EstadoCivil == null || cliente.Sexo == null || cliente.SituacionLaboral == null || cliente.Banco == null) {
                $scope.Procesando = false;
                $scope.MostrarInformacion = true;
                $scope.Informacion = "Debe llenar todos los datos";
                $scope.ErrorProceso = true;
            } else {

                $scope.Procesando = true;
                $scope.Tarea = "Procesando informacion";

                SolicitudTarjetaService.CrearCliente(cliente.CUIT, cliente.DniConyuge, cliente.Domicilio, cliente.EstadoCivil, cliente.FechaNacimiento,
            cliente.IngresoMensualAprox, cliente.Nombre, cliente.DNI, cliente.Sexo, cliente.SituacionLaboral, cliente.TipoDocumento, cliente.Banco, cliente.dniTitular).then(
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