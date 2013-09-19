define ["jquery", "underscore", "backbone", "marionette", "text!templates/projects/show.html", "app"], ($, _ , Backbone, Marionette, ProjectTemplate, App)->

  class ProjectShowView extends Backbone.Marionette.ItemView
    tagName: 'div'
    className: 'project'

    id: ()->
      @model.attributes.id

    render: ()->
      @$el.html( _.template( ProjectTemplate, @model.attributes ) )
      @$el

