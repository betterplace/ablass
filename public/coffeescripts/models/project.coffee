define ["jquery", "underscore", "backbone"],  ( $, _ , Backbone)->

  class Project extends Backbone.Model
    url: ()->
      "/sins/#{@attributes.sin}/projects/#{@attributes.id}"