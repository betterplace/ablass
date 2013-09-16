define ["jquery", "underscore", "backbone", "marionette", "text!templates/layouts/ablass"], ($, _ , Backbone, Marionette, layoutTemplate)->
  
  class Layout extends Backbone.Marionette.Layout
    template: _.template(layoutTemplate)
    regions:
      content: "#content"

  lout = _.once ()->
    new Layout()

  lout()