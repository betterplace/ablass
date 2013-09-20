$ ->
  $(".flames").each ->
    set_donation_amount_label = ->
      amount = $("input[type=radio]:checked")[0].value / 100
      $(".donation_amount .value").html(amount)

    $("label, input[type=radio]").click(set_donation_amount_label)
    $(".flames input[type=radio]")[0].click()
