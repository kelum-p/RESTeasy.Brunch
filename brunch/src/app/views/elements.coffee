ElementsTemplate = require('templates/elements')

class exports.ElementsView extends Backbone.View
  id: 'elementsView'

  initialize: ->
    if @options.elements?
      @elements = @options.elements
    else
      @elements = new Backbone.Collection()

  render: ->
    $(@el).html ElementsTemplate(elements: @elements)
    @
