define ["jquery", "underscore", "backbone", "text!templates/success.html", "app"], ($, _ , Backbone, SuccessTemplate, App)->

  class DonationSuccessView extends Backbone.View
    initialize: ()->
      @delegateEvents
        "click button.facebook":  "share_facebook"
        "click button.email":     "share_email"
        "click button.angel":     "home"

    render: ()->
      @$el.html( _.template( SuccessTemplate ) )

    share_facebook: ()->
      console.log "facebook"
    share_email: ()->
      console.log "email"
    home: ()->
      console.log "home"