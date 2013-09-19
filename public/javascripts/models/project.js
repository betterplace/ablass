(function() {
  var __hasProp = Object.prototype.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor; child.__super__ = parent.prototype; return child; };

  define(["jquery", "underscore", "backbone", "app"], function($, _, Backbone, App) {
    var Project;
    return Project = (function(_super) {

      __extends(Project, _super);

      function Project() {
        Project.__super__.constructor.apply(this, arguments);
      }

      Project.prototype.url = function() {
        return "" + App.url_root + "/sins/" + this.attributes.sin + "/projects/" + this.attributes.id + ".json";
      };

      return Project;

    })(Backbone.Model);
  });

}).call(this);
