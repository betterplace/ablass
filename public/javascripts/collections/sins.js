(function() {
  var __hasProp = Object.prototype.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor; child.__super__ = parent.prototype; return child; };

  define(["jquery", "underscore", "backbone", "models/sin", "app"], function($, _, Backbone, Sin, App) {
    var Collection;
    return Collection = (function(_super) {

      __extends(Collection, _super);

      function Collection() {
        Collection.__super__.constructor.apply(this, arguments);
      }

      Collection.prototype.model = Sin;

      Collection.prototype.url = function() {
        return "" + App.url_root + "/sins.json";
      };

      return Collection;

    })(Backbone.Collection);
  });

}).call(this);
