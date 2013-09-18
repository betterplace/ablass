(function() {
  var __hasProp = Object.prototype.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor; child.__super__ = parent.prototype; return child; };

  define(["marionette", "config/event_handler", "views/layouts/ablass"], function(Marionette, EventHandler, Layout, HomeView) {
    var ApplicationController;
    return ApplicationController = (function(_super) {

      __extends(ApplicationController, _super);

      function ApplicationController() {
        ApplicationController.__super__.constructor.apply(this, arguments);
      }

      ApplicationController.prototype.initialize = function(app) {
        this.app = app;
        Layout.render();
        return $("body").prepend(Layout.el);
      };

      ApplicationController.prototype.homeRoute = function() {
        return require(["views/home-view"], function(HomeView) {
          var myHomeView;
          myHomeView = new HomeView();
          return Layout.content.show(myHomeView);
        });
      };

      ApplicationController.prototype.sinsRoute = function() {
        var router;
        router = this.app.router;
        return require(["views/sins/page-view"], function(SinsPageView) {
          var mySinsPageView;
          mySinsPageView = new SinsPageView();
          mySinsPageView.on("rendered", function() {
            return this.$("ul li.sin_item").click(function() {
              return router.navigate("sin/" + this.id + "/projects", {
                trigger: true
              });
            });
          });
          return mySinsPageView.collection.on("reset", function() {
            return Layout.content.show(mySinsPageView);
          });
        });
      };

      ApplicationController.prototype.sinsProjectsRoute = function(id) {
        var router;
        router = this.app.router;
        return require(["views/projects/page-view", "fixtures/projects"], function(ProjectsPageView, projects) {
          var myProjectsPageView;
          myProjectsPageView = new ProjectsPageView(projects);
          Layout.content.show(myProjectsPageView);
          return $("ul li.project_item").click(function() {
            return router.navigate("/projects/" + this.id, {
              trigger: true
            });
          });
        });
      };

      ApplicationController.prototype.projectRoute = function(id) {
        var router;
        router = this.app.router;
        return require(["views/projects/show-view", "models/project", "fixtures/projects"], function(ProjectView, Project, projects) {
          var myProjectView, project;
          project = new Project(projects[0]);
          myProjectView = new ProjectView({
            model: project
          });
          Layout.content.show(myProjectView);
          return $("button.donate").click(function() {
            return router.navigate("/projects/" + id + "/amount", {
              trigger: true
            });
          });
        });
      };

      ApplicationController.prototype.amountRoute = function(id) {
        return require(["views/amount-view"], function(AmountView) {
          var myAmountView;
          myAmountView = new AmountView();
          myAmountView.setProjectId(id);
          return Layout.content.show(myAmountView);
        });
      };

      ApplicationController.prototype.donationSuccessRoute = function() {
        return require(["views/success-view"], function(SuccessView) {
          var mySuccessView;
          mySuccessView = new SuccessView();
          return Layout.content.show(mySuccessView);
        });
      };

      return ApplicationController;

    })(Marionette.Controller);
  });

}).call(this);
