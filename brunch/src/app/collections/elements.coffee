Element = require('models/element').Element

class exports.Elements extends Backbone.Collection
  model: Element
  
  constructor: (@elementsHref) ->
    super()
  
  url: -> ([
  	app.config.hostname
  	@elementsHref
  	].join '')
  	
  parse: (response) ->
    window.test = response
    response
  ###  
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
    ###