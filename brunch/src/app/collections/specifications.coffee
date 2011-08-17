Specification = require('models/specification').Specification

class exports.Specifications extends Backbone.Collection
	model: Specification
	
	url: -> ([
		app.config.hostname
		"specifications"
		].join '/')