define ["jquery", "underscore", "backbone", "models/sin"],  ( $, _ , Backbone, Sin)->

  class Collection extends Backbone.Collection
    model: Sin
    url: '/sins'