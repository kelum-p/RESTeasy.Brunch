Specifications = require('collections/specifications').Specifications

class exports.MainRouter extends Backbone.Router
	routes:
		'': 'index'
		
	index: ->
		app.collections.specifications = new Specifications()
		app.collections.specifications.fetch
			success: ->
				alert "yay"
			error: ->
				alert "nay"
				
  #home: ->
		#alert "home"
		#$('body').html app.views.home.render().el
