var app = angular.module('app', ['ngRoute', 'ngCookies']);

app.config(function($routeProvider) {
    $routeProvider
        .when('/', {
            templateUrl: 'partials/index.html',
            controller: 'userController'
        })
        .when('/dashboard', {
            templateUrl: 'partials/poll.html',
            controller: 'pollController'
        })
        .when('/create', {
            templateUrl: 'partials/create.html',
            controller: 'pollController'
        })
        .when('/polls/:id', {
            templateUrl: 'partials/option.html',
            controller: 'optionController'
        })
        .otherwise({
            redirectTo: '/'
        })
})
