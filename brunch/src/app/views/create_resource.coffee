CreateResourceTemplate = require('templates/create_resource')
Resource = require('models/resource').Resource
CreateModelBaseView = require('views/create_model_base').CreateModelBaseView

class exports.CreateResourceView extends CreateModelBaseView
	id: "createResourceView"
	
	constructor: (@specName, @specVersion) ->
		super()
	
	render: ->
		$(@.el).html CreateResourceTemplate(
			specName: @specName
			specVersion: @specVersion)
		@
		
	create: ->
		@createResource()
		
	createResource: ->		
		url = $('#createResourceForm input[name="url"]').val()
		
		resource = new Resource()
		resource.save specName:@specName, specVersion:@specVersion, url:url,      
			success: =>
				@sendFeedback("Resource: #{url} saved successfully")
			error: (model, response) =>
				@sendFeedback("Unable to save the resource #{url}")