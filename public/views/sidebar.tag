<sidebar>

	<!-- list of all topics -->
	<div>
		<ul>
			<li each={ opts.articles }>
				<button>{ this.title }</button>
			</li>
		</ul>
	</div>

	<br></br>

	<!-- action buttons -->
	<button>Add</button>
	

	<script>
		// riot.route(function(collection,id,action) {
		// 	$.get(collection+'/'+id){}.done(function(data){riot.update(data);})});
	</script>

</sidebar>