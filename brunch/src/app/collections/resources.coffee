Resource = require('models/resource').Resource

class exports.Resources extends Backbone.Collection
	model: Resource
	
	constructor: (@specName, @specVersion) ->
	  super()
	
	url: -> ([
		app.config.hostname
		"specifications"
		@specName
		@specVersion
		"resources"
		].join '/')