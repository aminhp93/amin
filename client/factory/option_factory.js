app.factory('optionFactory', function($http) {
    var factory = {};
    var options = [];

    factory.getOption = function(poll_id, callback) {
        $http.get('/polls/' + poll_id).then(function(result) {
            options = result.data;
            console.log('amin');
            callback(options);
        })
    }

    factory.vote = function(option_id, callback) {
        $http.post('/polls/vote/' + option_id).then(function(result) {
            console.log(result.data);
            options = result.data;
            callback(options);
        })

    }

    return factory;
})
