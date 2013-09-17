define ["jquery", "underscore", "backbone", "marionette"], ($, _ , Backbone, Marionette, ApplicationController)->
  

  class AblassRouter extends Backbone.Marionette.AppRouter
    appRoutes:
      '': 'homeRoute'
      'home': 'homeRoute'
      'sins': 'sinsRoute'
      'sin/:id/projects': 'sinsProjectsRoute'
      'projects/:id': 'projectRoute'
      'projects/:id/amount': 'amountRoute'
      'redeemed': 'donationSuccessRoute'