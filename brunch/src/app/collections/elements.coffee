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
    @_createElementHierarchy response

  _createElementHierarchy: (elements) ->
    models = []
    for id, element of elements
      if element.parent?
        @_assignChildElement elements, id, element.parent
      models.push element

    models

  _assignChildElement: (elements, childId, parentId) ->
    if elements.hasOwnProperty parentId
      parentElement = elements[parentId]
      @_addChild parentElement, childId

  _addChild: (parentElement, childId) ->
    if parentElement.children?
      parentElement.children.push childId
    else
      parentElement.children = [childId]
