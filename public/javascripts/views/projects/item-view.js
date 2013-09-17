(function() {
  var __hasProp = Object.prototype.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor; child.__super__ = parent.prototype; return child; };

  define(["jquery", "underscore", "backbone", "marionette", "text!/javascripts/templates/projects/item.html"], function($, _, Backbone, Marionette, ProjectTemplate) {
    var ProjectItemView;
    return ProjectItemView = (function(_super) {

      __extends(ProjectItemView, _super);

      function ProjectItemView() {
        ProjectItemView.__super__.constructor.apply(this, arguments);
      }

      ProjectItemView.prototype.tagName = 'li';

      ProjectItemView.prototype.className = 'project_item';

      ProjectItemView.prototype.id = function() {
        return this.model.attributes.id;
      };

      ProjectItemView.prototype.render = function() {
        this.$el.html(_.template(ProjectTemplate, this.model.attributes));
        return this.$el;
      };

      return ProjectItemView;

    })(Backbone.Marionette.ItemView);
  });

}).call(this);
