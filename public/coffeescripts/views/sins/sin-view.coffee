define ["jquery", "underscore", "backbone", "marionette", "text!/javascripts/templates/sins/sin.html"], ($, _ , Backbone, Marionette, SinTemplate)->

  class SinItemView extends Backbone.Marionette.ItemView
    tagName: 'li'
    className: 'sin_item'

    id: ()->
      @model.attributes.id

    render: ()->
      @$el.html( _.template( SinTemplate, @model.attributes ) )
      @$el
