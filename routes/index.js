//Import models
var mongoose = require('mongoose');
var Article = require('.././models/articleModel.js');
var routes = {};

routes.home = function(req,res) {
	Article.find({}).sort({"_id":-1}).exec(function(err,articles) {
		//we actually might not want to use handlebars?
		res.render("home",{"articles":articles});
	});
};

module.exports = routes;