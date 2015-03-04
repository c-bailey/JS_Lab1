var mongoose = require("mongoose");

var topicSchema = mongoose.Schema({
	title: String,
	body: String
});

module.exports = mongoose.model('Topic', topicSchema);