CreateResourceTemplate = require('templates/create_resource')
Resource = require('models/resource').Resource

class exports.CreateResourceView extends Backbone.View
	id: "createResourceView"
	
	events:
		"click #create": "createResource"
		
	constructor: (@specName, @specVersion) ->
		super()
	
	render: ->
		$(@.el).html CreateResourceTemplate(
			specName: @specName
			specVersion: @specVersion)
		@
		
	createResource: ->
		url = $('#createResourceForm input[name="url"]').val()
		
		resource = new Resource()
		resource.save specification:@specName, version:@specVersion, url:url,
			success: ->
				console.log "yay"
			error: ->
				console.log "nay"
		
		
	