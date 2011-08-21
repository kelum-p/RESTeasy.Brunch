class exports.Resource extends Backbone.Model
	
	url: -> ([
		app.config.hostname
		"specifications"
		"resource"
		].join '/')