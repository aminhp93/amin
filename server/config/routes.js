var users = require('../controllers/users.js');
var polls = require('../controllers/polls.js');
var options = require('../controllers/options.js');

module.exports = function(app) {
    app.post('/users', users.create);

    app.get('/polls', polls.index);
    app.get('/polls/:poll_id', polls.get_one_poll);
    app.post('/polls', polls.create);
    app.delete('/polls/:id', polls.delete);


    app.post('/polls/vote/:option_id', options.vote);

}
