<sidebar>

	<!-- list of all topics -->
	<div>
		<ul>
			<li each={ opts.articles }>
				<button id={ this._id } class='article-button' onclick={ parent.showArticle }>{ this.title }</button>
			</li>
		</ul>
	</div>


	<!-- action buttons -->
	<button class='side-button' onclick={ toggleAdd }>Add</button>
	<button class='side-button' onclick={ randomArticle }>Random</button>
	<br></br>
	

	<!-- add article display -->
	<form if={ addMode } onSubmit={ addArticle }>
		<input name="title">
		<br>
		<textarea name="content"/>
		<br>
		<input type="submit">
	</form>


	<script>
	this.addMode = false;
	var sidebar = this;
	var article = opts.article;

	toggleAdd (e) {
		this.addMode = !this.addMode;
	}

	showArticle(e) {
		var newData = {};
		newData['id'] = e.item._id;
		riot.route('articles/'+e.item._id);
		$.get('/article/'+e.item._id,newData).done(function(newArticle){
			var saveTitle = article.title;
			var saveId = article._id;
			article._id = newArticle._id;
			article.title = newArticle.title;
			article.content = newArticle.content;
			$('#'+String(saveId)).text(saveTitle);
			riot.update();
		});
		return true;
	}

	randomArticle(e) {
		var len = opts.articles.length;
		var rand_index = Math.floor(Math.random()*len);
		var rand_art = opts.articles[rand_index];
		var art_id = rand_art._id;

		var newData = {};
		newData['id'] = art_id;
		riot.route('articles/'+art_id);
		$.get('/article/'+art_id,newData).done(function(newArticle){
			var saveTitle = article.title;
			var saveId = article._id;
			article._id = newArticle._id;
			article.title = newArticle.title;
			article.content = newArticle.content;
			$('#'+String(saveId)).text(saveTitle);
			riot.update();
		});
		return true;
	}

	addArticle(e) {
		var newData = {};
		newData['title'] = this.title.value;
		newData['content'] = this.content.value;
		$.post('/article', newData).done(function(article){
			sidebar.update();
		}).error(console.error);
		this.toggleAdd();
		return true;
	}
	</script>

</sidebar>