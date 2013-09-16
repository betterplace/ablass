(function() {
  var __hasProp = Object.prototype.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor; child.__super__ = parent.prototype; return child; };

  define(["jquery", "underscore", "backbone", "marionette"], function($, _, Backbone, Marionette, ApplicationController) {
    var AblassRouter;
    return AblassRouter = (function(_super) {

      __extends(AblassRouter, _super);

      function AblassRouter() {
        AblassRouter.__super__.constructor.apply(this, arguments);
      }

      AblassRouter.prototype.appRoutes = {
        '': 'homeRoute',
        'home': 'homeRoute',
        'sins': 'sinsRoute',
        'sin/:id/projects': 'projectsRoute'
      };

      return AblassRouter;

    })(Backbone.Marionette.AppRouter);
  });

}).call(this);
