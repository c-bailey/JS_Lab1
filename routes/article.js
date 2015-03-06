var express = require('express');
var mongoose = require('mongoose');
var Article = require('../models/articleModel');

var router = express.Router();

router.get('/', function(req,res) {
	Article.find({}).sort({"_id": -1}).exec(function(err,arts) {
		res.json(arts);
	});
});

router.get('/:id', function(req,res) {
	var data = req.body;
	Article.findOne({title: data.title}).exec(function(err,art) {
		res.json(art);
	});
});

router.post('/', function(req, res){
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
});

router.put('/:id', function(req, res){
	var data = req.body;
	Article.findOneAndUpdate({title: data.title}, data.body, function(err,art){
		if (err) {
			console.log('could not update', err);
		}
	});
	res.end;
});

module.exports = router;