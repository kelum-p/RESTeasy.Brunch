Resources = require('collections/resources').Resources
ResourcesView = require('views/resources').ResourcesView
CreateResourceView = 
	require('views/create_resource').CreateResourceView

class exports.MainRouter extends Backbone.Router
	routes:
		'': 'index'
		'specifications': 'specifications'
		'createSpecification': 'createSpecification'
		':specName/:specVersion/resources': 'resources'
		':specName/:specVersion/createResource': 'createResource'
		'resource/:resourceId': 'resource'
		
	index: ->		
		$('body').html app.views.index.render().el
	
	specifications: ->
		app.collections.specifications.fetch
			success: =>
				@renderElement app.views.specifications.render().el
			error: =>
				@handleError()
				@renderElement app.views.specifications.render().el
				
	createSpecification: ->
		@renderElement app.views.createSpecification.render().el
		
	resources: (specName, specVersion) ->
		resources = new Resources(specName, specVersion)
		resources.fetch
			success: (resources) =>
				resourcesView = new ResourcesView specName, specVersion, resources
				@renderElement resourcesView.render().el
			error: =>
				@handleError()
				resourcesView = new ResourcesView specName, specVersion
				@renderElement resourcesView.render().el
				
	createResource: (specName, specVersion) ->
		createResourceView = new CreateResourceView(specName, specVersion)
		@renderElement createResourceView.render().el
	
	resource: ->
		
		
	handleError: ->
		
	renderElement: (element) ->
		$('body').html element
			
		
