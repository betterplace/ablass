define ["jquery", "underscore", "backbone", "models/sin", "app"],  ( $, _ , Backbone, Sin, App)->

  class Collection extends Backbone.Collection
    model: Sin
    url: ()->
      "#{App.url_root}/sins.json"