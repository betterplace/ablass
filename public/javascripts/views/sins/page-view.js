(function() {
  var __hasProp = Object.prototype.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor; child.__super__ = parent.prototype; return child; };

  define(["jquery", "underscore", "backbone", "text!templates/sins/page.html", "models/sin", "views/sins/sin-view"], function($, _, Backbone, SinsPageTemplate, Sin, SinItemView) {
    var SinsPageView;
    return SinsPageView = (function(_super) {

      __extends(SinsPageView, _super);

      function SinsPageView() {
        SinsPageView.__super__.constructor.apply(this, arguments);
      }

      SinsPageView.prototype.initialize = function(sins) {
        return this.sins = sins;
      };

      SinsPageView.prototype.render = function() {
        var template;
        template = $(_.template(SinsPageTemplate)());
        _.each(this.sins, function(sin) {
          var sin_object, sin_view;
          sin_object = new Sin(sin);
          sin_view = new SinItemView({
            model: sin_object
          });
          return template.find("ul#sins").append(sin_view.render());
        });
        return this.$el.html(template.html());
      };

      return SinsPageView;

    })(Backbone.View);
  });

}).call(this);
