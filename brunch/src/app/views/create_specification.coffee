CreateSpecificationTemplate = require('templates/create_specification')
Specification = require('models/specification').Specification

class exports.CreateSpecificationView extends Backbone.View
	id: "createSpecificationView"
	
	events:
		"click #create" : "createSpecification"
	
	render: ->
		$(@.el).html CreateSpecificationTemplate()
		@
	
	sendFeedback: (message) ->
		$("#feedback").get(0).textContent = message
		
	createSpecification: ->
		form = $("#create").get(0).form
		name = form.name.value
		version = form.version.value
		
		specification = new Specification() 
		specification.save name: name, version: version,
			success: (model, response) => 
				name = model.get('name')
				version = model.get('version')
				@sendFeedback("#{name} (#{version}) saved successfully")
			error: (model, response) =>
				@sendFeedback("Unable to save the specification")
	
	
