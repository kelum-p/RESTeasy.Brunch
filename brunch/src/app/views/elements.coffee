ElementsTemplate = require('templates/elements')

class exports.ElementsView extends Backbone.View
  id: 'elementsView'

  initialize: ->
    @elements = @options.elements

  render: ->
    $(@el).html ElementsTemplate(
      elements: @elements.models
      traverseElementHierarchy: =>
        html = ""
        for element in @elements.models
          unless element.has 'parent'
            html += @_traverseElementHierarchy element

        html
      )
    @

  _traverseElementHierarchy: (element) ->
    html = "<li> #{element.get 'name'} </li>"

    if element.has 'children'
      html += "<ol>"
      for child in element.get 'children'
        childElement = @elements.get child
        html += @_traverseElementHierarchy childElement
      html += "</ol>"

    html


