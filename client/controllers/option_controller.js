app.controller('optionController', function($scope, optionFactory, $routeParams, $cookies) {
    function getOption(data) {
        $scope.options = data;
    }

    optionFactory.getOption($routeParams.id, getOption);

    $scope.vote = function(option_id) {
        optionFactory.vote(option_id, getOption);
    }

})
