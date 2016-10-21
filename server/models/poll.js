var mongoose = require('mongoose');

var PollSchema = new mongoose.Schema({
    question: { type: String },
    _user: { type: mongoose.Schema.Types.ObjectId, ref: 'User' },
    _option: [{ type: mongoose.Schema.Types.ObjectId, ref: 'Option' }],

}, { timestamps: true });

mongoose.model('Poll', PollSchema);
