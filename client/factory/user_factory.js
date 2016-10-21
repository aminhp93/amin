app.factory('userFactory', function($http) {
    var factory = {};
    var users = [];

    factory.createUser = function(user, callback) {

        $http.post('/users', user).then(function(result) {
            users = result.data;
            callback(users);
        })
    }

    var logged_in_user;

    factory.get_logged_in_user = function(callback) {
        callback(logged_in_user);
    }

    return factory;
})
