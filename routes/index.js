//Import models
var mongoose = require('mongoose');
var Article = require('.././models/articleModel.js');
var routes = {};

routes.home = function(req,res) {
	Article.find({}).sort({"_id": -1}).exec(function(err,arts) {
		res.render('home',{allarts: arts},{art:'Select an article to read'});
	});
}


module.exports = routes;