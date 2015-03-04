var routes = {};

var mongoose = require('mongoose');
var Article = require('../models/article');

routes.home = function(req,res) {
	Article.find({}).sort({"_id": -1}).exec(function(err,arts) {
		res.render('home',{allarts: arts});
	});
}