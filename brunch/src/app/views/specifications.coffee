SpecifcationsTemplate = require('templates/specifications')

class exports.SpecificationsView extends Backbone.View
	id: 'specifications_view'
	
	render: ->
		$(@.el).html SpecifcationsTemplate({specifications: app.collections.specifications.models})
		@
		
