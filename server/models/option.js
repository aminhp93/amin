var mongoose = require('mongoose');

var OptionSchema = new mongoose.Schema({
    content: { type: String },
    vote: { type: Number, default: 0 },
    _poll: [{ type: mongoose.Schema.Types.ObjectId, ref: 'Poll' }],
}, { timestamps: true });

mongoose.model('Option', OptionSchema);
