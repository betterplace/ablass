define ["jquery", "underscore", "backbone", "marionette"], ($, _ , Backbone, Marionette, ApplicationController)->


  class AblassRouter extends Backbone.Marionette.AppRouter
    appRoutes:
      '': 'homeRoute'
      'home': 'homeRoute'
      'sins': 'sinsRoute'
      'sin/:id/projects': 'sinsProjectsRoute'
      'sin/:sin_id/projects/:project_id': 'projectRoute'
      'projects/:id/amount/:bp_id': 'amountRoute'
      'redeemed': 'donationSuccessRoute'