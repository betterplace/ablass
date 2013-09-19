$ ->
  $(".flames").each ->
    select_flame = ->
      amount = $(this).data('amount')
      $(".donation_amount .value").html(amount)

    $("label").click(select_flame)
    $(".flames label")[0].click()
