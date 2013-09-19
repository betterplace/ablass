define [ "backbone", "marionette", "config/event_handler", "router", "application_controller" ], (Backbone, Marionette, EventHandler, Router, ApplicationController)->

  SingleApp = _.once ()->
    console.log "init_app" if console
    Ablass =  new Backbone.Marionette.Application()

    Ablass.vent = EventHandler

    Ablass.on "initialize:after", (options)->
      if (Backbone.history)
        Backbone.history.start()

    Ablass.url_root = "http://localhost:3000"

    Ablass.router = new Router( {controller: new ApplicationController( Ablass ) } )

    Ablass
  SingleApp()