<article>

	<!-- normal article display -->
	<div if={ !editMode }>
		<h2>{ opts.article.title }</h2>
		<p>{ opts.article.content }</p>
	</div>
	

	<!-- edit article display -->
	<form if={ editMode }>
		<input value={ opts.article.title }>
		<br>
		<textarea value={ opts.article.content }/>
		<br>
		<input type="submit">
	</form>

	<br></br>


	<!-- action buttons -->
	<button onclick={ toggleEdit }>Edit</button>
	<button>Delete</button>


	<!-- javascript -->
	<script>

	this.editMode = false;
	this.toggleEdit = function(e) {
		this.editMode = !this.editMode;
	}

	</script>

</article>