CreateSpecificationTemplate = require('templates/create_specification')
Specification = require('models/specification').Specification

class exports.CreateSpecificationView extends Backbone.View
	id: "create_specification_view"
	
	events:
		"click #create" : "create_specification"
	
	render: ->
		$(@.el).html CreateSpecificationTemplate()
		@
	
	create_specification: ->
		form = $("#create").get(0).form
		name = form.name.value
		version = form.version.value
		
		specification = new Specification() 
		specification.save name: name, version: version,
			success: ->
		    console.log "yay"
		  error: (model, response) ->
	    	console.log "nay #{response}"
