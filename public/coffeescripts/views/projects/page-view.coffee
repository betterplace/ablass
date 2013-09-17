define ["jquery", "underscore", "backbone", "text!templates/projects/page.html", "models/project", "views/projects/item-view"], ($, _ , Backbone, ProjectsPageTemplate, Project, ProjectItemView)->
  
  class ProjectPageView extends Backbone.View

    initialize: (projects)->
      @projects = projects
    
    render: ()->
      template = $(_.template( ProjectsPageTemplate )())

      _.each @projects, (project)->
        projec_object = new Project( project )
        projec_view = new ProjectItemView( { model: projec_object } )
        template.find("ul#projects").append( projec_view.render() )

      @$el.html( template.html() )
