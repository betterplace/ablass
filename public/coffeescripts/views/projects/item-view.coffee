define ["jquery", "underscore", "backbone", "marionette", "text!templates/projects/item.html", "app"], ($, _ , Backbone, Marionette, ProjectTemplate, App)->

  class ProjectItemView extends Backbone.Marionette.ItemView
    tagName: 'li'
    className: 'project_item'

    id: ()->
      @model.attributes.id

    render: ()->
      @$el.html( _.template( ProjectTemplate, @model.attributes ) )
      @$el

