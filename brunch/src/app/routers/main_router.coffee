class exports.MainRouter extends Backbone.Router
	routes:
		'': 'index'
		'specifications': 'specifications'
		
	index: ->		
		$('body').html app.views.index.render().el
	
	specifications: ->
		app.collections.specifications.fetch
			success: ->
				$('body').html app.views.specifications.render().el
			error: ->
				console.log "nay"
