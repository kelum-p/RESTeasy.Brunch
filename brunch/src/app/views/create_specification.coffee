CreateSpecificationTemplate = require('templates/create_specification')
Specification = require('models/specification').Specification
CreateModelBaseView = require('views/create_model_base').CreateModelBaseView

class exports.CreateSpecificationView extends CreateModelBaseView
	id: "createSpecificationView"
	
	render: ->
		$(@.el).html CreateSpecificationTemplate()
		@
	
	create: ->
		@createSpecification()	
	
	createSpecification: ->
		name = $('#createSpecificationForm input[name="name"]').val()
		version = $('#createSpecificationForm input[name="version"]').val()
		
		specification = new Specification() 
		specification.save name: name, version: version,
			success: => 
				@sendFeedback("#{name} (#{version}) saved successfully")
			error: =>
				@sendFeedback("Unable to save the specification")
	
	
