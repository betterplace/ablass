define ["jquery", "underscore", "backbone", "text!templates/sins/page.html", "models/sin", "views/sins/sin-view"], ($, _ , Backbone, SinsPageTemplate, Sin, SinItemView)->
  
  class SinsPageView extends Backbone.View

    initialize: (sins)->
      @sins = sins
    
    render: ()->
      template = $(_.template( SinsPageTemplate )())

      _.each @sins, (sin)->
        sin_object = new Sin( sin )
        sin_view = new SinItemView( { model: sin_object } )
        template.find("ul#sins").append( sin_view.render() )

      @$el.html( template.html() )
