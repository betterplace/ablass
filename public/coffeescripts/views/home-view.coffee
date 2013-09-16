define ["jquery", "underscore", "backbone", "text!templates/home.html", "app"], ($, _ , Backbone, HomeTemplate, App)->

  class HomeView extends Backbone.View
    initialize: ()->
      @delegateEvents
        "click button.sins": "navigateSins"
    render: ()->
      @$el.html( _.template( HomeTemplate ) )

    navigateSins: ()->
      App.router.navigate("sins", { trigger: true })
