<article>

	<!-- normal article display -->
	<div if={ !editMode }>
		<h2>Article Title</h2>
		<p>This is the article body.</p>
	</div>

	<!-- edit article display -->
	<form if={ editMode }>
		<input>
		<br>
		<textarea/>
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