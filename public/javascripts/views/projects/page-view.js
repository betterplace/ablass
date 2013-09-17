(function() {
  var __hasProp = Object.prototype.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor; child.__super__ = parent.prototype; return child; };

  define(["jquery", "underscore", "backbone", "text!templates/projects/page.html", "models/project", "views/projects/item-view"], function($, _, Backbone, ProjectsPageTemplate, Project, ProjectItemView) {
    var ProjectPageView;
    return ProjectPageView = (function(_super) {

      __extends(ProjectPageView, _super);

      function ProjectPageView() {
        ProjectPageView.__super__.constructor.apply(this, arguments);
      }

      ProjectPageView.prototype.initialize = function(projects) {
        return this.projects = projects;
      };

      ProjectPageView.prototype.render = function() {
        var template;
        template = $(_.template(ProjectsPageTemplate)());
        _.each(this.projects, function(project) {
          var projec_object, projec_view;
          projec_object = new Project(project);
          projec_view = new ProjectItemView({
            model: projec_object
          });
          return template.find("ul#projects").append(projec_view.render());
        });
        return this.$el.html(template.html());
      };

      return ProjectPageView;

    })(Backbone.View);
  });

}).call(this);
