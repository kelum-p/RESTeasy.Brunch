ResourcesTemplate = require('templates/resources')

class exports.ResourcesView extends Backbone.View
	id: "ResourcesView"
			
	constructor: (@specName, @specVersion, @resources = null) ->
		if !specName? or specName.length == 0
			throw "Specification name cannot be null or empty"
			
		if !specVersion? or specVersion.length == 0
			throw "Specification version cannot be null or empty"
		
		@resources = new Backbone.Collection() unless @resources?
		super()

	render: ->
		$(@.el).html ResourcesTemplate(
			specName: @specName
			specVersion: @specVersion
			resources: @resources)
		@