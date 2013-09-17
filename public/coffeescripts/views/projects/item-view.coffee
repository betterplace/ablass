define ["jquery", "underscore", "backbone", "marionette", "text!/javascripts/templates/projects/item.html"], ($, _ , Backbone, Marionette, ProjectTemplate)->

  class ProjectItemView extends Backbone.Marionette.ItemView
    tagName: 'li'
    className: 'project_item'

    id: ()->
      @model.attributes.id

    render: ()->
      @$el.html( _.template( ProjectTemplate, @model.attributes ) )
      @$el

