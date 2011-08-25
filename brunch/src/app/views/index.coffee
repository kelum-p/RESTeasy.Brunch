IndexTemplate = require('templates/index')

class exports.IndexView extends Backbone.View
	id: 'indexView'
	
	render: ->
		$(@.el).html IndexTemplate({viewId: "work"})
		@
	