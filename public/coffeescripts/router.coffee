define ["jquery", "underscore", "backbone", "marionette"], ($, _ , Backbone, Marionette, ApplicationController)->
  

  class AblassRouter extends Backbone.Marionette.AppRouter
    appRoutes:
      '': 'homeRoute'
      'home': 'homeRoute'
      'sins': 'sinsRoute'
      'sin/:id/projects': 'projectsRoute'
      'redeemed': 'donationSuccessRoute'