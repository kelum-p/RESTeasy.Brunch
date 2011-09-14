ResourceTemplate = require('templates/resource')

class exports.ResourceView extends Backbone.View
	id: "resourceView"
	
	constructor: (@model = null) ->
	  super()
	
	render: ->
		$(@.el).html ResourceTemplate(model: @model)
		@
		
	