var mongoose = require('mongoose');
var Option = mongoose.model('Option');

module.exports = {
    vote: function(request, response) {
        Option.findOne({ _id: request.params.option_id }, function(err, option) {
            if (err) {
                console.log(err);
            } else {
                option.vote += 1;
                option.save(function(err, result) {
                    if (err) {
                        console.log(err);
                    }
                });
                response.redirect('/polls/' + option._poll[0]);
            }
        })
    }
}
