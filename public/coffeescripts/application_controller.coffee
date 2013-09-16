define [ "marionette", "config/event_handler", "views/layouts/ablass"], ( Marionette, EventHandler, Layout, HomeView)->
  
  class ApplicationController extends Marionette.Controller
    
    initialize: ( app )->
      @app = app
      Layout.render()
      $("body").prepend(Layout.el);

    homeRoute: ()->
      require ["views/home-view"], (HomeView)->
        myHomeView = new HomeView()
        Layout.content.show( myHomeView )
    sinsRoute: ()->
      router = @app.router
      require ["views/sins/page-view", "fixtures/sins"], (SinsPageView, sins)->
        mySinsPageView = new SinsPageView( sins )
        Layout.content.show( mySinsPageView )

        # This should be inside the SinItemView but it's not responding because the object is not yet in the DOM
        # There is a need to refactor this if the list become more complex
        $("ul li.sin_item").click ()->
          router.navigate("sin/#{@id}/projects", {trigger: true })

    projectsRoute: (id)->
      console.log "projects #{id}"

    changePage: ()->
      console.log "changing page"
