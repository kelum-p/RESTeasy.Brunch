Resource = require('models/resource').Resource

class exports.Resources extends Backbone.Collection
	model: Resource
	
	constructor: (@specification, @version) ->
	
	url: -> ([
		app.config.hostname
		"specifications"
		@specification
		@version
		"resources"
		].join '/')