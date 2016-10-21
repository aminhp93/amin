var mongoose = require('mongoose');
var User = mongoose.model('User');
var Poll = mongoose.model('Poll');
var Option = mongoose.model('Option');

module.exports = {
    index: function(request, response) {
        Poll.find({})
            .populate('_user')
            .exec(function(err, result) {
                if (err) {
                    console.log(err);
                } else {
                    response.json(result);
                }
            })
    },
    get_one_poll: function(request, response) {
        Poll.find({ _id: request.params.poll_id })
            .populate('_option')
            .exec(function(err, result) {
                if (err) {
                    console.log(err);
                } else {
                    response.json(result);
                }
            })
    },
    create: function(request, response) {
        console.log(request.body);
        Poll.create({ question: request.body.question, _user: request.body._user }, function(err, question) {
            if (err) {
                console.log(err);
            } else {
                Option.create({ content: request.body.option1, _poll: question._id }, function(err, option1) {
                    if (err) {
                        console.log(err);
                    } else {
                        question._option.push(option1._id);
                        question.save(function(err, result) {
                            if (err) {
                                console.log(err);
                            } else {
                                Option.create({ content: request.body.option2, _poll: question._id }, function(err, option2) {
                                    if (err) {
                                        console.log(err);
                                    } else {
                                        question._option.push(option2._id);
                                        question.save(function(err, result) {
                                            if (err) {
                                                console.log(err);
                                            } else {
                                                Option.create({ content: request.body.option3, _poll: question._id }, function(err, option3) {
                                                    if (err) {
                                                        console.log(err);
                                                    } else {
                                                        question._option.push(option3._id);
                                                        question.save(function(err, result) {
                                                            if (err) {
                                                                console.log(err);
                                                            } else {
                                                                Option.create({ content: request.body.option4, _poll: question._id }, function(err, option4) {
                                                                    if (err) {
                                                                        console.log(err);
                                                                    } else {
                                                                        question._option.push(option4._id);
                                                                        question.save(function(err, result) {
                                                                            if (err) {
                                                                                console.log(err);
                                                                            } else {
                                                                                User.findOne({ _id: request.body._user }, function(err, user) {
                                                                                    if (err) {
                                                                                        console.log(err);
                                                                                    } else {
                                                                                        user._poll.push(question._id);
                                                                                        user.save(function(err, result) {
                                                                                            if (err) {
                                                                                                console.log(err);
                                                                                            }
                                                                                        })
                                                                                    }
                                                                                })
                                                                            }
                                                                        })
                                                                    }
                                                                })
                                                            }
                                                        })
                                                    }
                                                })
                                            }
                                        })
                                    }
                                })
                            }
                        })
                    }
                })
            }
        })
    },
    delete: function(request, response) {
        console.log(request.params);
        Poll.remove({ _id: request.params.id }, function(err, result) {
            if (err) {
                console.log(err);
            } else {
                Poll.find({})
                    .populate('_user')
                    .exec(function(err, result) {
                        if (err) {
                            console.log(err);
                        } else {
                            response.json(result);
                        }
                    })
            }

        })
    }
}
