define ["jquery", "underscore", "backbone", "text!templates/amount.html", "app"], ($, _ , Backbone, AmountTemplate, App)->

  class AmountView extends Backbone.View
    
    initialize: ()->
      @delegateEvents
        "click button.donate":  "navigateToBetterplace"
        "click button.small":   "smallSins"
        "click button.medium":  "mediumSins"
        "click button.large":   "largeSins"

    render: ()->
      @$el.html( _.template( AmountTemplate ) )

    setProjectId: (project_id)->
      @project_id = project_id

    navigateToBetterplace: ()->
      amount = @$("input").val()
      window.location.href =  "https://www.bp42.com/en/projects/#{@project_id}/client_donations/new?client_id=ablass&amount=#{amount}"

    smallSins: ()->
      @$("input").val("5")

    mediumSins: ()->
      @$("input").val("15")

    largeSins: ()->
      @$("input").val("25")

