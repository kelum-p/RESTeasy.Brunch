class exports.Resource extends Backbone.Model
	  
  save: (attributes, options) ->
    @url = () => @_getPOSTUrl()
    super attributes, options
  
  fetch: (options) ->    
    @url = () => @_getGETUrl()
    super options
    
  parse: (response) ->
    @_createPropertyHierarchy response
  
  _createPropertyHierarchy: (response) ->
    if response.properties?
      @_createRelationships response.properties
    
    response
  
  _createRelationships: (properties) ->
    for id, property of properties
      if property.parent?
        @_assignChildProperty properties, id, property.parent
  
  _assignChildProperty: (properties, childId, parentId) ->
    if properties.hasOwnProperty parentId
      parentProperty = properties[parentId]
      @_addChild parentProperty, childId
      
  _addChild: (parentProperty, childId) ->
    if parentProperty.hasOwnProperty 'children'
      parentProperty.children.push childId
    else
      parentProperty.children = [childId]
  
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