<article>

	<!-- normal article display -->
	<div if={ !editMode && !addMode }>
		<h2>{ opts.article.title }</h2>
		<p>{ opts.article.content }</p>
	</div>


	<!-- edit article display -->
	<form if={ editMode } onSubmit={ editArticle }>
		<input id={ opts.article._id } name="title" value={ opts.article.title }>
		<br>
		<textarea name="content" value={ opts.article.content }/>
		<br>
		<input type="submit">
	</form>

	<br></br>


	<!-- action buttons -->
	<button onclick={ toggleEdit }>Edit</button>
	<button onClick={ deleteArticle }>Delete</button>


	<!-- javascript -->
	<script>
	var article = this;

	this.editMode = false;
	toggleEdit(e) {
		this.editMode = !this.editMode;
	}

	editArticle(e) {
		riot.route('/article/'+this.title.id);
		e.preventDefault();
		console.log(e);
		var newData = {}
		newData['id'] = this.title.id;
		newData['title'] = this.title.value;
		newData['content'] = this.content.value;
		$.ajax({
			url: '/article/'+this.title.id,
			type: 'PUT',
			success: function(){article.update();},
			data: newData
		}).error(console.error);
		this.toggleEdit()
		return true;
	}

	deleteArticle(e) {
		riot.route('/article/'+this.title.id);
		e.preventDefault();
		var newData = {}
		newData['id'] = this.title.id;
		$.ajax({
			url: '/article/'+this.title.id,
			type: 'DELETE',
			success: function(){parent.update();},
			data: newData
		}).error(console.error);
		return true;
	}

	</script>

</article>