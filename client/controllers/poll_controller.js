app.controller('pollController', function($scope, pollFactory, $location, $cookies) {
    function getPoll(data) {
        $scope.polls = data;

    }

    pollFactory.getPoll(getPoll);

    $scope.user = $cookies.get('username');
    $scope.user_id = $cookies.get('user_id');

    $scope.createPoll = function() {
        $scope.poll['_user'] = $cookies.get('user_id');
        pollFactory.createPoll($scope.poll, getPoll);
        $scope.poll = {};
        $location.url("/dashboard");
    }

    $scope.alo = function(id) {
        pollFactory.delete(id, getPoll);
    }

})
