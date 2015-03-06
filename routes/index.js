//Import models
var mongoose = require('mongoose');
var Article = require('.././models/articleModel.js');
var routes = {};

routes.home = function(req,res) {
	res.render('home');
}


module.exports = routes;