class exports.Element extends Backbone.Model

  displayableAttributes: ->
    {
      Required: @get 'required'
      Static: @get 'static'
      Type: @get 'type'
    }
