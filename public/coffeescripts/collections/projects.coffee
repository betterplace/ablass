define ["jquery", "underscore", "backbone", "models/project"],  ( $, _ , Backbone, Project)->

  class Collection extends Backbone.Collection
    model: Project
    url: ()->
      "/sins/#{@sin}/projects"