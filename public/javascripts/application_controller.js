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
        return require(["views/sins/page-view", "fixtures/sins"], function(SinsPageView, sins) {
          var mySinsPageView;
          mySinsPageView = new SinsPageView(sins);
          Layout.content.show(mySinsPageView);
          return $("ul li.sin_item").click(function() {
            return router.navigate("sin/" + this.id + "/projects", {
              trigger: true
            });
          });
        });
      };

      ApplicationController.prototype.projectsRoute = function(id) {
        return console.log("projects " + id);
      };

      ApplicationController.prototype.changePage = function() {
        return console.log("changing page");
      };

      return ApplicationController;

    })(Marionette.Controller);
  });

}).call(this);