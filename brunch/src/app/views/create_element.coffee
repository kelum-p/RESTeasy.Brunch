CreateModelBaseView = require('views/create_model_base').CreateModelBaseView
CreateElementTemplate = require('templates/create_element')
Element = require('models/element').Element

class exports.CreateElementView extends CreateModelBaseView
  id: "createElementView"

  initialize: ->
    unless @options.resourceId?
      throw "Create element view requires a resource ID"

    @resourceId = @options.resourceId

    if @options.parentId?
      @parentId = @options.parentId
    else
      @parentId = null

  render: ->
    $(@el).html CreateElementTemplate
      resourceId: @resourceId
      parentId: @parentId
    @

  create: ->
    @createElement()

  createElement: ->
    options =
      {
        resourceId: @resourceId
        parentId: @parentId if @parentId?
        name: $('#createElementForm input[name="name"]').val()
        type: $('#createElementForm input[name="type"]').val()
        required: $('#createElementForm input[name="required"]').val()
        static: $('#createElementForm input[name="static"]').val()
      }

    element = new Element()
    element.save options,
      success: =>
        @sendFeedback "Element: #{options.name} saved successfully"
      error: =>
        @sendFeedback "Failed to save!"

