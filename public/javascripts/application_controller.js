(function() {
  var __hasProp = Object.prototype.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor; child.__super__ = parent.prototype; return child; };

  define(["jquery", "marionette", "config/event_handler", "views/layouts/ablass"], function($, Marionette, EventHandler, Layout, HomeView) {
    var ApplicationController;
    return ApplicationController = (function(_super) {

      __extends(ApplicationController, _super);

      function ApplicationController() {
        ApplicationController.__super__.constructor.apply(this, arguments);
      }

      ApplicationController.prototype.initialize = function(app) {
        this.app = app;
        this.project = {};
        Layout.render();
        return $("body").html(Layout.el);
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
        $("body").append("sinsRoute");
        router = this.app.router;
        return require(["views/sins/page-view"], function(SinsPageView) {
          var mySinsPageView;
          mySinsPageView = new SinsPageView();
          Layout.content.on("show", function() {
            return mySinsPageView.$("ul li.sin_item").click(function() {
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

      ApplicationController.prototype.sinsProjectsRoute = function(sin_id) {
        var router;
        router = this.app.router;
        return require(["views/projects/page-view"], function(ProjectsPageView) {
          var myProjectsPageView;
          myProjectsPageView = new ProjectsPageView({
            sin: sin_id
          });
          Layout.content.on("show", function() {
            return myProjectsPageView.$("ul li.project_item").click(function() {
              return router.navigate("sin/" + sin_id + "/projects/" + this.id, {
                trigger: true
              });
            });
          });
          return myProjectsPageView.collection.on("reset", function() {
            return Layout.content.show(myProjectsPageView);
          });
        });
      };

      ApplicationController.prototype.projectRoute = function(sin_id, project_id) {
        var router;
        router = this.app.router;
        return require(["views/projects/show-view", "models/project"], function(ProjectView, Project) {
          var myProjectView, project;
          project = new Project({
            sin: sin_id,
            id: project_id
          });
          myProjectView = new ProjectView({
            model: project
          });
          myProjectView.model.on("sync", function() {
            return Layout.content.show(myProjectView);
          });
          Layout.content.on("show", function() {
            return myProjectView.$("button.donate").click(function() {
              return router.navigate("/projects/" + project_id + "/amount/" + (project.get("betterplace_id")), {
                trigger: true
              });
            });
          });
          return myProjectView.model.fetch({
            reset: true
          });
        });
      };

      ApplicationController.prototype.amountRoute = function(id, bp_id) {
        return require(["views/amount-view"], function(AmountView) {
          var myAmountView;
          myAmountView = new AmountView();
          myAmountView.setProjectId(id, bp_id);
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
