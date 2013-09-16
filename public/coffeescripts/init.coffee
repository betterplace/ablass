define ["app", "router", "application_controller"], (App, Router, ApplicationController)->

  # Don't forget to re run the initizations of the App
  require ["config/initialize/underscore"], ()->
    {}

  App.router = new Router( {controller: new ApplicationController( App ) } )
  App.start()
  console.log "app started"
  {}