class exports.MainRouter extends Backbone.Router
	routes:
		'': 'index'
		'specifications': 'specifications'
		'create_specification': 'create_specification'
		':specification/:version/resources': 'resources'
		
	index: ->		
		$('body').html app.views.index.render().el
	
	specifications: ->
		app.collections.specifications.fetch
			success: =>
				@render_element app.views.specifications.render().el
			error: =>
				@handle_error()
				@render_element app.views.specifications.render().el
				
	create_specification: ->
		@render_element app.views.create_specification.render().el
		
	resources: (specification, version) ->
		resources = app.collections.resources["#{specification}#{version}"]
		
		unless resources?
			Resources = require('collections/resources').Resources
			resources = new Resources(specification, version)
			app.collections.resources["#{specification}#{version}"] = resources
			
		app.views.resources.set_specification_info specification, version
		resources.fetch
			success: (collection, response) =>
				app.views.resources.set_resources(collection)
				@render_element app.views.resources.render().el
			error: =>
				@handle_error()
				@render_element app.views.resources.render().el
	
	handle_error: ->
		
	render_element: (element) ->
		$('body').html element
			
		
