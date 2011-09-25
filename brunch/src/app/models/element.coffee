class exports.Element extends Backbone.Model

  url: -> ([
    app.config.hostname
    "specifications"
    "element"].join '/')

  displayableAttributes: ->
    {
      Required: @get 'required'
      Static: @get 'static'
      Type: @get 'type'
    }
