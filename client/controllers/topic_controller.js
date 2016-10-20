app.controller('topicController', function($scope, topicFactory, $location, userFactory, $cookies) {
    function getTopic(data) {
        $scope.topics = data;
    }

    topicFactory.getTopic(getTopic);
    $scope.user = $cookies.get('username');
    $scope.category = ['HTML', "MySQL", "Ruby", 'UX', 'Web Development'];

    $scope.createTopic = function() {
        $scope.topic['_user'] = $cookies.get('user_id');
        topicFactory.createTopic($scope.topic, getTopic);
        $scope.topic = {};
    }
})
