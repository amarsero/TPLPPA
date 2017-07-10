angular.module('app').controller("LoginController", ["$scope", "LoginService", "$location", function ($scope, LoginService, $location) {

 

//Ejemplo de llamado al servicio
    var CurrentUser = function () {
        //se llama al servicio LoginService al metodo GetCurrentUSer()
        LoginService.GetCurrentUser().then(function (response) {
            $scope.LoginInfo = response.data;
                            // Si devolvio un usuario el GetCurrentUser que no me muestre la parte del login
                $scope.MostrarLogin = false;            
        });
    };

    $scope.IniciarSesion = function () {
        var user = {
            Usuario: $scope.usuario,
            Password: $scope.password
        };
        LoginService.IniciarSesion(user).then(
            function (d) {
                $scope.Titulo = "Sesion iniciada, bienvenido " + d.data.Nombre;;
            },
            function (error) {

                $scope.Titulo = "Usuario o contraseña incorrectos.";

            }           

        );
    };

    var VerificarLogin = function () {
        if ($location.search().logout == "true") {
            LoginService.LogOut().then(
                function (d) {
                  
                },
                function (error) {

                    $scope.Titulo = "Error";

                }
            );
        }
        LoginService.IsUserLog().then(
            function (d) {
                if (d.data == "True") {
                    $location.path("/solicitudtarjeta");
                }
            },
            function (error) {

                $scope.Titulo = "Error";

            }
        );
    }

    VerificarLogin();


    // Cada vez que se cargue la web de login se va a llamar a este metodo asincronicamente para verificar si la sesion esta no iniciada.
    //Despues para probar descomenta lo de abajo:
    //CurrentUser();

}])