ResourcesTemplate = require('templates/resources')

class exports.ResourcesView extends Backbone.View
	id: "resourcesView"
			
	constructor: (@specName, @specVersion, @resources = null) ->
		if not specName
			throw "Specification name cannot be null or empty"
			
		if not specVersion
			throw "Specification version cannot be null or empty"
		
		@resources = new Backbone.Collection() unless @resources?
		super()

	render: ->
		$(@.el).html ResourcesTemplate(
			specName: @specName
			specVersion: @specVersion
			resources: @resources)
		@