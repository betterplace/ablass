(function() {
  var __hasProp = Object.prototype.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor; child.__super__ = parent.prototype; return child; };

  define(["jquery", "underscore", "backbone", "marionette", "text!templates/projects/show.html", "app"], function($, _, Backbone, Marionette, ProjectTemplate, App) {
    var ProjectShowView;
    return ProjectShowView = (function(_super) {

      __extends(ProjectShowView, _super);

      function ProjectShowView() {
        ProjectShowView.__super__.constructor.apply(this, arguments);
      }

      ProjectShowView.prototype.tagName = 'div';

      ProjectShowView.prototype.className = 'project';

      ProjectShowView.prototype.id = function() {
        return this.model.attributes.id;
      };

      ProjectShowView.prototype.render = function() {
        this.$el.html(_.template(ProjectTemplate, this.model.attributes));
        return this.$el;
      };

      return ProjectShowView;

    })(Backbone.Marionette.ItemView);
  });

}).call(this);
