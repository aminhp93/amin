var mongoose = require('mongoose');

var UserSchema = new mongoose.Schema({
    name: { type: String },
    _poll: [{ type: mongoose.Schema.Types.ObjectId, ref: 'Poll' }]
}, { timestamps: true });

mongoose.model('User', UserSchema);
