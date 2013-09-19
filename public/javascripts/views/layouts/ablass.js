(function() {
  var __hasProp = Object.prototype.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor; child.__super__ = parent.prototype; return child; };

  define(["jquery", "underscore", "backbone", "marionette", "text!templates/layouts/ablass.html", "app"], function($, _, Backbone, Marionette, layoutTemplate, App) {
    var Layout, lout;
    Layout = (function(_super) {

      __extends(Layout, _super);

      function Layout() {
        Layout.__super__.constructor.apply(this, arguments);
      }

      Layout.prototype.template = _.template(layoutTemplate);

      Layout.prototype.regions = {
        content: "#content"
      };

      return Layout;

    })(Backbone.Marionette.Layout);
    lout = _.once(function() {
      return new Layout();
    });
    return lout();
  });

}).call(this);
