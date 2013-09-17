(function() {
  var __hasProp = Object.prototype.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor; child.__super__ = parent.prototype; return child; };

  define(["jquery", "underscore", "backbone", "marionette", "text!/javascripts/templates/sins/sin.html"], function($, _, Backbone, Marionette, SinTemplate) {
    var SinItemView;
    return SinItemView = (function(_super) {

      __extends(SinItemView, _super);

      function SinItemView() {
        SinItemView.__super__.constructor.apply(this, arguments);
      }

      SinItemView.prototype.tagName = 'li';

      SinItemView.prototype.className = 'sin_item';

      SinItemView.prototype.id = function() {
        return this.model.attributes.id;
      };

      SinItemView.prototype.render = function() {
        this.$el.html(_.template(SinTemplate, this.model.attributes));
        return this.$el;
      };

      return SinItemView;

    })(Backbone.Marionette.ItemView);
  });

}).call(this);
