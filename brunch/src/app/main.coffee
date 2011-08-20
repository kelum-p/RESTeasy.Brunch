window.app =
	routers: {}
	models: {}
	collections: {}
	views: {}
	
	data:
		specifications: null

	config:
		hostname: "http://127.0.0.1:8000"

MainRouter = require('routers/main_router').MainRouter
IndexView = require('views/index').IndexView
SpecificationsView = require('views/specifications').SpecificationsView
CreateSpecificationView = 
	require('views/create_specification').CreateSpecificationView

Specifications = require('collections/specifications').Specifications

# app bootstrapping on document ready
$(document).ready ->
  app.initialize = ->
    app.routers.main = new MainRouter()
		app.views.index = new IndexView()
		app.views.specifications = new SpecificationsView()
		app.views.create_specification = new CreateSpecificationView()
		
		# initialize collections
		app.collections.specifications = new Specifications()
		
    #app.routers.main.navigate 'home', true if Backbone.history.getFragment() is ''
  app.initialize()
  Backbone.history.start()
