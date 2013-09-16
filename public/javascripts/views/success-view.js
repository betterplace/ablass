(function() {
  var __hasProp = Object.prototype.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor; child.__super__ = parent.prototype; return child; };

  define(["jquery", "underscore", "backbone", "text!templates/success.html", "app"], function($, _, Backbone, SuccessTemplate, App) {
    var DonationSuccessView;
    return DonationSuccessView = (function(_super) {

      __extends(DonationSuccessView, _super);

      function DonationSuccessView() {
        DonationSuccessView.__super__.constructor.apply(this, arguments);
      }

      DonationSuccessView.prototype.initialize = function() {
        return this.delegateEvents({
          "click button.facebook": "share_facebook",
          "click button.email": "share_email",
          "click button.angel": "home"
        });
      };

      DonationSuccessView.prototype.render = function() {
        return this.$el.html(_.template(SuccessTemplate));
      };

      DonationSuccessView.prototype.share_facebook = function() {
        return console.log("facebook");
      };

      DonationSuccessView.prototype.share_email = function() {
        return console.log("email");
      };

      DonationSuccessView.prototype.home = function() {
        return console.log("home");
      };

      return DonationSuccessView;

    })(Backbone.View);
  });

}).call(this);
