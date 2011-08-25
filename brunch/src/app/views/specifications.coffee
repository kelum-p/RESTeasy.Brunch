SpecifcationsTemplate = require('templates/specifications')

class exports.SpecificationsView extends Backbone.View
	id: 'specificationsView'
	
	render: ->
		$(@.el).html SpecifcationsTemplate(
			specifications: app.collections.specifications.models)
		@
		
