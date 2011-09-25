ElementsTemplate = require('templates/elements')

class exports.ElementsView extends Backbone.View
  id: 'elementsView'

  initialize: ->
    unless @options.resourceId
      throw "ElementsView requires the resourceId attribute"

    @resourceId = @options.resourceId

    if @options.elements?
      @elements = @options.elements
    else
      @elements = new Backbone.Collection()

  render: ->
    $(@el).html ElementsTemplate
      resourceId: @resourceId
      elements: @elements
    @
