class exports.Resource extends Backbone.Model
	
  save: (attributes, options) ->
    @url = () => @_getPOSTUrl()
    super attributes, options
  
  fetch: (options) ->    
    @url = () => @_getGETUrl()
    super options
  
  _getPOSTUrl: ->
    ([
      app.config.hostname
      "specifications"
      "resource"
      ].join '/')
  
  _getGETUrl: -> 
    ([
      app.config.hostname
      "specifications"
      "resource"
      @get('resourceId')
     ].join '/')