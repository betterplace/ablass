(function() {
  var __hasProp = Object.prototype.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor; child.__super__ = parent.prototype; return child; };

  define(["jquery", "underscore", "backbone", "text!templates/home.html", "app"], function($, _, Backbone, HomeTemplate, App) {
    var HomeView;
    return HomeView = (function(_super) {

      __extends(HomeView, _super);

      function HomeView() {
        HomeView.__super__.constructor.apply(this, arguments);
      }

      HomeView.prototype.initialize = function() {
        return this.delegateEvents({
          "click button.sins": "navigateSins"
        });
      };

      HomeView.prototype.render = function() {
        return this.$el.html(_.template(HomeTemplate)());
      };

      HomeView.prototype.navigateSins = function() {
        return App.router.navigate("sins", {
          trigger: true
        });
      };

      return HomeView;

    })(Backbone.View);
  });

}).call(this);
