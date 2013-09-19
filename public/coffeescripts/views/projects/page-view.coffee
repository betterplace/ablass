define ["jquery",
        "underscore",
        "backbone",
        "marionette",
        "text!templates/projects/page.html",
        "collections/projects",
        "views/projects/item-view",
        "app"], ($, _ , Backbone, Marionette, ProjectsPageTemplate, ProjectsCollection, ProjectItemView, App )->

  class ProjectPageView extends Backbone.Marionette.ItemView

    initialize: (option)->
      @sin = option.sin
      @collection = new ProjectsCollection()
      @collection.sin = @sin
      @collection.fetch( {reset: true} )

    render: ()->
      template = $(_.template( ProjectsPageTemplate )())

      _.each @collection.models, (project)->
        projec_view = new ProjectItemView( { model: project } )
        template.find("ul#projects").append( projec_view.render() )

      @$el.html( template.html() )
      @$el
