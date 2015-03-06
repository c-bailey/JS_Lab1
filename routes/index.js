
//Import models
var mongoose = require('mongoose');
var Article = require('.././models/articleModel.js');
var routes = {};

routes.home = function(req,res) {
	Article.find({}).sort({"_id": -1}).exec(function(err,arts) {
		res.render('home',{allarts: arts},{art:'Select an article to read'});
	});
}

routes.article = function(req,res) {
	var data = req.body;
	Article.findOne({title: data.title}).exec(function(err,art) {
		res.json(art);
	});
}

routes.addArticle = function(req, res){
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

routes.editArticle = function(req, res){
	var data = req.body;
	Article.findOneAndUpdate({title: data.title}, data.body, function(err,art){
		if (err) {
			console.log('could not update', err);
		}
	});
	res.end();
}

