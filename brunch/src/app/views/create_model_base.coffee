class exports.CreateModelBaseView extends Backbone.View
	events:
		"click #create" : "create"
		
	create: ->
		
	sendFeedback: (message) ->
		$("#feedback").html message