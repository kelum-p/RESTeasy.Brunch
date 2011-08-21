ResourcesTemplate = require('templates/resources')

class exports.ResourcesView extends Backbone.View
	id: "Resources_View"
	
	initialize: ->
		@specification = ""
		@version = ""
		@resources = new Backbone.Collection()
	
	set_specification_info: (specification, version) ->
		@specification = specification if specification?
		@version = version if version?
		@resources.reset()
	
	set_resources: (resources) ->
		@resources = resources if resources?
	
	render: ->
		$(@.el).html ResourcesTemplate(
																		specification: @specification
																		version: @version
																		resources: @resources.models)
		@