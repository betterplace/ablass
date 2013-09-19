define ["jquery", "underscore", "backbone", "marionette", "text!templates/layouts/ablass.html", "app"], ($, _ , Backbone, Marionette, layoutTemplate, App)->

  class Layout extends Backbone.Marionette.Layout
    template: _.template(layoutTemplate)
    regions:
      content: "#content"

  lout = _.once ()->
    new Layout()

  lout()