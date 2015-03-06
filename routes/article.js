var express = require('express');
var mongoose = require('mongoose');
var Article = require('../models/articleModel');

var router = express.Router();

routes.article = function(req,res) {
	var data = req.body;
	Article.findOne({title: data.title}).exec(function(err,art) {
		res.json(art);
	});
}

routes.add = function(req, res){
	var data = req.body;
	art = new Article({
		title: data.title,
		content: data.content
	});
	art.save(function(err) {
		if (err) {
			console.log('problem saving new article', err);
		}
	});	
	res.json(art);
}

routes.edit = function(req, res){
	var data = req.body;
	Article.findOneAndUpdate({title: data.title}, data.body, function(err,art){
		if (err) {
			console.log('could not update', err);
		}
	});
	res.end;
}

module.exports = router;