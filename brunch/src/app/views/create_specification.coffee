CreateSpecificationTemplate = require('templates/create_specification')
Specification = require('models/specification').Specification

class exports.CreateSpecificationView extends Backbone.View
	id: "create_specification_view"
	
	events:
		"click #create" : "create_specification"
	
	render: ->
		$(@.el).html CreateSpecificationTemplate()
		@
	
	send_feedback: (message) ->
		$("#feedback").get(0).textContent = message
		
	create_specification: ->
		form = $("#create").get(0).form
		name = form.name.value
		version = form.version.value
		
		specification = new Specification() 
		specification.save name: name, version: version,
			success: (model, response) => 
				name = model.get('name')
				version = model.get('version')
				@send_feedback("#{name} (#{version}) saved successfully")
			error: (model, response) =>
				@send_feedback("Unable to save the specification")
	
	
