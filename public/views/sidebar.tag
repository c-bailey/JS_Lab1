<sidebar>

	<!-- list of all topics -->
	<div>
		<ul>
			<li each={ opts.articles }>
				<button onclick={ parent.showArticle }>{ this.title }</button>
			</li>
		</ul>
	</div>

	<br></br>

	<!-- action buttons -->
	<button onclick={ toggleAdd }>Add</button>
	<button onclick={ randomArticle }>Random</button>
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

	toggleAdd (e) {
		this.addMode = !this.addMode;
	}

	showArticle(e) {
		riot.route('articles/'+e.item._id);
		$.get('/article/'+e.item._id).done(function(article){

		});
	}

	randomArticle(e) {
		var len = opts.articles.length;
		var rand_index = Math.floor(Math.random()*len);
		var rand_art = opts.articles[rand_index];
		var art_id = rand_art._id;
		riot.route('/articles/'+art_id);
		$.get('/article/'+art_id).done(function(article){

		});
	}

	addArticle(e) {
		var newData = {}
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