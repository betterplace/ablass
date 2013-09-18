define ["jquery", "underscore", "backbone", "models/sin"],  ( $, _ , Backbone, Sin)->

  class SinsCollection extends Backbone.Collection
    model: Sin
    url: '/sins'