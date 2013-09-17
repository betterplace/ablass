define [ "backbone", "marionette", "config/event_handler", "router"], (Backbone, Marionette, EventHandler, Router)->

  SingleApp = _.once ()->
    console.log "init_app" if console
    Ablass =  new Backbone.Marionette.Application() 
    
    Ablass.vent = EventHandler

    Ablass.on "initialize:after", (options)->
      if (Backbone.history)
        Backbone.history.start()

    Ablass
  SingleApp()