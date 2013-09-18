(function() {
  var __hasProp = Object.prototype.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor; child.__super__ = parent.prototype; return child; };

  define(["jquery", "underscore", "backbone", "marionette", "text!templates/sins/page.html", "collections/sins", "views/sins/sin-view"], function($, _, Backbone, Marionette, SinsPageTemplate, SinsCollection, SinItemView) {
    var SinsPageView;
    return SinsPageView = (function(_super) {

      __extends(SinsPageView, _super);

      function SinsPageView() {
        SinsPageView.__super__.constructor.apply(this, arguments);
      }

      SinsPageView.prototype.initialize = function() {
        var view;
        view = this;
        this.collection = new SinsCollection();
        return this.collection.fetch({
          reset: true
        });
      };

      SinsPageView.prototype.render = function() {
        var template;
        template = $(_.template(SinsPageTemplate)());
        _.each(this.collection.models, function(sin) {
          var sin_view;
          if (parseInt(sin.attributes.projects) > 0) {
            sin_view = new SinItemView({
              model: sin
            });
            return template.find("ul#sins").append(sin_view.render());
          }
        });
        this.$el.html(template.html());
        return this.$el;
      };

      return SinsPageView;

    })(Backbone.Marionette.ItemView);
  });

}).call(this);
