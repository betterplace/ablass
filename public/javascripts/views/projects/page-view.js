(function() {
  var __hasProp = Object.prototype.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor; child.__super__ = parent.prototype; return child; };

  define(["jquery", "underscore", "backbone", "marionette", "text!templates/projects/page.html", "collections/projects", "views/projects/item-view"], function($, _, Backbone, Marionette, ProjectsPageTemplate, ProjectsCollection, ProjectItemView) {
    var ProjectPageView;
    return ProjectPageView = (function(_super) {

      __extends(ProjectPageView, _super);

      function ProjectPageView() {
        ProjectPageView.__super__.constructor.apply(this, arguments);
      }

      ProjectPageView.prototype.initialize = function(option) {
        this.sin = option.sin;
        this.collection = new ProjectsCollection();
        this.collection.sin = this.sin;
        return this.collection.fetch({
          reset: true
        });
      };

      ProjectPageView.prototype.render = function() {
        var template;
        template = $(_.template(ProjectsPageTemplate)());
        _.each(this.collection.models, function(project) {
          var projec_view;
          projec_view = new ProjectItemView({
            model: project
          });
          return template.find("ul#projects").append(projec_view.render());
        });
        this.$el.html(template.html());
        return this.$el;
      };

      return ProjectPageView;

    })(Backbone.Marionette.ItemView);
  });

}).call(this);
