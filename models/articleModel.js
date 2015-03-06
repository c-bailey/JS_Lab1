var mongoose = require("mongoose");

var articleSchema = mongoose.Schema({
	title: String,
	body: String
});

module.exports = mongoose.model('Article', articleSchema);