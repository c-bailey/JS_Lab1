<article>

	<!-- normal article display -->
	<div class="article" if={ !editMode && !addMode }>
		<h2 id="title">{ opts.article.title }</h2>
		<p id="content">{ opts.article.content }</p>
		<button class="center-button" onclick={ toggleEdit }>Edit</button>
		<button class="center-button" onClick={ deleteArticle }>Delete</button>
	</div>


	<!-- edit article display -->
	<form if={ editMode } onSubmit={ editArticle }>
		<input id={ opts.article._id } name="form_title" value={ opts.article.title }>
		<br>
		<textarea name="form_content" value={ opts.article.content }/>
		<br>
		<input type="submit">
	</form>

	<br></br>


	<!-- javascript -->
	<script>
	var article = this;

	this.editMode = false;
	toggleEdit(e) {
		this.editMode = !this.editMode;
	}

	editArticle(e) {
		riot.route('/article/'+this.form_title.id);
		e.preventDefault();
		var newData = {}
		newData['id'] = this.form_title.id;
		newData['title'] = this.form_title.value;
		newData['content'] = this.form_content.value;
		$.ajax({
			url: '/article/'+this.form_title.id,
			type: 'PUT',
			data: newData,
			success: function(){
				$('#title').text(newData['title']);
				$('#content').text(newData['content']);
				article.update();
				riot.update();
			}
		}).error(console.error);
		this.toggleEdit()
		return true;
	}

	deleteArticle(e) {
		riot.route('/article/'+this.form_title.id);
		e.preventDefault();
		var newData = {}
		newData['id'] = this.form_title.id;
		$.ajax({
			url: '/article/'+this.form_title.id,
			type: 'DELETE',
			data: newData,
			success: function(){
				$('.article').replaceWith('');
				var index = opts.articles.indexOf(opts.article);
				if (index!=-1) {opts.articles.splice(index,1);}
				riot.update()
			}
		}).error(console.error);
		return true;
	}

	</script>

</article>