(function() {

  define(["backbone", "marionette", "config/event_handler", "router"], function(Backbone, Marionette, EventHandler, Router) {
    var SingleApp;
    SingleApp = _.once(function() {
      var Ablass;
      if (console) console.log("init_app");
      Ablass = new Backbone.Marionette.Application();
      Ablass.vent = EventHandler;
      Ablass.on("initialize:after", function(options) {
        if (Backbone.history) return Backbone.history.start();
      });
      return Ablass;
    });
    return SingleApp();
  });

}).call(this);
