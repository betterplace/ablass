(function() {
  var __hasProp = Object.prototype.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor; child.__super__ = parent.prototype; return child; };

  define(["jquery", "underscore", "backbone", "text!templates/amount.html", "app"], function($, _, Backbone, AmountTemplate, App) {
    var AmountView;
    return AmountView = (function(_super) {

      __extends(AmountView, _super);

      function AmountView() {
        AmountView.__super__.constructor.apply(this, arguments);
      }

      AmountView.prototype.initialize = function() {
        return this.delegateEvents({
          "click button.donate": "navigateToBetterplace",
          "click button.small": "smallSins",
          "click button.medium": "mediumSins",
          "click button.large": "largeSins"
        });
      };

      AmountView.prototype.render = function() {
        return this.$el.html(_.template(AmountTemplate));
      };

      AmountView.prototype.setProjectId = function(project_id, betterplace_id) {
        this.project_id = project_id;
        return this.betterplace_id = betterplace_id;
      };

      AmountView.prototype.navigateToBetterplace = function() {
        var amount;
        amount = this.$("input").val();
        return window.location.href = "https://www.bp42.com/en/projects/" + this.betterplace_id + "/client_donations/new?client_id=ablass&amount=" + amount;
      };

      AmountView.prototype.smallSins = function() {
        return this.$("input").val("5");
      };

      AmountView.prototype.mediumSins = function() {
        return this.$("input").val("15");
      };

      AmountView.prototype.largeSins = function() {
        return this.$("input").val("25");
      };

      return AmountView;

    })(Backbone.View);
  });

}).call(this);
