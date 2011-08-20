IndexTemplate = require('templates/index')

class exports.IndexView extends Backbone.View
	id: 'index_view'
	
	render: ->
		$(@.el).html IndexTemplate({view_id: "work"})
		@
	