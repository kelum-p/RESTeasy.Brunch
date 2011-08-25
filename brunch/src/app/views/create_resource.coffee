CreateResourceTemplate = require('templates/create_resource')

class exports.CreateResourceView extends Backbone.View
	id: "createResourceView"
	
	events:
		"click #create": "createResource"
		
	constructor: (@specName, @specVersion) ->
	
	render: ->
		$(@.el).html CreateResourceTemplate(specification: @specVersion
																				version: @specVersion)
		
	createResource: ->
		window.form = $("#createResourceForm").get(0)
		
	