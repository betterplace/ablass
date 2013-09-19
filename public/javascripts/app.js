(function() {

  define(["backbone", "marionette", "config/event_handler", "router", "application_controller"], function(Backbone, Marionette, EventHandler, Router, ApplicationController) {
    var SingleApp;
    SingleApp = _.once(function() {
      var Ablass;
      if (console) console.log("init_app");
      Ablass = new Backbone.Marionette.Application();
      Ablass.vent = EventHandler;
      Ablass.on("initialize:after", function(options) {
        if (Backbone.history) return Backbone.history.start();
      });
      Ablass.url_root = "http://localhost:3000";
      Ablass.router = new Router({
        controller: new ApplicationController(Ablass)
      });
      return Ablass;
    });
    return SingleApp();
  });

}).call(this);
