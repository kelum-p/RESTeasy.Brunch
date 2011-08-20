class exports.Specification extends Backbone.Model
	
	url: -> ([
		app.config.hostname
		"specifications"
		"specification"
		].join '/')
		