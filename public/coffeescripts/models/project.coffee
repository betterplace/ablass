define ["jquery", "underscore", "backbone", "app"],  ( $, _ , Backbone, App)->

  class Project extends Backbone.Model
    url: ()->
      "#{App.url_root}/sins/#{@attributes.sin}/projects/#{@attributes.id}.json"