(function() {

  define(["app", "router", "application_controller"], function(App, Router, ApplicationController) {
    require(["config/initialize/underscore"], function() {
      return {};
    });
    App.router = new Router({
      controller: new ApplicationController(App)
    });
    App.start();
    if (console) console.log("app started");
    return {};
  });

}).call(this);
