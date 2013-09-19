define ["jquery", "underscore", "backbone", "models/project", "app"],  ( $, _ , Backbone, Project, App)->


  class Collection extends Backbone.Collection
    model: Project
    url: ()->
      "#{App.url_root}/sins/#{@sin}/projects.json"