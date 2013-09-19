define ["jquery", "underscore", "backbone", "marionette", "text!templates/sins/sin.html", "app"], ($, _ , Backbone, Marionette, SinTemplate, App)->

  class SinItemView extends Backbone.Marionette.ItemView
    tagName: 'li'
    className: 'sin_item'

    id: ()->
      @model.attributes.name

    render: ()->
      @$el.html( _.template( SinTemplate, @model.attributes ) )
      @$el
