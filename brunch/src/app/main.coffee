window.app =
	routers: {}
	models: {}
	collections: {}
	views: {}
	
	data:
		specifications: null

	config:
		hostname: "http://127.0.0.1:8000"

MainRouter = require('routers/main').MainRouter
IndexView = require('views/index').IndexView
SpecificationsView = require('views/specifications').SpecificationsView
CreateSpecificationView = 
	require('views/create_specification').CreateSpecificationView
ResourcesView = require('views/resources').ResourcesView

Specifications = require('collections/specifications').Specifications

# app bootstrapping on document ready
$(document).ready ->
  app.initialize = ->
    app.routers.main = new MainRouter()
		app.views.index = new IndexView()
		app.views.specifications = new SpecificationsView()
		app.views.createSpecification = new CreateSpecificationView()
		app.views.resources = {}
		
		# initialize collections
		app.collections.specifications = new Specifications()
		app.collections.resources = {}
		
    #app.routers.main.navigate 'home', true if Backbone.history.getFragment() is ''
  app.initialize()
  Backbone.history.start()
