angular.module("app").factory("LoginService", function ($http, $q) {




    var service = {};

    //Este servicio va al servidor, por GET al LoginController
    service.GetCurrentUser = function () {
        var promise = $http({
            method: 'get',
            url: '/api/Login/GetCurrentUser'
        });

        return $q.when(promise);

    };

    return service;
});