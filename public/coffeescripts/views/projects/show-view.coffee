define ["jquery", "underscore", "backbone", "marionette", "text!/javascripts/templates/projects/show.html"], ($, _ , Backbone, Marionette, ProjectTemplate)->

  class ProjectShowView extends Backbone.Marionette.ItemView
    tagName: 'div'
    className: 'project'

    id: ()->
      @model.attributes.id

    render: ()->
      @$el.html( _.template( ProjectTemplate, @model.attributes ) )
      @$el

