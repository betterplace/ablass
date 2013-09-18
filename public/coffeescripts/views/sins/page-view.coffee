define ["jquery",
        "underscore",
        "backbone",
        "marionette",
        "text!templates/sins/page.html",
        "collections/sins",
        "views/sins/sin-view"], ($, _ , Backbone, Marionette, SinsPageTemplate, SinsCollection, SinItemView )->

  class SinsPageView extends Backbone.Marionette.ItemView

    initialize: ()->
      view = @
      @collection = new SinsCollection()
      @collection.fetch( {reset: true} )

    render: ()->
      template = $(_.template( SinsPageTemplate )())

      _.each @collection.models, (sin)->
        if parseInt( sin.attributes.projects ) > 0
          sin_view = new SinItemView( { model: sin } )
          template.find("ul#sins").append( sin_view.render() )

      @$el.html( template.html() )
      @$el
