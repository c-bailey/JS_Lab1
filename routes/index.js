//Import models
var mongoose = require('mongoose');
var Topic = require('.././models/topicModel.js');
var routes = {};

//Define Functions for each Route
function getHome(req,res) {
	Topic.find({}, function(err,topics) {
		//we actually might not want to use handlebars?
		res.render("home",{"topics":topics});
	})
};

//Assign functions to relevant routes
routes.home = getHome;

module.exports = routes;