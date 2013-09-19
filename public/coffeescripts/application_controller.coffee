define [ "jquery", "marionette", "config/event_handler", "views/layouts/ablass"], ( $, Marionette, EventHandler, Layout, HomeView)->

  class ApplicationController extends Marionette.Controller

    initialize: ( app )->
      @app = app
      @project = {}
      Layout.render()
      $("body").html(Layout.el);

    homeRoute: ()->
      require ["views/home-view"], (HomeView)->
        myHomeView = new HomeView()
        Layout.content.show( myHomeView )

    sinsRoute: ()->
      $("body").append("sinsRoute")
      router = @app.router
      require ["views/sins/page-view"], (SinsPageView)->
        mySinsPageView = new SinsPageView()
        Layout.content.on "show", ()->
          # This should be inside the SinItemView but it's not responding because the object is not yet in the DOM
          # There is a need to refactor this if the list become more complex
          mySinsPageView.$("ul li.sin_item").click ()->
            router.navigate("sin/#{@id}/projects", {trigger: true })

        # Listening the event collection fetch to render the page
        mySinsPageView.collection.on "reset", ()->
          Layout.content.show( mySinsPageView )

    sinsProjectsRoute: (sin_id)->
      router = @app.router
      require ["views/projects/page-view"], (ProjectsPageView)->
        myProjectsPageView = new ProjectsPageView( {sin: sin_id} )

        Layout.content.on "show", ()->
          # This should be inside the ProjectsPageView but it's not responding because the object is not yet in the DOM
          # There is a need to refactor this if the list become more complex
          myProjectsPageView.$("ul li.project_item").click ()->
            router.navigate("sin/#{sin_id}/projects/#{@id}", {trigger: true })

        myProjectsPageView.collection.on "reset", ()->
          Layout.content.show( myProjectsPageView )

    projectRoute: (sin_id, project_id)->
      router = @app.router

      require ["views/projects/show-view", "models/project"], (ProjectView, Project)->
        project = new Project( { sin: sin_id, id: project_id} )
        myProjectView = new ProjectView( model: project )
        myProjectView.model.on "sync", ()->
          Layout.content.show( myProjectView )

        Layout.content.on "show", ()->
          myProjectView.$("button.donate").click ()->
            router.navigate("/projects/#{project_id}/amount/#{project.get("betterplace_id")}", {trigger: true })

        myProjectView.model.fetch( {reset: true} )



    amountRoute: (id, bp_id)->
      require ["views/amount-view"], (AmountView)->
        myAmountView = new AmountView()
        myAmountView.setProjectId( id, bp_id )
        Layout.content.show( myAmountView )


    donationSuccessRoute: ()->
      require ["views/success-view"], (SuccessView)->
        mySuccessView = new SuccessView()
        Layout.content.show( mySuccessView )
