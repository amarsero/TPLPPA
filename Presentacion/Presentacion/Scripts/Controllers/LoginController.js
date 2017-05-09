angular.module('app').controller("LoginController", ["$scope","LoginService", function ($scope,LoginService) {

    $scope.Titulo = "Bienvenido al sistema de gestion de tarjetas."

//Ejemplo de llamado al servicio
    var CurrentUser = function () {
        //se llama al servicio LoginService al metodo GetCurrentUSer()
        LoginService.GetCurrentUser().then(function (response) {
            $scope.LoginInfo = response.data;
                            // Si devolvio un usuario el GetCurrentUser que no me muestre la parte del login
                $scope.MostrarLogin = false;
                $scope.Titulo = $scope.LoginInfo.CUIT         
            
        });
    };

    // Cada vez que se cargue la web de login se va a llamar a este metodo asincronicamente para verificar si la sesion esta no iniciada.
    //Despues para probar descomenta lo de abajo:
    CurrentUser();

}])