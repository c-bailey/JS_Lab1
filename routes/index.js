//Import models
var mongoose = require('mongoose');
var Topic = require('.././models/topicModel.js');
var routes = {};

//Define Functions for each Route
function getHome(req,res) {res.render("home")};

//Assign functions to relevant routes
routes.home = getHome;

module.exports = routes;