class exports.MainRouter extends Backbone.Router
	routes:
		'': 'index'
		'specifications': 'specifications'
		'create_specification': 'create_specification'
		
	index: ->		
		$('body').html app.views.index.render().el
	
	specifications: ->
		app.collections.specifications.fetch
			success: ->
				$('body').html app.views.specifications.render().el
			error: ->
				console.log "nay"
				
	create_specification: ->
		$('body').html app.views.create_specification.render().el
