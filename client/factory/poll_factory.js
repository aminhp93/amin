app.factory('pollFactory', function($http) {
    var factory = {};
    var polls = [];

    factory.getPoll = function(callback) {
        $http.get('/polls').then(function(result) {
            polls = result.data;
            callback(polls);
        })
    }

    factory.createPoll = function(poll, callback) {
        $http.post('/polls', poll).then(function(result) {
            polls = result.data;
            callback(polls);
        })
    }

    factory.delete = function(id, callback) {
        $http.delete('/polls/' + id).then(function(result) {
            console.log(result.data);

            polls = result.data;
            callback(polls);
        })
    }
    return factory;
})
