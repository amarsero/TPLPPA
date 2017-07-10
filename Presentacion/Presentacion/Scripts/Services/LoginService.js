angular.module("app").factory("LoginService", function ($http, $q) {

    var service = {};

    //Este servicio va al servidor, por GET al LoginController
    service.GetCurrentUser = function () {
        var promise = $http({
            method: 'get',
            url: '/Login/GetCurrentUser'
        });

        return $q.when(promise);

    };

    service.GetCurrentTerminal = function () {
        var promise = $http({
            method: 'get',
            url: '/Login/GetCurrentTerminal'
        });

        return $q.when(promise);

    };

    service.IniciarSesion = function (User) {
        var promise = $http({
            method: 'get',
            encoding: 'JSON',
            url: '/Login/IniciarSesion',
            params: {usuario: User.Usuario, password: User.Password}
        });

        return $q.when(promise);

    };

    service.LogOut = function (User) {
        var promise = $http({
            method: 'post',
            encoding: 'JSON',
            url: '/Login/LogOut',
            
        });

        return $q.when(promise);

    };

    service.IsUserLog = function () {
        var promise = $http({
            method: 'get',
            encoding: 'JSON',
            url: '/Login/IsUserLog',
          
        });

        return $q.when(promise);

    };

    return service;
});