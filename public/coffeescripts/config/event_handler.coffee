define ["underscore", "backbone"],  ( _ , Backbone)->
  eh = _.once ()->
    _.extend({}, Backbone.Events);

  eh()